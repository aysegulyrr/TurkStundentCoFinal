-- 1. Üyeler (Members)
CREATE TABLE Members (
    member_id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    registration_date TIMESTAMP NOT NULL,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

-- 2. Eğitimler (Courses)
CREATE TABLE Courses (
    course_id SERIAL PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    description TEXT,
    start_date DATE,
    end_date DATE,
    instructor VARCHAR(100)
);

-- 3. Kategoriler (Categories)
CREATE TABLE Categories (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
);

-- 4. Eğitim - Kategori İlişkisi
CREATE TABLE CourseCategories (
    course_id INTEGER REFERENCES Courses(course_id) ON DELETE CASCADE,
    category_id INTEGER REFERENCES Categories(category_id) ON DELETE CASCADE,
    PRIMARY KEY (course_id, category_id)
);

-- 5. Katılımlar (Enrollments)
CREATE TABLE Enrollments (
    enrollment_id SERIAL PRIMARY KEY,
    member_id INTEGER REFERENCES Members(member_id) ON DELETE CASCADE,
    course_id INTEGER REFERENCES Courses(course_id) ON DELETE CASCADE,
    enrollment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 6. Sertifikalar (Certificates)
CREATE TABLE Certificates (
    certificate_id SERIAL PRIMARY KEY,
    certificate_code VARCHAR(100) UNIQUE NOT NULL,
    issue_date DATE NOT NULL
);

-- 7. Sertifika Atamaları (CertificateAssignments)
CREATE TABLE CertificateAssignments (
    assignment_id SERIAL PRIMARY KEY,
    member_id INTEGER REFERENCES Members(member_id) ON DELETE CASCADE,
    certificate_id INTEGER REFERENCES Certificates(certificate_id) ON DELETE CASCADE,
    received_date DATE
);

-- 8. Blog Gönderileri (BlogPosts)
CREATE TABLE BlogPosts (
    post_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    publish_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    author_id INTEGER REFERENCES Members(member_id) ON DELETE SET NULL
);
