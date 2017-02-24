#pragma once

#include "platform.h"
#include "tangram.h"
#include <GLFW/glfw3.h>
#include <memory>

namespace Tangram {

namespace GlfwApp {

    void create(std::shared_ptr<Platform> platform, std::string sceneFile, int width, int height);
    void destroy();

    void run();
    void stop(int);

    void mouseButtonCallback(GLFWwindow* window, int button, int action, int mods);
    void cursorMoveCallback(GLFWwindow* window, double x, double y);
    void scrollCallback(GLFWwindow* window, double scrollx, double scrolly);
    void keyCallback(GLFWwindow* window, int key, int scancode, int action, int mods);
    void dropCallback(GLFWwindow* window, int count, const char** paths);
    void framebufferResizeCallback(GLFWwindow* window, int fWidth, int fHeight);

} // namespace GlfwApp

} // namespace Tangram
