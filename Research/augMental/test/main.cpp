#include <GL/glut.h>

void changeSize(int w, int h) 
{
  if (h == 0)
    h = 1;
  float ratio =  w * 1.0 / h;
  
  glMatrixMode(GL_PROJECTION);
  glLoadIdentity();
  glViewport(0, 0, w, h);
  gluPerspective(45.0f, ratio, 0.1f, 100.0f);
  glMatrixMode(GL_MODELVIEW);
}

void drawSphere() 
{ 
  glColor3f(1.0f, 1.0f, 1.0f);
  
  glTranslatef(0.0f ,0.0f, 0.0f);
  glutWireSphere(0.75f,20,20);
}

void renderScene(void) 
{ 
  glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
  
  glLoadIdentity();
  
  gluLookAt(	5.0f, 0.0f, 0.0f,
		0.0f, 0.0f, 0.0f,
		0.0f, 1.0f, 0.0f);
  
  drawSphere();

  glutSwapBuffers();
}

void processNormalKeys(unsigned char key, int x, int y) 
{
  if (key == 27) { exit(0); }
}

int main(int argc, char** argv)
{
    glutInit(&argc, argv);
    glutInitDisplayMode(GLUT_DEPTH | GLUT_DOUBLE | GLUT_RGBA);
    glutInitWindowSize(640, 480);
    glutInitWindowPosition(100, 100);
    glutCreateWindow("u wot m8");
    
    glutDisplayFunc(renderScene);
    glutReshapeFunc(changeSize);
    glutIdleFunc(renderScene);
    glutKeyboardFunc(processNormalKeys);
    
    glEnable(GL_DEPTH_TEST);

    glutMainLoop();
    
    return 0;
}
