//
//  Calculator.swift
//  Dive Planner
//
//  Created by PeroPeroMan on 2015/07/27.
//  Copyright © 2015年 TMDC. All rights reserved.
//

import Foundation

class Calculator {
    private var group_matrix: [(begin: Float, end: Float, min: [(begin: Int, end: Int, group: String)])] = []
    private var repeat_group_matrix: [String: [(begin: Float, end: Float, time: (rnt: Int, abt: Int))]] = [:]
    private var surface_interval_group: [String: [(begin: Int, end: Int, group: String)]] = [:]
    
    init () {
        setGroupMatrix()
        setRepeatGroupMatirx()
        setSurfaceIntervalGroup()
    }
    
    private func setGroupMatrix() {
        let depth10: [(begin: Int, end: Int, group: String)] = [(0,10,"A"),(11,20,"B"),(21,26,"C"),(27,30,"D"),(31,34,"E"),(35,37,"F"),(38,41,"G"),(42,45,"H"),(46,50,"I"),(51,54,"J"),(55,59,"K"),(60,64,"L"),(65,70,"M"),(71,75,"N"),(76,82,"O"),(83,88,"P"),(89,95,"Q"),(96,104,"R"),(105,112,"S"),(113,122,"T"),(123,133,"U"),(134,145,"V"),(146,160,"W"),(161,178,"X"),(179,199,"Y"),(200,219,"Z")]
        
        let depth12: [(begin: Int, end: Int, group: String)] = [(0,9,"A"),(10,17,"B"),(18,23,"C"),(24,26,"D"),(27,29,"E"),(30,32,"F"),(33,35,"G"),(36,38,"H"),(39,42,"I"),(43,45,"J"),(46,49,"K"),(50,53,"L"),(54,57,"M"),(58,62,"N"),(63,66,"O"),(67,71,"P"),(72,76,"Q"),(77,82,"R"),(83,88,"S"),(89,94,"T"),(95,101,"U"),(102,108,"V"),(109,116,"W"),(117,125,"X"),(126,134,"Y"),(135,147,"Z")]
        
        let depth14: [(begin: Int, end: Int, group: String)] = [(0,8,"A"),(9,15,"B"),(16,19,"C"),(20,22,"D"),(23,24,"E"),(25,27,"F"),(28,29,"G"),(30,32,"H"),(33,35,"I"),(36,37,"J"),(38,40,"K"),(41,43,"L"),(44,47,"M"),(48,50,"N"),(51,53,"O"),(54,57,"P"),(58,61,"Q"),(62,64,"R"),(65,68,"S"),(69,73,"T"),(74,77,"U"),(78,82,"V"),(83,87,"W"),(88,92,"X"),(93,98,"Y")]
        
        let depth16: [(begin: Int, end: Int, group: String)] = [(0,7,"A"),(8,13,"B"),(14,17,"C"),(18,19,"D"),(20,21,"E"),(22,23,"F"),(24,25,"G"),(26,27,"H"),(28,29,"I"),(30,32,"J"),(33,34,"K"),(35,37,"L"),(38,39,"M"),(40,42,"N"),(43,45,"O"),(46,48,"P"),(49,50,"Q"),(51,53,"R"),(54,56,"S"),(57,60,"T"),(61,63,"U"),(64,67,"V"),(68,70,"W"),(71,72,"X")]
        
        let depth18: [(begin: Int, end: Int, group: String)] = [(0,6,"A"),(7,11,"B"),(12,15,"C"),(16,16,"D"),(17,18,"E"),(19,20,"F"),(21,22,"G"),(23,24,"H"),(25,26,"I"),(27,28,"J"),(29,30,"K"),(31,32,"L"),(33,34,"M"),(35,36,"N"),(37,39,"O"),(40,41,"P"),(42,43,"Q"),(44,46,"R"),(47,48,"S"),(49,51,"T"),(52,53,"U"),(54,55,"V"),(56,56,"W")]
        
        let depth20: [(begin: Int, end: Int, group: String)] = [(0,6,"A"),(7,10,"B"),(11,13,"C"),(14,15,"D"),(16,16,"E"),(17,18,"F"),(19,20,"G"),(21,21,"H"),(22,23,"I"),(24,25,"J"),(26,26,"K"),(27,28,"L"),(29,30,"M"),(31,32,"N"),(33,34,"O"),(35,36,"P"),(37,38,"Q"),(39,40,"R"),(41,42,"S"),(43,44,"T"),(45,45,"U")]
        
        let depth22: [(begin: Int, end: Int, group: String)] = [(0,5,"A"),(6,9,"B"),(10,12,"C"),(13,13,"D"),(14,15,"E"),(16,16,"F"),(17,18,"G"),(19,19,"H"),(20,21,"I"),(22,22,"J"),(23,24,"K"),(25,25,"L"),(26,27,"M"),(28,29,"N"),(30,30,"O"),(31,32,"P"),(33,34,"Q"),(35,36,"R"),(37,37,"S")]
        
        let depth25: [(begin: Int, end: Int, group: String)] = [(0,4,"A"),(5,8,"B"),(9,10,"C"),(11,11,"D"),(12,13,"E"),(14,14,"F"),(15,15,"G"),(16,17,"H"),(18,18,"I"),(19,19,"J"),(20,21,"K"),(22,22,"L"),(23,23,"M"),(24,25,"N"),(26,26,"O"),(27,28,"P"),(29,29,"Q")]
        
        let depth30: [(begin: Int, end: Int, group: String)] = [(0,3,"A"),(4,6,"B"),(7,8,"C"),(9,9,"D"),(10,10,"E"),(11,11,"F"),(12,12,"G"),(13,13,"H"),(14,14,"I"),(15,15,"J"),(16,16,"K"),(17,17,"L"),(18,19,"M"),(20,20,"N")]
        
        let depth35: [(begin: Int, end: Int, group: String)] = [(0,3,"A"),(4,5,"B"),(6,7,"C"),(8,8,"D"),(9,9,"F"),(10,10,"G"),(11,11,"H"),(12,12,"I"),(13,13,"J"),(14,14,"K")]
        
        let depth40: [(begin: Int, end: Int, group: String)] = [(0,5,"B"),(6,6,"C"),(7,7,"E"),(8,8,"F"),(9,9,"G")]
        
        let depth45: [(begin: Int, end: Int, group: String)] = [(0,4,"B"),(5,6,"D"),(7,7,"E"),(8,8,"F")]
        
        
        group_matrix.append((0,10,depth10));
        group_matrix.append((10,12,depth12));
        group_matrix.append((12,14,depth14));
        group_matrix.append((14,16,depth16));
        group_matrix.append((16,18,depth18));
        group_matrix.append((18,20,depth20));
        group_matrix.append((20,22,depth22));
        group_matrix.append((22,25,depth25));
        group_matrix.append((25,30,depth30));
        group_matrix.append((30,35,depth35));
        group_matrix.append((35,40,depth40));
        group_matrix.append((40,45,depth45));

    }
    
