package util;
import org.hibernate.*;
import org.hibernate.cfg.Configuration;
public class HibernateUtil 
{
static SessionFactory sf = new Configuration().configure().buildSessionFactory();
public static SessionFactory getFactory()
	{ 
		return sf; 
	}
}