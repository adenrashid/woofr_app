def run_sql(sql, params = [])
    db = PG.connect(ENV['DATABASE_URL'] || {dbname: 'woofr'})
    results = db.exec_params(sql, params)
    db.close 
    return results
end

def create_user(name, email, password_digest)
    sql = "INSERT INTO users (name, email, password_digest) values ($1, $2, $3);"
    run_sql(sql, [name, email, password_digest])
end 

def find_user_by_id(id)
    sql = "SELECT * FROM users WHERE id = $1;"
    results = run_sql(sql, [id])
    return results[0]
end 

def create_post(post_text, image, feeling, user_id, date_created, time_created)
    sql = "INSERT INTO posts (post_text, image, feeling, user_id, date_created, time_created) VALUES ($1, $2, $3, $4, $5, $6);"
    run_sql(sql, [post_text, image, feeling, user_id, date_created, time_created])
end 

def find_user_by_email(email)
    sql = "SELECT * FROM users WHERE email = $1;"
    results = run_sql(sql, [email])
    return results[0]
end 

def find_post_by_id(id)
    sql = "SELECT * FROM posts WHERE id = $1;"
    results = run_sql(sql, [id])
    return results[0]
end 

def find_comment_by_id(id)
    sql = "SELECT * FROM comments WHERE id = $1;"
    results = run_sql(sql, [id])
    return results[0]
end 

def create_comment(user_id, post_id, comment)
    sql = "INSERT INTO comments (user_id, post_id, comment) VALUES ($1, $2, $3);"
    run_sql(sql, [user_id, post_id, comment])
end 