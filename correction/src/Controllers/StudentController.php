<?php

require_once __DIR__ . '/../Services/Response.php';

class StudentController
{
    use Response;

    public function index()
    {
        $studentRepository = new StudentRepository();
        $students = $studentRepository->getAll();

        $viewData = [
            'students' => $students
        ];

        $this->render('StudentListTemplate', $viewData);
    }
}
