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

def create_post(post_text, image, feeling, user_id)
    sql = "insert into posts (post_text, image, feeling, user_id) values ($1, $2, $3, $4);"
    run_sql(sql, [post_text, image, feeling, user_id])
end 