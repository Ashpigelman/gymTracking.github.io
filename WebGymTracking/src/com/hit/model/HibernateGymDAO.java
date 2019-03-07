package com.hit.model;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

/**
 * HibernateGymDAO - implements IGymDAO interface,represent the methods for users and activity action.
 */

public class HibernateGymDAO implements IGymDAO {
	
	private static final HibernateGymDAO INSTANCE = new HibernateGymDAO();
	private SessionFactory factory;
	
	private HibernateGymDAO()
	{
		if(INSTANCE != null){
			throw new IllegalStateException("HibernateGymDAO was already instantiated");
		}
		try {
			Configuration configuration = new Configuration().configure(); 
	        factory = configuration.buildSessionFactory();
		}
		catch(Exception e) {
			System.out.println("HibernateGymDAO Error: "+e.getMessage());
		}	

	}
	
	public static HibernateGymDAO getInstance()
	{
		return INSTANCE;
	}

	/**
	 *Checks whether a user has been added successfully
	 */
	@Override
	public boolean addUser(User userToAdd) throws ExceptionGymDAO {
		Session session = null;
		boolean result = false;
		Transaction transaction = null;
		
		if(!isUserExist(userToAdd)){
			try {
				session = factory.openSession();
                transaction = session.beginTransaction();
                session.save(userToAdd);
                transaction.commit();
                result = true;
			}
			catch(HibernateException exception) {
				rollbackTrasaction(transaction);
                throw new ExceptionGymDAO(exception.getMessage(), exception.getCause());
			}
			finally {
				closeSession(session);
			}
		}
		return result;
	}

	/**
	 * Checks whether user deletion was successful
	 */
	@Override
	public boolean deleteUser(User UserNameToDelete) throws ExceptionGymDAO {
		Session session = null;
		boolean result = false;
		Transaction transaction = null;
		
		if (isUserExist(UserNameToDelete)) {
            try {
                session = factory.openSession();
                transaction = session.beginTransaction();
                List<Activity> listOfActivities = findUserActivity(UserNameToDelete);
                for (Activity activity : listOfActivities) {
                    session.delete(activity);
                }
                session.delete(UserNameToDelete);
                transaction.commit();
                result = true;
            }
            catch(HibernateException exception) {
                rollbackTrasaction(transaction);
                throw new ExceptionGymDAO(exception.getMessage(), exception.getCause());
            }
            finally {
                closeSession(session);
            }
		}
    return result;
    
	}

	/**
	 * Checks whether a user(password&weight&height) update was successful
	 */
	@Override
	public boolean updateUser(User userToUpdate, String passwordToChange, int weightToChange, int heightToChange)
			throws ExceptionGymDAO {
		Session session = null;
		boolean result = false;
		Transaction transaction = null;
		
		if (isUserExist(userToUpdate)) {
            try {
                session = factory.openSession();
                transaction = session.beginTransaction();
                userToUpdate.setPassword(passwordToChange);
                userToUpdate.setWeight(weightToChange);
                userToUpdate.setHeight(heightToChange);
                session.update(userToUpdate);
                transaction.commit();
                result = true;
            }
            catch(HibernateException exception) {
                rollbackTrasaction(transaction);
                throw new ExceptionGymDAO(exception.getMessage(), exception.getCause());
            }
            finally {
                closeSession(session);
            }
		}
    return result;
	}
	
	/**
	 * Checks whether the user password update was successful
	 */
	@Override
	public boolean updatePassword(User userToUpdate,String passwordToChange) throws ExceptionGymDAO {
		Session session = null;
		boolean result = false;
		Transaction transaction = null;
		
		if (isUserExist(userToUpdate)) {
            try {
                session = factory.openSession();
                transaction = session.beginTransaction();
                userToUpdate.setPassword(passwordToChange);
                session.update(userToUpdate);
                transaction.commit();
                result = true;
            }
            catch(HibernateException exception) {
                rollbackTrasaction(transaction);
                throw new ExceptionGymDAO(exception.getMessage(), exception.getCause());
            }
            finally {
                closeSession(session);
            }
		}
    return result;	
	}
	
