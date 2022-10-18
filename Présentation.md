https://hackmd.io/@DavidMsd/B1lktAoQs

---

title: Brief 6 executive summary
description: View the slide with "Slide Mode".
slideOptions:
  theme: black
  transition: 'concave'
  backgroundTransition: 'convex'
  transitionSpeed: 'default'
  parallaxBackgroundImage: 'https://i.imgur.com/SX2J3IB.jpg'
  parallaxBackgroundHorizontal: 500
  parallaxBackgroundVertical: 500
  
---
 
# Brief 6: K8S Executive Summary
[Dépôt Github](https://github.com/DavidMosad/Brief-6)
[Résultat "voting app"](https://skyisthelimit.university-of-common-sense.space/)
[Présentation](https://hackmd.io/p/nayYmQK1RG2o5EaeT0y2bg?both)

---

## Plan
- Introduction à Kubernetes
- Fonctionnement d'un cluster AKS
- Objéctifs
- Topologie
- Ressources Azure

---

## Kubernetes K8S
**Qu'est ce que Kubernetes?**

- Logiciel open source d'orchestration de conteneurs
- Permet l'automatisation du déploiements d'application à grande échelle
- Configuration déclarative avec scripts YAML / JSON
- Déploiement de pods et de services sur des nodes

---

**Comment Kubernetes fonctionne**
- Architecture Maitre /esclave dans un cluster
- Templates de configuration (script Yaml/ Json) parlent a l'unité Maitre de K8S
- L'unité Maitre(Control Plane) = Serveur API (control manager, schedueler, etcd)
- Nodes contiennent nos conteneurs (images docker)
- Utilisation de templates pour déclarer sa configuration soit l'infrastructure souhaitée

---

## Cluster AKS
![](https://i.imgur.com/Gg9QVSe.png =250x)

---

## Objectifs

**Utiliser Kubernetes pour:**
- Déployer application de vote
- Déployer une BDD redis
- Avoir un stockage persistant pour la BDD
- utiliser une zone DNS
- utiliser une application gateway

---

## Actions menées

**Déploiement voting App**
Partie 1
- Déploiment Vote App(en load balancer qui attribue IP public pr app acessible dep exterieur et mettre en relation l'app avec la BDD redis)
- Définit environnement pr utiliser MDP pr se connecter a Redis (secret utiliser par redis et voting app)

---

Partie 2

- AGIC: utiliser Application Gateway pour la connection via IP public (plus de load balancer) 
- Création d'un certificat SSL avec Gandi
- App Gateway peut filtrer traffic avec parefeu 
- DNS: mise en place d'un sous-domaine pour acceder a la voting app relier a l'adresse IP de la gateway.
- Scaling out une fois 70% CPU atteint

---

**Déploiement Redis**
- Déploiment Redis BDD
- Création d'un mot de passe pour identification
- Déclarer espace de stockage persistant en dehors du node
- Attribution d'un cluster IP: permet de mettre en communication redis avec autres pods avec IP privée en interne

---

**Topologie**

![](https://i.imgur.com/SvJPLRR.png)


---




## Ressources Azure
- Azure Kubernetes Service
    - 4 nodes
    - Application gateway
    - Stockage Permanent
    

---



