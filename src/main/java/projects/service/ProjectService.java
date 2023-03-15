package projects.service;

import java.util.List;
import java.util.NoSuchElementException;
import java.util.stream.Collectors;

import projects.dao.ProjectDao;
import projects.entity.Project;

public class ProjectService {

	private ProjectDao projectDao = new ProjectDao();

	public Project addProject(Project project) {
		return projectDao.insertProject(project);
	}

	public List<Project> fetchAllProjects() {
		return projectDao.fetchAllProjects()
		// @formatter:off
					.stream()
					.sorted((p1, p2) -> p1.getProjectId() - p2.getProjectId())
					.collect(Collectors.toList());
				// @formatter:on

	}

	public Project fetchProjectById(Integer projectId) {
		return projectDao.fetchProjectById(projectId).orElseThrow(
				() -> new NoSuchElementException("Project with project Id=" + projectId + "does not exist."));
	}
}