	/**
	 * Checks whether the user weight&height update was successful
	 */
	@Override
	public boolean updateWeightAndHeight(User userToUpdate,int weightToChange,int heightToChange) throws ExceptionGymDAO{
		Session session = null;
		boolean result = false;
		Transaction transaction = null;
		
		if (isUserExist(userToUpdate)) {
            try {
                session = factory.openSession();
                transaction = session.beginTransaction();
                userToUpdate.setWeight(weightToChange);
                userToUpdate.setHeight(heightToChange);
                session.update(userToUpdate);
                transaction.commit();
                result = true;
            }
            catch(HibernateException exception) {
                rollbackTrasaction(transaction);
                throw new ExceptionGymDAO(exception.getMessage(), exception.getCause());
            }
            finally {
                closeSession(session);
            }
		}
    return result;	
	}

	/**
	 * Returns a list of all users
	 */
	@Override
	public List<User> findAllUsers() throws ExceptionGymDAO {
		Session session = null;
		Transaction transaction = null;
		List users = new ArrayList<User>();
		
		try {
			session = factory.openSession();
			transaction = session.beginTransaction();
			users = session.createQuery("from User").list();
			transaction.commit();
		}
        catch(HibernateException exception) {
            rollbackTrasaction(transaction);
            throw new ExceptionGymDAO(exception.getMessage(), exception.getCause());
        }
        finally {
            closeSession(session);
        }
		return users;
	}

	/**
	 * Checks if the user exists
	 */
	@Override
	public boolean isUserExist(User user) throws ExceptionGymDAO {
		Session session = null;
		boolean exist = false;
		
		try {
			session = factory.openSession();
			Object object = session.get(user.getClass(), user.getUserName());
			exist = object != null ;
		}
		catch(HibernateException exception) {
            throw new ExceptionGymDAO(exception.getMessage(), exception.getCause());
        }
        finally {
            closeSession(session);
        }
		return exist;
		
	}

	/**
	 * Searching for user by username
	 */
	@Override
	public User searchUser(String userName) throws ExceptionGymDAO {
		Session session = null;
		Transaction transaction = null;
		User user = null ;
		try {
			session = factory.openSession();
            transaction = session.beginTransaction();
            user = (User)session.get(User.class, userName);
            if(user != null) {
            	transaction.commit();
            }
		}
		catch(HibernateException exception) {
            rollbackTrasaction(transaction);
            throw new ExceptionGymDAO(exception.getMessage(), exception.getCause());
        }
        finally {
            closeSession(session);
        }
		return user;
	}
	
	/**
	 * Checks if the password is correct for the correct user
	 */
	@Override
	public boolean searchUserBool(String userName,String password) throws ExceptionGymDAO{
		boolean userExist = false;
		User user = searchUser(userName);
		if(user != null) {
			if(user.getPassword().equals(password)) {
				userExist = true;
			}
		}
		return userExist;
	}


	/**
	 * Checks integrity of login
	 */
	@Override
	public boolean login(String userName, String password) throws ExceptionGymDAO {
		Session session = null;
		Transaction transaction = null;
		
		try {
			session = factory.openSession();
            transaction = session.beginTransaction();
            Query query = session.createQuery("from User user where user.userName= :userName AND user.password= :password");
            query.setParameter("userName", userName);
            query.setParameter("password", password);
        	transaction.commit();
        	List<User> users = query.list();
        	return (users != null && !users.isEmpty());
		}
		catch(HibernateException exception) {
            rollbackTrasaction(transaction);
            throw new ExceptionGymDAO(exception.getMessage(), exception.getCause());
        }
        finally {
            closeSession(session);
        }
	}


	/**
	 * Returns a list of all user activities
	 */
	@Override
	public List<Activity> findUserActivity(User user) throws ExceptionGymDAO {
		Session session = null;
		Transaction transaction = null;
		List<Activity> listOfActivities = new ArrayList<Activity>();
		
		if(isUserExist(user)) {
			try {
				session=factory.openSession();
				transaction = session.beginTransaction();
				Query query = session.createQuery("From Activity WHERE userName = :userName ");
				query.setParameter("userName", user.getUserName() );
				listOfActivities = query.list();
			}
			catch(HibernateException exception) {
	            rollbackTrasaction(transaction);
	            throw new ExceptionGymDAO(exception.getMessage(), exception.getCause());
	        }
	        finally {
	            closeSession(session);
	        }
		}
		return listOfActivities;
	}

