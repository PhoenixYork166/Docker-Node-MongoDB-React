<h1>DevOps Docker</h1>
<p>Welcome to learning docker together!</p>
<br>
<img src="./images/Docker.png" alt="Docker">
<img src="./images/node-mongodb-react-docker.jpg" alt="node-mongodb-react-docker" title="Node MongoDB React Docker" width="800" height="450" />
<br>
<h1>Before Started</h1>
<h1>1: What is Docker</h1>
<h2>Containerization</h2>
<p>• Containers: Lightweight, standalone, and executable software packages that include everything needed to run a piece of software, including the code, runtime, system tools, libraries, and settings. Containers are isolated from each other and the host system, ensuring that applications run consistently across different environments.</p>

<p>• Images: Templates used to create containers. An image includes the application code, libraries, dependencies, and tools needed to run the application. Once an image is created, it can be stored in a registry and used to instantiate containers. A single version of an application or component stored in a repository. Each image is identified by a unique name and tag combination, such as myapp:latest or myapp:v1.2.</p>

<p>• Registry: A Docker registry is a storage and distribution system for Docker images. It is where Docker images are stored, managed, and retrieved from when needed to create containers.</p>

<p>• Repository: A collection of related Docker images, often representing different versions of an application. For example, a repository for an application might contain images tagged with different versions (e.g., v1.0, v1.1, latest).</p>

<p>• Tag: Labels or identifiers used to differentiate between different versions of images within the same repository. For example, nginx:latest and nginx:1.19.6 are two different tags of the same repository.</p>

<p>• Dockerfile: A script that contains a series of instructions on how to build a Docker image. It specifies the base image to use, the commands to run, files to copy, and environment variables to set, among other things.</p>

<img src="./images/docker_illustration.png" alt="Docker Illustration">

<h2>Benefits of Docker</h2>
<p>• Portability: Since containers encapsulate everything the application needs to run, they can be moved easily between different environments (e.g., development, testing, production) without worrying about environmental inconsistencies.</p>

<p>• Efficiency: Containers are more lightweight than virtual machines (VMs) because they share the host system's kernel, leading to faster startup times and reduced resource usage. </p>

<p>• Scalability: Docker supports rapid scaling of applications by deploying multiple containers across clusters, making it easier to manage and orchestrate large-scale applications.</p>

<img src="./images/Docker_anywhere.png" alt="Docker Anywhere">

<h2>2: Containers vs. Virtual Machines</h2>
<p>• VMs: Virtual machines run a complete operating system (OS) on top of a hypervisor, which makes them heavier and slower to start compared to containers.</p>
<p>• Containers: Share the host OS kernel, making them lightweight, faster to start, and easier to manage, but they provide a level of isolation that might be less secure compared to VMs.

<img src="./images/Docker_VS_VM.png" alt="Docker VS VM">

<h1>3: How can I run Docker</h1>
<h2>Docker Engine</h2>
<p>• Docker Daemon: The background service running on the host that manages Docker containers, images, networks, and volumes.</p>
<p>• Docker CLI: A command-line interface that allows users to interact with Docker Daemon through commands.: The background service running on the host that manages Docker containers, images, networks, and volumes.</p>
<p>• Docker API: A REST API that provides a way to interact with Docker Daemon programmatically.</p>

<h1>4: Download Docker Now</h1>
<a href="https://docs.docker.com/engine/install/ubuntu">Download Docker Now!</a>
<p>We will use AWS EC2 Ubuntu AMI as the host OS in the follwing lab.</p>
