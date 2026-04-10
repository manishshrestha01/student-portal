import 'package:flutter/material.dart';
import 'package:codeit_app/view/course/menu_tile/course_section.dart';
import 'package:codeit_app/view/course/menu_tile/section_expansion_tile.dart';

class CurriculumMenuTile extends StatefulWidget {
  const CurriculumMenuTile({super.key});

  @override
  State<CurriculumMenuTile> createState() => _CurriculumMenuTileState();
}

class _CurriculumMenuTileState extends State<CurriculumMenuTile> {
  bool expanded = false;

  final List<CourseSection> sections = [
    CourseSection(
      number: 1,
      title: "Introduction to Web Design",
      lessons: [
        "Welcome & Curriculum Overview",
        "How The Web Works",
        "Installing The Tools We Need",
        "A First Taste of HTML & CSS",
        "The Roles of HTML, CSS, and JS",
        "Configuring VSCode",
      ],
    ),

    CourseSection(
      number: 2,
      title: "HTML",
      lessons: [
        "Introduction",
        "HTML Attributes",
        "HTML Comments",
        "HTML Paragraphs",
        "HTML Images",
        "Page Title",
        "Lists",
        "Divs",
        "HTML vs XHTML",
        "HTML Elements",
        "Document Structure",
        "HTML Headings",
        "HTML Links",
        "Favicon",
        "Tables",
        "HTML Block & Inline Elements",
        "Span",
      ],
    ),
    CourseSection(
      number: 3,
      title: "HTML Layouts",
      lessons: ["Header", "Section", "Aside", "Nav", "Article", "Footer"],
    ),
    CourseSection(
      number: 4,
      title: "HTML Forms",
      lessons: [
        "Forms",
        "Form Elements",
        "Input Attributes",
        "Form Attributes",
        "Input Types",
        "Input Form Attributes",
      ],
    ),
    CourseSection(
      number: 5,
      title: "CSS",
      lessons: [
        "Introduction",
        "Internal CSS",
        "CSS Colors",
        "Inline CSS",
        "External CSS",
        "CSS Selectors",
      ],
    ),
    CourseSection(
      number: 6,
      title: "More CSS",
      lessons: [
        "CSS Flexbox",
        "CSS Animations",
        "CSS Grid",
        "Responsive Design",
      ],
    ),
    CourseSection(
      number: 7,
      title: "Tailwind CSS",
      lessons: [
        "Introduction",
        "Editor Setup",
        "Hover, Focus & Other States",
        "Reusing Styles",
        "Functions & Directives",
        "Aspect Ratio",
        "Columns",
        "Grid",
        "Sizing",
        "Backgrounds",
        "Effects",
        "Transformations",
        "Installation",
        "Utility-First Fundamentals",
        "Responsive Design",
        "Dark Mode",
        "Layouts",
        "Container",
        "Flexbox",
        "Spacing",
        "Typography",
        "Border",
        "Filters",
      ],
    ),
    CourseSection(
      number: 8,
      title: "Javascript",
      lessons: [
        "Introduction",
        "JS Constants",
        "Arrays",
        "Types of Functions",
        "Control Flow",
        "JS Variables",
        "Objects",
        "Functions",
        "Operators",
      ],
    ),
    CourseSection(
      number: 9,
      title: "Understanding the DOM and Event Handling",
      lessons: [
        "Basic DOM manipulation",
        "Event listeners and event handling",
        "CSS Grid",
        "Responsive Design",
      ],
    ),
    CourseSection(
      number: 10,
      title: "Understanding the DOM and Event Handling",
      lessons: [
        "Callback functions",
        "Event loop and asynchronous programming",
        "Promises and async/await",
        "Error handling (try,catch,finally)",
      ],
    ),
    CourseSection(
      number: 11,
      title: "Working with Objects and Arrays",
      lessons: [
        "Object properties and methods",
        "Destructuring assignments",
        "Array methods (map,filter,forEach,find)",
        "Spread and rest operators",
      ],
    ),
    CourseSection(
      number: 12,
      title: "Modules and ES6+ Features",
      lessons: [
        "Importing and exporting modules",
        "Default parameters",
        "Enhanced object literals",
        "Template literals",
        "Object and array destructuring",
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 8)],
      ),
      child: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.menu_book),
            title: const Text("Course Curriculum"),
            trailing: Icon(
              expanded ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_right,
            ),
            onTap: () {
              setState(() {
                expanded = !expanded;
              });
            },
          ),

          if (expanded)
            Column(
              children: sections
                  .map((section) => SectionExpansionTile(section: section))
                  .toList(),
            ),
        ],
      ),
    );
  }
}