    private func setRepeatGroupMatirx() {
        var list: [[(begin: Float, end: Float, time: (rnt: Int, abt: Int))]] = []
        list.append([(0,10,(10,209)),(11,12,(9,138)),(13,14,(8,90)),(15,16,(7,65)),(17,18,(6,50)),(19,20,(6,39)),(21,22,(5,32)),(23,25,(4,25)),(26,30,(3,17)),(31,35,(3,11)),(36,40,(2,7))])
        
        list.append([(0,10,(20,119)),(11,12,(17,130)),(13,14,(15,83)),(15,16,(13,59)),(17,18,(11,45)),(19,20,(10,35)),(21,22,(9,28)),(23,25,(8,21)),(26,30,(6,14)),(31,35,(5,9)),(36,40,(5,4))])
        
        list.append([(0,10,(26,193)),(11,12,(23,124)),(13,14,(19,79)),(15,16,(17,55)),(17,18,(15,41)),(19,20,(13,32)),(21,22,(12,25)),(23,25,(10,19)),(26,30,(8,12)),(31,35,(7,7)),(36,40,(6,-1))])
        
        list.append([(0,10,(30,189)),(11,12,(26,121)),(13,14,(22,76)),(15,16,(19,53)),(17,18,(16,40)),(19,20,(15,30)),(21,22,(13,24)),(23,25,(11,18)),(26,30,(9,11)),(31,35,(8,6)),(36,40,(7,-1))])
        
        list.append([(0,10,(34,185)),(11,12,(29,118)),(13,14,(24,74)),(15,16,(21,51)),(17,18,(18,38)),(19,20,(16,29)),(21,22,(15,22)),(23,25,(13,16)),(26,30,(10,10)),(31,35,(9,5)),(36,40,(7,-1))])
        
        list.append([(0,10,(37,182)),(11,12,(32,115)),(13,14,(27,71)),(15,16,(23,49)),(17,18,(20,36)),(19,20,(18,27)),(21,22,(16,21)),(23,25,(14,15)),(26,30,(11,9)),(31,35,(9,5)),(36,40,(8,-1))])
        
        list.append([(0,10,(10,209)),(11,12,(9,138)),(13,14,(8,90)),(15,16,(7,65)),(17,18,(6,50)),(19,20,(6,39)),(21,22,(5,32)),(23,25,(4,25)),(26,30,(3,17)),(31,35,(3,11)),(36,40,(2,7))])
        
        list.append([(0,10,(45,174)),(11,12,(38,109)),(13,14,(32,66)),(15,16,(27,45)),(17,18,(24,32)),(19,20,(21,24)),(21,22,(19,18)),(23,25,(17,12)),(26,30,(13,7)),(31,35,(11,3))])
        
        list.append([(0,10,(50,169)),(11,12,(42,105)),(13,14,(35,63)),(15,16,(29,43)),(17,18,(26,30)),(19,20,(23,22)),(21,22,(21,16)),(23,25,(18,11)),(26,30,(14,6)),(31,35,(12,-1))])
        
        list.append([(0,10,(54,165)),(11,12,(45,102)),(13,14,(37,61)),(15,16,(32,40)),(17,18,(28,28)),(19,20,(25,20)),(21,22,(22,15)),(23,25,(19,10)),(26,30,(15,5)),(31,35,(13,-1))])
        
        list.append([(0,10,(59,160)),(11,12,(49,98)),(13,14,(40,58)),(15,16,(34,38)),(17,18,(30,26)),(19,20,(26,19)),(21,22,(24,13)),(23,25,(21,8)),(26,30,(16,4)),(31,35,(14,-1))])
        
        list.append([(0,10,(64,155)),(11,12,(53,94)),(13,14,(43,55)),(15,16,(37,35)),(17,18,(32,24)),(19,20,(28,17)),(21,22,(25,12)),(23,25,(22,7)),(26,30,(17,3))])
        
        list.append([(0,10,(70,149)),(11,12,(57,90)),(13,14,(47,51)),(15,16,(39,33)),(17,18,(34,22)),(19,20,(30,15)),(21,22,(27,10)),(23,25,(23,6)),(26,30,(19,-1))])
        
        list.append([(0,10,(75,144)),(11,12,(62,85)),(13,14,(50,48)),(15,16,(42,30)),(17,18,(36,20)),(19,20,(32,13)),(21,22,(29,8)),(23,25,(25,4)),(26,30,(20,-1))])
        
        list.append([(0,10,(82,137)),(11,12,(66,81)),(13,14,(53,45)),(15,16,(45,27)),(17,18,(39,17)),(19,20,(34,11)),(21,22,(30,7)),(23,25,(26,3))])
        
        list.append([(0,10,(88,131)),(11,12,(71,76)),(13,14,(57,41)),(15,16,(48,24)),(17,18,(41,15)),(19,20,(36,9)),(21,22,(32,5)),(23,25,(28,-1))])
        
        list.append([(0,10,(95,124)),(11,12,(76,71)),(13,14,(61,37)),(15,16,(50,22)),(17,18,(43,13)),(19,20,(38,7)),(21,22,(34,3)),(23,25,(29,-1))])
        
        list.append([(0,10,(88,131)),(11,12,(71,76)),(13,14,(57,41)),(15,16,(48,24)),(17,18,(41,15)),(19,20,(36,9)),(21,22,(32,5)),(23,25,(28,-1))])
        
        list.append([(0,10,(104,115)),(11,12,(82,65)),(13,14,(64,34)),(15,16,(53,19)),(17,18,(46,10)),(19,20,(40,5)),(21,22,(36,-1))])
        
        list.append([(0,10,(112,107)),(11,12,(88,59)),(13,14,(68,30)),(15,16,(56,16)),(17,18,(48,8)),(19,20,(42,3)),(21,22,(37,-1))])
        
        list.append([(0,10,(122,97)),(11,12,(94,53)),(13,14,(73,25)),(15,16,(60,12)),(17,18,(51,5)),(19,20,(44,-1))])
        
        list.append([(0,10,(133,86)),(11,12,(101,46)),(13,14,(77,21)),(15,16,(63,9)),(17,18,(53,3)),(19,20,(45,-1))])
        
        list.append([(0,10,(145,74)),(11,12,(108,39)),(13,14,(82,16)),(15,16,(67,5)),(17,18,(55,-1))])
        
        list.append([(0,10,(160,59)),(11,12,(116,31)),(13,14,(87,11)),(15,16,(70,2)),(17,18,(56,-1))])
        
        list.append([(0,10,(178,41)),(11,12,(125,22)),(13,14,(92,6)),(15,16,(72,-1))])
        
        list.append([(0,10,(199,20)),(11,12,(134,13)),(13,14,(98,-1))])
        
        list.append([(0,10,(219,-1)),(11,12,(147,-1))])

        
        for i in 0..<list.count-1 {
            let label = UnicodeScalar((Int)(UnicodeScalar("A").value)+i)
            repeat_group_matrix[(String)(label)] = list[i]
        }
    }
    
