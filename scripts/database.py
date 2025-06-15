import os
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
from dotenv import load_dotenv

# Load environment variables
load_dotenv()

class DatabaseConnection:
    def __init__(self):
        # MySQL connection string format
        self.db_url = os.getenv('DATABASE_URL', 'mysql+pymysql://username:password@localhost:3306/ipl_2025')
        self.engine = None
        self.Session = None

    def connect(self):
        """Create database connection"""
        try:
            self.engine = create_engine(
                self.db_url,
                pool_size=5,
                max_overflow=10,
                pool_timeout=30,
                pool_recycle=1800
            )
            self.Session = sessionmaker(bind=self.engine)
            return True
        except Exception as e:
            print(f"Error connecting to database: {str(e)}")
            return False

    def get_session(self):
        """Get database session"""
        if not self.Session:
            self.connect()
        return self.Session()

    def execute_query(self, query, params=None):
        """Execute a SQL query"""
        try:
            with self.engine.connect() as connection:
                result = connection.execute(query, params or {})
                return result.fetchall()
        except Exception as e:
            print(f"Error executing query: {str(e)}")
            return None

    def close(self):
        """Close database connection"""
        if self.engine:
            self.engine.dispose()

# Example usage
if __name__ == "__main__":
    db = DatabaseConnection()
    if db.connect():
        print("Successfully connected to MySQL database")
        
        # Example query
        query = "SELECT * FROM teams"
        results = db.execute_query(query)
        if results:
            for row in results:
                print(row)
        
        db.close() 