	/**
	 * Checks whether a new activity added successful 
	 */
	@Override
	public boolean addActivity(Activity activityToAdd) throws ExceptionGymDAO {
		Session session = null;
		boolean result = false;
		Transaction transaction = null;
		
		if(!isActivityExist(activityToAdd)) {
			try {
				session = factory.openSession();
                transaction = session.beginTransaction();
                session.save(activityToAdd);
                transaction.commit();
                result = true;
			}
			catch(HibernateException exception) {
				rollbackTrasaction(transaction);
                throw new ExceptionGymDAO(exception.getMessage(), exception.getCause());
			}
			finally {
				closeSession(session);
			}
		}
		return result;
	}

	/**
	 * Checks whether activity deleted successful 
	 */
	@Override
	public boolean deleteActivity(Activity activityToDelelte) throws ExceptionGymDAO {
		Session session = null;
		boolean result = false;
		Transaction transaction = null;
		
		if (isActivityExist(activityToDelelte)) {
            try {
                session = factory.openSession();
                transaction = session.beginTransaction();
                session.delete(activityToDelelte);
                transaction.commit();
                result = true;
            }
            catch(HibernateException exception) {
                rollbackTrasaction(transaction);
                throw new ExceptionGymDAO(exception.getMessage(), exception.getCause());
            }
            finally {
                closeSession(session);
            }
		}
    return result;
	}

	/**
	 * Checks whether an activity(trainingDay,sets,reps) update was successful
	 */
	@Override
	public boolean updateActivity(Activity activityToUpdate,String changeTrainingDay, int changeSets, int changeReps) throws ExceptionGymDAO {
		Session session = null;
		boolean result = false;
		Transaction transaction = null;
		
		if (isActivityExist(activityToUpdate)) {
            try {
                session = factory.openSession();
                transaction = session.beginTransaction();
                activityToUpdate.setTrainingDay(changeTrainingDay);
                activityToUpdate.setNumberOfSets(changeSets);
                activityToUpdate.setNumberOfReps(changeReps);
                session.update(activityToUpdate);
                transaction.commit();
                result = true;
            }
            catch(HibernateException exception) {
                rollbackTrasaction(transaction);
                throw new ExceptionGymDAO(exception.getMessage(), exception.getCause());
            }
            finally {
                closeSession(session);
            }
		}
    return result;
	}
	
	/**
	 * Checks whether the activity exists
	 */
	@Override
	public boolean isActivityExist(Activity activity) throws ExceptionGymDAO {
		Session session = null;
		boolean exist = false;
		Object object = null;
		
		try {
			session = factory.openSession();
			object = session.get(activity.getClass(), activity.getActivityId());
			exist = object != null;
		}
		catch(HibernateException exception) {
            throw new ExceptionGymDAO(exception.getMessage(), exception.getCause());
        }
        finally {
            closeSession(session);
        }
		return exist;
	}

	/**
	 * Returns a list of all activities
	 */
	@Override
	public List<Activity> findAllActivity() throws ExceptionGymDAO {
		Session session = null;
		Transaction transaction = null;
		List activitys = new ArrayList<Activity>();
		
		try {
			session = factory.openSession();
			transaction = session.beginTransaction();
			activitys = session.createQuery("from Activity").list();
			transaction.commit();
		}
        catch(HibernateException exception) {
            rollbackTrasaction(transaction);
            throw new ExceptionGymDAO(exception.getMessage(), exception.getCause());
        }
        finally {
            closeSession(session);
        }
		return activitys;
	}

	/**
	 * searches for activity by ID
	 */
	@Override
	public Activity searchActivity(int id) throws ExceptionGymDAO {
		Session session = null;
		Transaction transaction = null;
		Activity activity = null;
		try {
			session = factory.openSession();
			transaction = session.beginTransaction();
			activity = (Activity)session.get(Activity.class, id);
		}
        catch(HibernateException exception) {
            rollbackTrasaction(transaction);
            throw new ExceptionGymDAO(exception.getMessage(), exception.getCause());
        }
        finally {
            closeSession(session);
        }
		return activity;
	}
	
	/**
	 * roll back Trasaction
	 * @param transaction
	 */
	private void rollbackTrasaction(Transaction transaction) {
		if(transaction != null) {
			transaction.rollback();
		}
		
	}
	
	/**
	 * close Session
	 * @param session
	 * @throws ExceptionGymDAO
	 */
	private void closeSession(Session session) throws ExceptionGymDAO {
		if(session != null && session.isOpen()) {
			try {
				session.close();
			}
			catch(HibernateException exception) {
                throw new ExceptionGymDAO(exception.getMessage(), exception.getCause());
			}
		}
		
	}
	

}