    private func setSurfaceIntervalGroup() {
        var list: [[(begin: Int, end: Int, group: String)]] = []
        
        list.append([(0,180,"A")])
        
        list.append([(0,47,"B"),(48,228,"A")])
        
        list.append([(0,21,"C"),(22,69,"B"),(70,250,"A")])
        
        list.append([(0,8,"D"),(9,30,"C"),(31,78,"B"),(79,249,"A")])
        
        list.append([(0,7,"E"),(8,16,"D"),(17,38,"C"),(39,87,"B"),(88,268,"A")])
        
        list.append([(0,7,"F"),(8,15,"E"),(16,24,"D"),(25,46,"C"),(47,94,"B"),(95,275,"A")])
        
        list.append([(0,6,"G"),(7,13,"F"),(14,22,"E"),(23,31,"D"),(32,53,"C"),(54,101,"B"),(102,282,"A")])
        
        list.append([(0,5,"H"),(6,12,"G"),(13,20,"F"),(21,28,"E"),(29,37,"D"),(38,59,"C"),(60,107,"B"),(108,288,"A")])
        
        list.append([(0,5,"I"),(6,11,"H"),(12,18,"G"),(19,26,"F"),(27,34,"E"),(35,43,"D"),(44,65,"C"),(66,113,"B"),(114,294,"A")])
        
        list.append([(0,5,"I"),(6,11,"H"),(12,18,"G"),(19,26,"F"),(27,34,"E"),(35,43,"D"),(44,65,"C"),(66,113,"B"),(114,294,"A")])
        
        list.append([(0,5,"J"),(6,11,"I"),(12,17,"H"),(18,24,"G"),(25,31,"F"),(32,40,"E"),(41,49,"D"),(50,71,"C"),(72,119,"B"),(120,300,"A")])
        
        list.append([(0,4,"K"),(5,10,"J"),(11,16,"I"),(17,22,"H"),(23,29,"G"),(30,37,"F"),(38,45,"E"),(46,54,"D"),(55,76,"C"),(77,124,"B"),(125,305,"A")])
        
        list.append([(0,4,"L"),(5,9,"K"),(10,15,"J"),(16,21,"I"),(22,27,"H"),(28,34,"G"),(35,42,"F"),(43,50,"E"),(51,59,"D"),(60,81,"C"),(82,129,"B"),(130,310,"A")])
        
        list.append([(0,4,"M"),(5,9,"L"),(10,14,"K"),(15,19,"J"),(20,25,"I"),(26,32,"H"),(33,39,"G"),(40,46,"F"),(47,55,"E"),(56,64,"D"),(65,85,"C"),(86,134,"B"),(135,315,"A")])
        
        list.append([(0,3,"N"),(4,8,"M"),(9,13,"L"),(14,18,"K"),(19,24,"J"),(25,30,"I"),(31,36,"H"),(37,43,"G"),(44,51,"F"),(52,59,"E"),(60,68,"D"),(69,90,"C"),(91,138,"B"),(139,319,"A")])
        
        list.append([(0,3,"O"),(4,8,"N"),(9,12,"M"),(13,17,"L"),(18,23,"K"),(24,28,"J"),(29,34,"I"),(35,41,"H"),(42,47,"G"),(48,55,"F"),(56,63,"E"),(64,72,"D"),(73,94,"C"),(95,143,"B"),(144,324,"A")])
        
        list.append([(0,3,"P"),(4,7,"O"),(8,12,"N"),(13,16,"M"),(17,21,"L"),(22,27,"K"),(28,32,"J"),(33,38,"I"),(39,45,"H"),(46,51,"G"),(52,59,"F"),(60,77,"E"),(78,76,"D"),(77,98,"C"),(99,147,"B"),(148,328,"A")])
        
        list.append([(0,3,"Q"),(4,7,"P"),(8,11,"O"),(12,16,"N"),(17,20,"M"),(21,25,"L"),(26,30,"K"),(21,36,"J"),(37,42,"I"),(43,48,"H"),(49,55,"G"),(56,63,"F"),(64,71,"E"),(72,80,"D"),(81,102,"C"),(103,150,"B"),(151,331,"A")])
        
        list.append([(0,3,"R"),(4,7,"Q"),(8,11,"P"),(12,15,"O"),(16,19,"N"),(20,24,"M"),(25,29,"L"),(30,34,"K"),(35,40,"J"),(41,46,"I"),(47,52,"H"),(53,59,"G"),(60,67,"F"),(68,75,"E"),(76,84,"D"),(85,106,"C"),(107,154,"B"),(155,335,"A")])
        
        list.append([(0,3,"S"),(4,6,"R"),(7,10,"Q"),(11,14,"P"),(15,18,"O"),(19,23,"N"),(24,27,"M"),(28,32,"L"),(33,38,"K"),(39,43,"J"),(44,49,"I"),(50,56,"H"),(57,63,"G"),(64,70,"F"),(71,78,"E"),(79,87,"D"),(88,109,"C"),(110,158,"B"),(159,339,"A")])
        
        list.append([(0,2,"T"),(3,6,"S"),(7,10,"R"),(11,13,"Q"),(14,17,"P"),(18,22,"O"),(23,26,"N"),(27,31,"M"),(32,36,"L"),(37,41,"K"),(42,47,"J"),(48,53,"I"),(54,59,"H"),(60,66,"G"),(67,73,"F"),(74,82,"E"),(83,91,"D"),(92,113,"C"),(114,161,"B"),(162,342,"A")])
        
        list.append([(0,2,"U"),(3,6,"T"),(7,9,"S"),(10,13,"R"),(14,17,"Q"),(18,21,"P"),(22,25,"O"),(26,29,"N"),(30,34,"M"),(35,39,"L"),(40,44,"K"),(45,50,"J"),(51,56,"I"),(57,62,"H"),(63,69,"G"),(70,77,"F"),(78,85,"E"),(86,94,"D"),(95,116,"C"),(117,164,"B"),(165,345,"A")])
        
        list.append([(0,2,"V"),(3,5,"U"),(6,9,"T"),(10,12,"S"),(13,16,"R"),(17,20,"Q"),(21,24,"P"),(25,28,"O"),(29,33,"N"),(34,37,"M"),(38,42,"L"),(43,47,"K"),(48,53,"J"),(54,59,"I"),(60,65,"H"),(66,72,"G"),(73,80,"F"),(81,88,"E"),(89,97,"D"),(98,119,"C"),(120,167,"B"),(168,348,"A")])
        
        list.append([(0,2,"W"),(3,5,"V"),(6,8,"U"),(9,12,"T"),(13,15,"S"),(16,19,"R"),(20,23,"Q"),(24,27,"P"),(28,31,"O"),(32,36,"N"),(37,40,"M"),(41,45,"L"),(46,50,"K"),(51,56,"J"),(57,62,"I"),(63,68,"H"),(69,75,"G"),(76,83,"F"),(84,91,"E"),(92,100,"D"),(101,122,"C"),(123,170,"B"),(171,351,"A")])
        
        list.append([(0,2,"X"),(3,5,"W"),(6,8,"V"),(9,11,"U"),(12,15,"T"),(16,18,"S"),(19,22,"R"),(23,26,"Q"),(27,30,"P"),(31,34,"O"),(35,39,"N"),(40,43,"M"),(44,48,"L"),(49,53,"K"),(54,59,"J"),(60,65,"I"),(66,71,"H"),(72,78,"G"),(79,86,"F"),(87,94,"E"),(95,103,"D"),(104,125,"C"),(126,173,"B"),(174,354,"A")])
        
        list.append([(0,2,"Y"),(3,5,"X"),(6,8,"W"),(9,11,"V"),(12,14,"U"),(15,18,"T"),(19,21,"S"),(22,25,"R"),(26,29,"Q"),(30,33,"P"),(34,37,"O"),(38,41,"N"),(42,46,"M"),(47,51,"L"),(52,56,"K"),(57,62,"J"),(63,68,"I"),(69,74,"H"),(75,81,"G"),(82,89,"F"),(90,97,"E"),(98,106,"D"),(107,128,"C"),(129,176,"B"),(177,357,"A")])
        
        list.append([(0,2,"Z"),(3,5,"Y"),(6,8,"X"),(9,11,"W"),(12,14,"V"),(15,17,"U"),(18,20,"T"),(21,24,"S"),(25,28,"R"),(29,31,"Q"),(32,35,"P"),(36,40,"O"),(41,44,"N"),(45,49,"M"),(50,54,"L"),(55,59,"K"),(60,65,"J"),(66,71,"I"),(72,77,"H"),(78,84,"G"),(85,91,"F"),(92,100,"E"),(101,109,"D"),(110,131,"C"),(132,179,"B"),(180,360,"A")])
        
        for i in 0..<list.count {
            let label = UnicodeScalar((Int)(UnicodeScalar("A").value)+i)
            surface_interval_group[(String)(label)] = list[i]
        }
    }
    
    
    func getGroup(WaterDepth water_depth: Float, BottomTime bottom_time: Int) -> String {
        for depth in group_matrix {
            if depth.begin < water_depth && depth.end >= water_depth {
                for min in depth.min {
                    if min.begin <= bottom_time && min.end >= bottom_time {
                        return min.group
                    }
                }
            }
        }
        
        return ""
    }
    
    func getGroupAfterSI(Group group: String, SurfaceInterval surface_interval: Int) -> String {
        for interval in surface_interval_group[group]! {
            if interval.begin <= surface_interval && interval.end >= surface_interval {
                return interval.group
            }
        }
        
        return ""
    }
    
    func getRNT(Group group: String, WaterDepth water_depth: Float) -> Int {
        for properties in repeat_group_matrix[group]! {
            if properties.begin <= water_depth && properties.end >= water_depth {
                return properties.time.rnt
            }
        }
        return -1
    }
    
    func getABT(Group group: String, WaterDepth water_depth: Float) -> Int {
        for properties in repeat_group_matrix[group]! {
            if properties.begin <= water_depth && properties.end >= water_depth {
                return properties.time.abt
            }
        }
        return -1
    }

    
}