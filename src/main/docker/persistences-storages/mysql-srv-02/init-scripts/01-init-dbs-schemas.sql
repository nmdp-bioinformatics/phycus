FLUSH PRIVILEGES;

CREATE DATABASE DBKeyCloak;

FLUSH PRIVILEGES;

COMMIT;




-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: db-mysql-keycloak
-- Tempo de geração: 24-Mar-2020 às 22:44
-- Versão do servidor: 8.0.19
-- versão do PHP: 7.4.4

START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `dbkeycloak`
--
CREATE DATABASE IF NOT EXISTS `dbkeycloak` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE dbkeycloak;

-- --------------------------------------------------------

--
-- Estrutura da tabela `admin_event_entity`
--

DROP TABLE IF EXISTS `admin_event_entity`;
CREATE TABLE IF NOT EXISTS `admin_event_entity` (
  `ID` varchar(36) NOT NULL,
  `ADMIN_EVENT_TIME` bigint DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `OPERATION_TYPE` varchar(255) DEFAULT NULL,
  `AUTH_REALM_ID` varchar(255) DEFAULT NULL,
  `AUTH_CLIENT_ID` varchar(255) DEFAULT NULL,
  `AUTH_USER_ID` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `RESOURCE_PATH` text,
  `REPRESENTATION` text,
  `ERROR` varchar(255) DEFAULT NULL,
  `RESOURCE_TYPE` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `associated_policy`
--

DROP TABLE IF EXISTS `associated_policy`;
CREATE TABLE IF NOT EXISTS `associated_policy` (
  `POLICY_ID` varchar(36) NOT NULL,
  `ASSOCIATED_POLICY_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`POLICY_ID`,`ASSOCIATED_POLICY_ID`),
  KEY `IDX_ASSOC_POL_ASSOC_POL_ID` (`ASSOCIATED_POLICY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `associated_policy`
--

INSERT INTO `associated_policy` (`POLICY_ID`, `ASSOCIATED_POLICY_ID`) VALUES
('d50a94d5-1756-434d-b110-4d53eece2e6d', 'ad943211-dd2c-4784-92a3-7ad1c524169b'),
('4b5c72cc-b8b8-4bfc-95ac-61815669f985', 'ff09b194-0615-4cfd-9851-74adf540dabd');

-- --------------------------------------------------------

--
-- Estrutura da tabela `authentication_execution`
--

DROP TABLE IF EXISTS `authentication_execution`;
CREATE TABLE IF NOT EXISTS `authentication_execution` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `AUTHENTICATOR` varchar(36) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `FLOW_ID` varchar(36) DEFAULT NULL,
  `REQUIREMENT` int DEFAULT NULL,
  `PRIORITY` int DEFAULT NULL,
  `AUTHENTICATOR_FLOW` bit(1) NOT NULL DEFAULT b'0',
  `AUTH_FLOW_ID` varchar(36) DEFAULT NULL,
  `AUTH_CONFIG` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_EXEC_REALM_FLOW` (`REALM_ID`,`FLOW_ID`),
  KEY `IDX_AUTH_EXEC_FLOW` (`FLOW_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `authentication_execution`
--

INSERT INTO `authentication_execution` (`ID`, `ALIAS`, `AUTHENTICATOR`, `REALM_ID`, `FLOW_ID`, `REQUIREMENT`, `PRIORITY`, `AUTHENTICATOR_FLOW`, `AUTH_FLOW_ID`, `AUTH_CONFIG`) VALUES
('007ed17c-bacf-4b9f-b564-7c4aa8d001bb', NULL, 'registration-profile-action', 'cibmtr-bioinformatics-realm', '7344671e-65ba-43b8-a95b-ef85ba95a693', 0, 40, b'0', NULL, NULL),
('058912ed-75eb-44d9-b345-e93a8000b68e', NULL, 'direct-grant-validate-password', 'cibmtr-bioinformatics-realm', '4792c881-7800-47a7-9264-c2f50d602ee9', 0, 20, b'0', NULL, NULL),
('153cdb45-06b2-4e87-bdc6-ff850224de6b', NULL, 'direct-grant-validate-otp', 'cibmtr-bioinformatics-realm', '422c1ae4-70bc-4d99-b937-485bbe98d800', 0, 20, b'0', NULL, NULL),
('154cd377-a655-4a97-8750-f1055e3ad01d', NULL, 'docker-http-basic-authenticator', 'master', '09a729e8-7ede-4d69-822c-59ea50e9c4eb', 0, 10, b'0', NULL, NULL),
('1564c0e1-0a01-4b70-8052-af4d5b12be57', NULL, 'direct-grant-validate-username', 'cibmtr-bioinformatics-realm', '4792c881-7800-47a7-9264-c2f50d602ee9', 0, 10, b'0', NULL, NULL),
('1769170b-7eb9-41bd-bf74-01a6514315db', NULL, 'identity-provider-redirector', 'master', 'd6f21945-0811-4745-9491-4d06f6891f04', 2, 25, b'0', NULL, NULL),
('19c9b58e-c0d7-4cf8-bc9c-e01d95a0ab55', NULL, NULL, 'master', '9e83783c-39b5-42e8-a28b-99f0c3322d40', 1, 20, b'1', 'b835f851-c9de-4976-99cb-f7c3f2de2738', NULL),
('1af0dcde-0121-42dc-86b7-d38c950be21a', NULL, 'auth-spnego', 'master', 'd6f21945-0811-4745-9491-4d06f6891f04', 3, 20, b'0', NULL, NULL),
('1b12133c-e5a7-4e9c-a758-887baecd6108', NULL, 'client-secret-jwt', 'cibmtr-bioinformatics-realm', 'b2104493-52a1-4627-869b-a65b057b8147', 2, 30, b'0', NULL, NULL),
('1ce1b616-2817-4a28-acd3-0e7a79133452', NULL, 'idp-review-profile', 'master', '26eac2ed-1c76-4889-9490-fbab660f9678', 0, 10, b'0', NULL, '09fa2388-1a34-4443-a82a-722766928d27'),
('1dfd12ec-d607-419c-bd0d-3d758dae984a', NULL, NULL, 'cibmtr-bioinformatics-realm', '9fcbb697-dadf-4079-9b02-f489c7394182', 1, 40, b'1', 'ea8e968d-8ffa-4825-9990-5e9a6b6d79f5', NULL),
('25368c5c-18c0-4dc9-9245-65a45cc57ced', NULL, NULL, 'master', 'd6f21945-0811-4745-9491-4d06f6891f04', 2, 30, b'1', '9e83783c-39b5-42e8-a28b-99f0c3322d40', NULL),
('29e47ed4-78ab-4d45-987d-c1028a42324c', NULL, 'reset-password', 'master', '02dbcfec-7c6a-4a98-81df-8839f710c4a8', 0, 30, b'0', NULL, NULL),
('2c45c125-aa7d-4495-a11a-2e4703bf66f3', NULL, NULL, 'cibmtr-bioinformatics-realm', 'df7b4317-4aad-43c3-bce9-aa7996206c91', 0, 20, b'1', '917dfac2-9890-4127-85c4-250fd9b4ff30', NULL),
('3194f76a-966b-430d-bcc5-7bcc305919bf', NULL, 'reset-otp', 'master', 'a0dea53c-b018-4611-bf85-bf62d7dd490b', 0, 20, b'0', NULL, NULL),
('33ac69f9-603b-43e9-a8a9-8a35269c59e3', NULL, 'direct-grant-validate-otp', 'master', 'e1f938a4-3754-4a36-ad91-6af2bb071f3c', 0, 20, b'0', NULL, NULL),
('3505629b-584a-427b-90d9-703e6ab64c64', NULL, 'direct-grant-validate-username', 'master', '084f926f-6967-4bcb-b80e-31207678cf2c', 0, 10, b'0', NULL, NULL),
('36e69f8e-bcfe-45dd-912f-cf12a60245d7', NULL, 'auth-cookie', 'master', 'd6f21945-0811-4745-9491-4d06f6891f04', 2, 10, b'0', NULL, NULL),
('3b7223d0-df86-4b72-9f07-39e0f856dab9', NULL, 'direct-grant-validate-password', 'master', '084f926f-6967-4bcb-b80e-31207678cf2c', 0, 20, b'0', NULL, NULL),
('3fd2a68c-65d3-4640-97de-f312a6887bd9', NULL, 'auth-spnego', 'master', '5f2605db-ce9c-4997-bc0d-a1a7b5f597e4', 3, 30, b'0', NULL, NULL),
('425ec4de-6b56-468d-b4f3-91c3dc3fa495', NULL, 'client-secret', 'cibmtr-bioinformatics-realm', 'b2104493-52a1-4627-869b-a65b057b8147', 2, 10, b'0', NULL, NULL),
('46fafc7a-83c9-499c-b9b3-d889fd39a08c', NULL, 'basic-auth', 'master', '5f2605db-ce9c-4997-bc0d-a1a7b5f597e4', 0, 10, b'0', NULL, NULL),
('481f6ce4-3ed6-4c8f-af26-9cfb6ba22db2', NULL, 'conditional-user-configured', 'cibmtr-bioinformatics-realm', '9e0960af-64e7-4877-815e-ad75156fd238', 0, 10, b'0', NULL, NULL),
('4a831c00-4e4b-4f28-be94-7e2c0194e4b5', NULL, NULL, 'cibmtr-bioinformatics-realm', 'd4aa3e02-2fca-406a-a711-cd6919967b26', 0, 20, b'1', 'a9ba05b7-f6f2-45bf-8ac6-dbd41d30dd91', NULL),
('4c000f00-0b68-43df-bfb3-772dc7f39d1d', NULL, NULL, 'master', '1a06b73c-7e02-4fe8-8e90-6e1bcd851d47', 0, 20, b'1', '5f2605db-ce9c-4997-bc0d-a1a7b5f597e4', NULL),
('4d9f6ad0-30cb-4c7a-abe9-c4a05fe2daa7', NULL, 'auth-username-password-form', 'master', '9e83783c-39b5-42e8-a28b-99f0c3322d40', 0, 10, b'0', NULL, NULL),
('4f7232b4-0db9-46a8-ae2b-497f0a65f53a', NULL, 'auth-otp-form', 'master', 'f66142a2-b680-470b-ac3f-110337499e2e', 0, 20, b'0', NULL, NULL),
('512f04a6-d8d3-400a-859d-9cf9314287a1', NULL, 'conditional-user-configured', 'master', 'e1f938a4-3754-4a36-ad91-6af2bb071f3c', 0, 10, b'0', NULL, NULL),
('53510832-def4-4bb1-8936-a82bbbbb6425', NULL, NULL, 'master', 'f5a59621-1cfc-469b-bf9c-a3c52b7c7865', 1, 20, b'1', 'f66142a2-b680-470b-ac3f-110337499e2e', NULL),
('53ea16b1-6554-4dc1-bcf2-869ef78c202b', NULL, 'registration-profile-action', 'master', '4dcee836-1071-4f3c-b09c-8314ba300b34', 0, 40, b'0', NULL, NULL),
('54a62ba2-d9de-4fa0-b4a9-543c55ee81a0', NULL, 'conditional-user-configured', 'cibmtr-bioinformatics-realm', '422c1ae4-70bc-4d99-b937-485bbe98d800', 0, 10, b'0', NULL, NULL),
('564161f0-8256-45c0-a474-ae916d20f12b', NULL, 'reset-password', 'cibmtr-bioinformatics-realm', '9fcbb697-dadf-4079-9b02-f489c7394182', 0, 30, b'0', NULL, NULL),
('5b915094-982d-491f-acae-446f6fa677d6', NULL, 'registration-page-form', 'cibmtr-bioinformatics-realm', '4c6da64c-81dd-4680-afc5-744c93cd8286', 0, 10, b'1', '7344671e-65ba-43b8-a95b-ef85ba95a693', NULL),
('60fde5ee-ba2d-4d6c-8834-c9c386963cef', NULL, 'reset-credential-email', 'master', '02dbcfec-7c6a-4a98-81df-8839f710c4a8', 0, 20, b'0', NULL, NULL),
('635e94be-2ff0-4dd8-b0a9-307eff87dede', NULL, NULL, 'cibmtr-bioinformatics-realm', '7fac2a6a-a4a9-4132-bf62-83bc22877c47', 1, 20, b'1', 'a582cb6d-479a-4bee-9c94-4fe1e011b5eb', NULL),
('6618527a-5894-49d2-8998-d9ba76cf33f5', NULL, 'idp-email-verification', 'master', 'd3f890af-35c1-4a84-8d66-d228999d7b40', 2, 10, b'0', NULL, NULL),
('6721be94-87f2-448b-adc6-63058c8f5144', NULL, 'docker-http-basic-authenticator', 'cibmtr-bioinformatics-realm', 'e77f88e4-c597-4e89-8db8-7cba747d9601', 0, 10, b'0', NULL, NULL),
('6a564f95-7c52-440c-bfa2-663fdfb2b5bb', NULL, 'idp-username-password-form', 'cibmtr-bioinformatics-realm', '7fac2a6a-a4a9-4132-bf62-83bc22877c47', 0, 10, b'0', NULL, NULL),
('6d2496c4-bdf6-4f22-93f7-ca8a1b5f6aa2', NULL, 'client-jwt', 'cibmtr-bioinformatics-realm', 'b2104493-52a1-4627-869b-a65b057b8147', 2, 20, b'0', NULL, NULL),
('6dcc7297-de3b-42b1-beed-1d011e88f96c', NULL, 'auth-otp-form', 'master', 'b835f851-c9de-4976-99cb-f7c3f2de2738', 0, 20, b'0', NULL, NULL),
('7563f518-3a60-4ac4-aaf1-0f8653e57fa5', NULL, 'registration-recaptcha-action', 'master', '4dcee836-1071-4f3c-b09c-8314ba300b34', 3, 60, b'0', NULL, NULL),
('75a8e743-be98-4c7e-b9ba-e28997c4740f', NULL, 'reset-otp', 'cibmtr-bioinformatics-realm', 'ea8e968d-8ffa-4825-9990-5e9a6b6d79f5', 0, 20, b'0', NULL, NULL),
('783db757-6686-42a7-8b85-5e7a619d9cc6', NULL, 'reset-credential-email', 'cibmtr-bioinformatics-realm', '9fcbb697-dadf-4079-9b02-f489c7394182', 0, 20, b'0', NULL, NULL),
('785fd48d-bf32-4913-8611-dbb40f485a10', NULL, 'basic-auth-otp', 'master', '5f2605db-ce9c-4997-bc0d-a1a7b5f597e4', 3, 20, b'0', NULL, NULL),
('793db88d-a8f7-4808-bc26-fab72ef33ed3', NULL, 'registration-user-creation', 'cibmtr-bioinformatics-realm', '7344671e-65ba-43b8-a95b-ef85ba95a693', 0, 20, b'0', NULL, NULL),
('7d959c8f-3c7e-4d96-9fdb-8f668eea3103', NULL, NULL, 'master', '31583d45-da22-48bc-a9d6-6ec9d819c607', 0, 20, b'1', 'd3f890af-35c1-4a84-8d66-d228999d7b40', NULL),
('7de6afd1-0675-4a59-a714-a3071fd01c17', NULL, 'auth-spnego', 'cibmtr-bioinformatics-realm', '03019b44-fb0a-42bb-ab7f-b109f9118d62', 3, 20, b'0', NULL, NULL),
('82c55cd7-bc06-4a95-a3af-8016649d92d8', NULL, 'idp-email-verification', 'cibmtr-bioinformatics-realm', 'a9ba05b7-f6f2-45bf-8ac6-dbd41d30dd91', 2, 10, b'0', NULL, NULL),
('84d81829-d82a-46f6-b42b-1b39b962b597', NULL, NULL, 'cibmtr-bioinformatics-realm', '917dfac2-9890-4127-85c4-250fd9b4ff30', 2, 20, b'1', 'd4aa3e02-2fca-406a-a711-cd6919967b26', NULL),
('86cd8b60-fe0b-4980-9945-c72f5af0db45', NULL, 'identity-provider-redirector', 'cibmtr-bioinformatics-realm', '03019b44-fb0a-42bb-ab7f-b109f9118d62', 2, 25, b'0', NULL, NULL),
('87356de6-edf7-4ab9-a491-aa29c3cbef2e', NULL, NULL, 'master', 'd3f890af-35c1-4a84-8d66-d228999d7b40', 2, 20, b'1', 'f5a59621-1cfc-469b-bf9c-a3c52b7c7865', NULL),
('87e84f03-ba02-46aa-9d08-57f8b2a22168', NULL, 'idp-create-user-if-unique', 'master', '219b8c0b-e134-4d83-8da6-c1e6d3b166a9', 2, 10, b'0', NULL, 'cc851e89-2782-40a3-84ab-bc4535bcb763'),
('8bf8eadc-7e57-4ec9-b1b6-aa0b9f241d35', NULL, 'idp-username-password-form', 'master', 'f5a59621-1cfc-469b-bf9c-a3c52b7c7865', 0, 10, b'0', NULL, NULL),
('91c7e2d8-c628-4341-ba16-800ade1eff35', NULL, NULL, 'master', '26eac2ed-1c76-4889-9490-fbab660f9678', 0, 20, b'1', '219b8c0b-e134-4d83-8da6-c1e6d3b166a9', NULL),
('9296a31e-bbe8-4fe3-a28a-94148e308421', NULL, 'no-cookie-redirect', 'master', '1a06b73c-7e02-4fe8-8e90-6e1bcd851d47', 0, 10, b'0', NULL, NULL),
('933da5f7-5d88-4e69-9be2-93eeb4598456', NULL, 'auth-otp-form', 'cibmtr-bioinformatics-realm', '9e0960af-64e7-4877-815e-ad75156fd238', 0, 20, b'0', NULL, NULL),
('9e85cf8c-4e9b-43a7-8f7a-6e274f3500b0', NULL, 'conditional-user-configured', 'cibmtr-bioinformatics-realm', 'ea8e968d-8ffa-4825-9990-5e9a6b6d79f5', 0, 10, b'0', NULL, NULL),
('a9b6b43b-e7af-4449-92be-7e22a4acab11', NULL, 'registration-recaptcha-action', 'cibmtr-bioinformatics-realm', '7344671e-65ba-43b8-a95b-ef85ba95a693', 3, 60, b'0', NULL, NULL),
('adcd6bf1-a92d-4278-9932-7fda44b65d69', NULL, 'client-x509', 'cibmtr-bioinformatics-realm', 'b2104493-52a1-4627-869b-a65b057b8147', 2, 40, b'0', NULL, NULL),
('b791e402-c702-4a49-894a-8dc82a55020c', NULL, 'registration-page-form', 'master', '15ffed78-3316-425a-9649-11107e54c743', 0, 10, b'1', '4dcee836-1071-4f3c-b09c-8314ba300b34', NULL),
('ba4648f6-c385-45da-b980-93107bc505ca', NULL, NULL, 'master', '219b8c0b-e134-4d83-8da6-c1e6d3b166a9', 2, 20, b'1', '31583d45-da22-48bc-a9d6-6ec9d819c607', NULL),
('bc3953e0-030f-4739-be9d-3be301dc8116', NULL, 'http-basic-authenticator', 'cibmtr-bioinformatics-realm', '108beb66-4d4d-460e-af6e-6d46bbe6f7e6', 0, 10, b'0', NULL, NULL),
('be49c61d-0e8a-4589-af94-e550410a6d5e', NULL, NULL, 'master', '02dbcfec-7c6a-4a98-81df-8839f710c4a8', 1, 40, b'1', 'a0dea53c-b018-4611-bf85-bf62d7dd490b', NULL),
('bec5b48b-8969-4f05-a3db-c7cb6bf6649b', NULL, NULL, 'cibmtr-bioinformatics-realm', '03019b44-fb0a-42bb-ab7f-b109f9118d62', 2, 30, b'1', '92e96d69-e49f-4668-8448-39da27315448', NULL),
('bf86f8a4-e6ea-4d2b-827b-fac7b738519f', NULL, 'auth-otp-form', 'cibmtr-bioinformatics-realm', 'a582cb6d-479a-4bee-9c94-4fe1e011b5eb', 0, 20, b'0', NULL, NULL),
('bf9ee7f4-ccd7-4c7e-aa7e-e3f43c08779b', NULL, 'client-secret', 'master', 'c486d764-c8c6-416e-98cf-45a19bb6746d', 2, 10, b'0', NULL, NULL),
('bfabcd7f-907e-4a01-8a53-2c16cbcdd501', NULL, 'auth-cookie', 'cibmtr-bioinformatics-realm', '03019b44-fb0a-42bb-ab7f-b109f9118d62', 2, 10, b'0', NULL, NULL),
('bfaee21a-41db-43a6-a2fa-e322719c4df9', NULL, 'client-jwt', 'master', 'c486d764-c8c6-416e-98cf-45a19bb6746d', 2, 20, b'0', NULL, NULL),
('c538455b-60d2-4c69-bd38-da1a060fd4c9', NULL, 'conditional-user-configured', 'cibmtr-bioinformatics-realm', 'a582cb6d-479a-4bee-9c94-4fe1e011b5eb', 0, 10, b'0', NULL, NULL),
('c57143ca-6534-40c9-9ee8-d24f6e1a72b8', NULL, NULL, 'cibmtr-bioinformatics-realm', 'a9ba05b7-f6f2-45bf-8ac6-dbd41d30dd91', 2, 20, b'1', '7fac2a6a-a4a9-4132-bf62-83bc22877c47', NULL),
('c7aedce4-aae3-4950-a6b7-13ea897620f6', NULL, 'idp-create-user-if-unique', 'cibmtr-bioinformatics-realm', '917dfac2-9890-4127-85c4-250fd9b4ff30', 2, 10, b'0', NULL, 'c6e2a3c8-0e67-4a2f-8ec5-5f113f1a052c'),
('cc749faf-e4a3-446e-94c4-01a4c7245701', NULL, NULL, 'cibmtr-bioinformatics-realm', '4792c881-7800-47a7-9264-c2f50d602ee9', 1, 30, b'1', '422c1ae4-70bc-4d99-b937-485bbe98d800', NULL),
('ce34e18f-e9f3-47df-8d8f-116f03248594', NULL, NULL, 'master', '084f926f-6967-4bcb-b80e-31207678cf2c', 1, 30, b'1', 'e1f938a4-3754-4a36-ad91-6af2bb071f3c', NULL),
('d0b347bf-56b5-458e-8910-d0f76365191a', NULL, 'no-cookie-redirect', 'cibmtr-bioinformatics-realm', '0b546166-822c-4450-b22a-40e710d79853', 0, 10, b'0', NULL, NULL),
('d60f5fdf-d489-4003-b87a-2bc354a3093f', NULL, 'registration-password-action', 'cibmtr-bioinformatics-realm', '7344671e-65ba-43b8-a95b-ef85ba95a693', 0, 50, b'0', NULL, NULL),
('d8155474-e1be-41d5-b04a-9262296d5f0e', NULL, NULL, 'cibmtr-bioinformatics-realm', '92e96d69-e49f-4668-8448-39da27315448', 1, 20, b'1', '9e0960af-64e7-4877-815e-ad75156fd238', NULL),
('da1a1bbf-7c99-4926-b3f6-f6a742734915', NULL, 'idp-confirm-link', 'cibmtr-bioinformatics-realm', 'd4aa3e02-2fca-406a-a711-cd6919967b26', 0, 10, b'0', NULL, NULL),
('de5aec9c-9d54-43b8-ad39-08c730212727', NULL, 'registration-user-creation', 'master', '4dcee836-1071-4f3c-b09c-8314ba300b34', 0, 20, b'0', NULL, NULL),
('deec6dd3-c655-42ae-8e39-8a5c4e6182cf', NULL, 'http-basic-authenticator', 'master', '96b348ec-bae4-490a-9c5f-f21770b2087b', 0, 10, b'0', NULL, NULL),
('defdf2d8-510c-405d-8e55-9dfdefc51848', NULL, 'idp-review-profile', 'cibmtr-bioinformatics-realm', 'df7b4317-4aad-43c3-bce9-aa7996206c91', 0, 10, b'0', NULL, 'e9774b41-3fda-4539-9db5-10805b1d7d2b'),
('e089d26f-08ff-47be-9539-903ce02ed00b', NULL, 'basic-auth', 'cibmtr-bioinformatics-realm', '0b546166-822c-4450-b22a-40e710d79853', 0, 20, b'0', NULL, NULL),
('e3c85079-743c-4f0c-b045-ec5ac3cbf873', NULL, 'auth-spnego', 'cibmtr-bioinformatics-realm', '0b546166-822c-4450-b22a-40e710d79853', 3, 40, b'0', NULL, NULL),
('e5fc3f70-5563-4f0e-b5e0-b803b8cf07ee', NULL, 'reset-credentials-choose-user', 'cibmtr-bioinformatics-realm', '9fcbb697-dadf-4079-9b02-f489c7394182', 0, 10, b'0', NULL, NULL),
('e69e5e0b-238e-44b5-89f4-e6bcfa52d8c4', NULL, 'conditional-user-configured', 'master', 'a0dea53c-b018-4611-bf85-bf62d7dd490b', 0, 10, b'0', NULL, NULL),
('e6f69827-eb52-4197-8822-921ecea4347a', NULL, 'conditional-user-configured', 'master', 'b835f851-c9de-4976-99cb-f7c3f2de2738', 0, 10, b'0', NULL, NULL),
('ed6055df-634d-4096-939b-3b6461cc456d', NULL, 'conditional-user-configured', 'master', 'f66142a2-b680-470b-ac3f-110337499e2e', 0, 10, b'0', NULL, NULL),
('efed1bde-8576-4c04-a777-f415422588de', NULL, 'client-secret-jwt', 'master', 'c486d764-c8c6-416e-98cf-45a19bb6746d', 2, 30, b'0', NULL, NULL),
('f1d2fc3f-f5ca-4119-aedb-7f97ee7eb2df', NULL, 'auth-username-password-form', 'cibmtr-bioinformatics-realm', '92e96d69-e49f-4668-8448-39da27315448', 0, 10, b'0', NULL, NULL),
('f272512a-db63-4048-818c-41828db59669', NULL, 'registration-password-action', 'master', '4dcee836-1071-4f3c-b09c-8314ba300b34', 0, 50, b'0', NULL, NULL),
('f2a6d32e-6b9d-46f4-ab10-f9f8a29f1696', NULL, 'reset-credentials-choose-user', 'master', '02dbcfec-7c6a-4a98-81df-8839f710c4a8', 0, 10, b'0', NULL, NULL),
('f7a4b4a2-39cd-4b1d-aea3-49e97a823c38', NULL, 'client-x509', 'master', 'c486d764-c8c6-416e-98cf-45a19bb6746d', 2, 40, b'0', NULL, NULL),
('fdc85783-7ad2-4cdb-b5eb-6aee3831cbf0', NULL, 'idp-confirm-link', 'master', '31583d45-da22-48bc-a9d6-6ec9d819c607', 0, 10, b'0', NULL, NULL),
('ffe1a172-ff90-447b-99e3-282f2649fb2c', NULL, 'basic-auth-otp', 'cibmtr-bioinformatics-realm', '0b546166-822c-4450-b22a-40e710d79853', 3, 30, b'0', NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `authentication_flow`
--

DROP TABLE IF EXISTS `authentication_flow`;
CREATE TABLE IF NOT EXISTS `authentication_flow` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_ID` varchar(36) NOT NULL DEFAULT 'basic-flow',
  `TOP_LEVEL` bit(1) NOT NULL DEFAULT b'0',
  `BUILT_IN` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_FLOW_REALM` (`REALM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `authentication_flow`
--

INSERT INTO `authentication_flow` (`ID`, `ALIAS`, `DESCRIPTION`, `REALM_ID`, `PROVIDER_ID`, `TOP_LEVEL`, `BUILT_IN`) VALUES
('02dbcfec-7c6a-4a98-81df-8839f710c4a8', 'reset credentials', 'Reset credentials for a user if they forgot their password or something', 'master', 'basic-flow', b'1', b'1'),
('03019b44-fb0a-42bb-ab7f-b109f9118d62', 'browser', 'browser based authentication', 'cibmtr-bioinformatics-realm', 'basic-flow', b'1', b'1'),
('084f926f-6967-4bcb-b80e-31207678cf2c', 'direct grant', 'OpenID Connect Resource Owner Grant', 'master', 'basic-flow', b'1', b'1'),
('09a729e8-7ede-4d69-822c-59ea50e9c4eb', 'docker auth', 'Used by Docker clients to authenticate against the IDP', 'master', 'basic-flow', b'1', b'1'),
('0b546166-822c-4450-b22a-40e710d79853', 'http challenge', 'An authentication flow based on challenge-response HTTP Authentication Schemes', 'cibmtr-bioinformatics-realm', 'basic-flow', b'1', b'1'),
('108beb66-4d4d-460e-af6e-6d46bbe6f7e6', 'saml ecp', 'SAML ECP Profile Authentication Flow', 'cibmtr-bioinformatics-realm', 'basic-flow', b'1', b'1'),
('15ffed78-3316-425a-9649-11107e54c743', 'registration', 'registration flow', 'master', 'basic-flow', b'1', b'1'),
('1a06b73c-7e02-4fe8-8e90-6e1bcd851d47', 'http challenge', 'An authentication flow based on challenge-response HTTP Authentication Schemes', 'master', 'basic-flow', b'1', b'1'),
('219b8c0b-e134-4d83-8da6-c1e6d3b166a9', 'User creation or linking', 'Flow for the existing/non-existing user alternatives', 'master', 'basic-flow', b'0', b'1'),
('26eac2ed-1c76-4889-9490-fbab660f9678', 'first broker login', 'Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account', 'master', 'basic-flow', b'1', b'1'),
('31583d45-da22-48bc-a9d6-6ec9d819c607', 'Handle Existing Account', 'Handle what to do if there is existing account with same email/username like authenticated identity provider', 'master', 'basic-flow', b'0', b'1'),
('422c1ae4-70bc-4d99-b937-485bbe98d800', 'direct grant - direct-grant-validate-otp - Conditional', 'Flow to determine if the direct-grant-validate-otp authenticator should be used or not.', 'cibmtr-bioinformatics-realm', 'basic-flow', b'0', b'1'),
('4792c881-7800-47a7-9264-c2f50d602ee9', 'direct grant', 'OpenID Connect Resource Owner Grant', 'cibmtr-bioinformatics-realm', 'basic-flow', b'1', b'1'),
('4c6da64c-81dd-4680-afc5-744c93cd8286', 'registration', 'registration flow', 'cibmtr-bioinformatics-realm', 'basic-flow', b'1', b'1'),
('4dcee836-1071-4f3c-b09c-8314ba300b34', 'registration form', 'registration form', 'master', 'form-flow', b'0', b'1'),
('5f2605db-ce9c-4997-bc0d-a1a7b5f597e4', 'Authentication Options', 'Authentication options.', 'master', 'basic-flow', b'0', b'1'),
('7344671e-65ba-43b8-a95b-ef85ba95a693', 'registration form', 'registration form', 'cibmtr-bioinformatics-realm', 'form-flow', b'0', b'1'),
('7fac2a6a-a4a9-4132-bf62-83bc22877c47', 'Verify Existing Account by Re-authentication', 'Reauthentication of existing account', 'cibmtr-bioinformatics-realm', 'basic-flow', b'0', b'1'),
('917dfac2-9890-4127-85c4-250fd9b4ff30', 'first broker login - Alternatives - 0', 'Subflow of first broker login with alternative executions', 'cibmtr-bioinformatics-realm', 'basic-flow', b'0', b'1'),
('92e96d69-e49f-4668-8448-39da27315448', 'forms', 'Username, password, otp and other auth forms.', 'cibmtr-bioinformatics-realm', 'basic-flow', b'0', b'1'),
('96b348ec-bae4-490a-9c5f-f21770b2087b', 'saml ecp', 'SAML ECP Profile Authentication Flow', 'master', 'basic-flow', b'1', b'1'),
('9e0960af-64e7-4877-815e-ad75156fd238', 'forms - auth-otp-form - Conditional', 'Flow to determine if the auth-otp-form authenticator should be used or not.', 'cibmtr-bioinformatics-realm', 'basic-flow', b'0', b'1'),
('9e83783c-39b5-42e8-a28b-99f0c3322d40', 'forms', 'Username, password, otp and other auth forms.', 'master', 'basic-flow', b'0', b'1'),
('9fcbb697-dadf-4079-9b02-f489c7394182', 'reset credentials', 'Reset credentials for a user if they forgot their password or something', 'cibmtr-bioinformatics-realm', 'basic-flow', b'1', b'1'),
('a0dea53c-b018-4611-bf85-bf62d7dd490b', 'Reset - Conditional OTP', 'Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.', 'master', 'basic-flow', b'0', b'1'),
('a582cb6d-479a-4bee-9c94-4fe1e011b5eb', 'Verify Existing Account by Re-authentication - auth-otp-form - Conditional', 'Flow to determine if the auth-otp-form authenticator should be used or not.', 'cibmtr-bioinformatics-realm', 'basic-flow', b'0', b'1'),
('a9ba05b7-f6f2-45bf-8ac6-dbd41d30dd91', 'Handle Existing Account - Alternatives - 0', 'Subflow of Handle Existing Account with alternative executions', 'cibmtr-bioinformatics-realm', 'basic-flow', b'0', b'1'),
('b2104493-52a1-4627-869b-a65b057b8147', 'clients', 'Base authentication for clients', 'cibmtr-bioinformatics-realm', 'client-flow', b'1', b'1'),
('b835f851-c9de-4976-99cb-f7c3f2de2738', 'Browser - Conditional OTP', 'Flow to determine if the OTP is required for the authentication', 'master', 'basic-flow', b'0', b'1'),
('c486d764-c8c6-416e-98cf-45a19bb6746d', 'clients', 'Base authentication for clients', 'master', 'client-flow', b'1', b'1'),
('d3f890af-35c1-4a84-8d66-d228999d7b40', 'Account verification options', 'Method with which to verity the existing account', 'master', 'basic-flow', b'0', b'1'),
('d4aa3e02-2fca-406a-a711-cd6919967b26', 'Handle Existing Account', 'Handle what to do if there is existing account with same email/username like authenticated identity provider', 'cibmtr-bioinformatics-realm', 'basic-flow', b'0', b'1'),
('d6f21945-0811-4745-9491-4d06f6891f04', 'browser', 'browser based authentication', 'master', 'basic-flow', b'1', b'1'),
('df7b4317-4aad-43c3-bce9-aa7996206c91', 'first broker login', 'Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account', 'cibmtr-bioinformatics-realm', 'basic-flow', b'1', b'1'),
('e1f938a4-3754-4a36-ad91-6af2bb071f3c', 'Direct Grant - Conditional OTP', 'Flow to determine if the OTP is required for the authentication', 'master', 'basic-flow', b'0', b'1'),
('e77f88e4-c597-4e89-8db8-7cba747d9601', 'docker auth', 'Used by Docker clients to authenticate against the IDP', 'cibmtr-bioinformatics-realm', 'basic-flow', b'1', b'1'),
('ea8e968d-8ffa-4825-9990-5e9a6b6d79f5', 'reset credentials - reset-otp - Conditional', 'Flow to determine if the reset-otp authenticator should be used or not.', 'cibmtr-bioinformatics-realm', 'basic-flow', b'0', b'1'),
('f5a59621-1cfc-469b-bf9c-a3c52b7c7865', 'Verify Existing Account by Re-authentication', 'Reauthentication of existing account', 'master', 'basic-flow', b'0', b'1'),
('f66142a2-b680-470b-ac3f-110337499e2e', 'First broker login - Conditional OTP', 'Flow to determine if the OTP is required for the authentication', 'master', 'basic-flow', b'0', b'1');

-- --------------------------------------------------------

--
-- Estrutura da tabela `authenticator_config`
--

DROP TABLE IF EXISTS `authenticator_config`;
CREATE TABLE IF NOT EXISTS `authenticator_config` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_CONFIG_REALM` (`REALM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `authenticator_config`
--

INSERT INTO `authenticator_config` (`ID`, `ALIAS`, `REALM_ID`) VALUES
('09fa2388-1a34-4443-a82a-722766928d27', 'review profile config', 'master'),
('c6e2a3c8-0e67-4a2f-8ec5-5f113f1a052c', 'create unique user config', 'cibmtr-bioinformatics-realm'),
('cc851e89-2782-40a3-84ab-bc4535bcb763', 'create unique user config', 'master'),
('e9774b41-3fda-4539-9db5-10805b1d7d2b', 'review profile config', 'cibmtr-bioinformatics-realm');

-- --------------------------------------------------------

--
-- Estrutura da tabela `authenticator_config_entry`
--

DROP TABLE IF EXISTS `authenticator_config_entry`;
CREATE TABLE IF NOT EXISTS `authenticator_config_entry` (
  `AUTHENTICATOR_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`AUTHENTICATOR_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `authenticator_config_entry`
--

INSERT INTO `authenticator_config_entry` (`AUTHENTICATOR_ID`, `VALUE`, `NAME`) VALUES
('09fa2388-1a34-4443-a82a-722766928d27', 'missing', 'update.profile.on.first.login'),
('c6e2a3c8-0e67-4a2f-8ec5-5f113f1a052c', 'false', 'require.password.update.after.registration'),
('cc851e89-2782-40a3-84ab-bc4535bcb763', 'false', 'require.password.update.after.registration'),
('e9774b41-3fda-4539-9db5-10805b1d7d2b', 'missing', 'update.profile.on.first.login');

-- --------------------------------------------------------

--
-- Estrutura da tabela `broker_link`
--

DROP TABLE IF EXISTS `broker_link`;
CREATE TABLE IF NOT EXISTS `broker_link` (
  `IDENTITY_PROVIDER` varchar(255) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `BROKER_USER_ID` varchar(255) DEFAULT NULL,
  `BROKER_USERNAME` varchar(255) DEFAULT NULL,
  `TOKEN` text,
  `USER_ID` varchar(255) NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `ID` varchar(36) NOT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `FULL_SCOPE_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int DEFAULT NULL,
  `PUBLIC_CLIENT` bit(1) NOT NULL DEFAULT b'0',
  `SECRET` varchar(255) DEFAULT NULL,
  `BASE_URL` varchar(255) DEFAULT NULL,
  `BEARER_ONLY` bit(1) NOT NULL DEFAULT b'0',
  `MANAGEMENT_URL` varchar(255) DEFAULT NULL,
  `SURROGATE_AUTH_REQUIRED` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) DEFAULT NULL,
  `PROTOCOL` varchar(255) DEFAULT NULL,
  `NODE_REREG_TIMEOUT` int DEFAULT '0',
  `FRONTCHANNEL_LOGOUT` bit(1) NOT NULL DEFAULT b'0',
  `CONSENT_REQUIRED` bit(1) NOT NULL DEFAULT b'0',
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SERVICE_ACCOUNTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `CLIENT_AUTHENTICATOR_TYPE` varchar(255) DEFAULT NULL,
  `ROOT_URL` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REGISTRATION_TOKEN` varchar(255) DEFAULT NULL,
  `STANDARD_FLOW_ENABLED` bit(1) NOT NULL DEFAULT b'1',
  `IMPLICIT_FLOW_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DIRECT_ACCESS_GRANTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `ALWAYS_DISPLAY_IN_CONSOLE` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_B71CJLBENV945RB6GCON438AT` (`REALM_ID`,`CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `client`
--

INSERT INTO `client` (`ID`, `ENABLED`, `FULL_SCOPE_ALLOWED`, `CLIENT_ID`, `NOT_BEFORE`, `PUBLIC_CLIENT`, `SECRET`, `BASE_URL`, `BEARER_ONLY`, `MANAGEMENT_URL`, `SURROGATE_AUTH_REQUIRED`, `REALM_ID`, `PROTOCOL`, `NODE_REREG_TIMEOUT`, `FRONTCHANNEL_LOGOUT`, `CONSENT_REQUIRED`, `NAME`, `SERVICE_ACCOUNTS_ENABLED`, `CLIENT_AUTHENTICATOR_TYPE`, `ROOT_URL`, `DESCRIPTION`, `REGISTRATION_TOKEN`, `STANDARD_FLOW_ENABLED`, `IMPLICIT_FLOW_ENABLED`, `DIRECT_ACCESS_GRANTS_ENABLED`, `ALWAYS_DISPLAY_IN_CONSOLE`) VALUES
('0aa176c1-8d28-4a8b-8e97-7e4b49a289ff', b'1', b'0', 'security-admin-console', 0, b'1', '**********', '/admin/CIBMTR-BioInformatics-Realm/console/', b'0', NULL, b'0', 'cibmtr-bioinformatics-realm', 'openid-connect', 0, b'0', b'0', '${client_security-admin-console}', b'0', 'client-secret', '${authAdminUrl}', NULL, NULL, b'1', b'0', b'0', b'0'),
('1cdadc8e-1773-47bc-9c01-875f84ea25ec', b'1', b'1', 'CIBMTR-BioInformatics-Realm', 0, b'0', '67bda7fd-482c-4050-82cd-744d117b4092', NULL, b'1', NULL, b'0', 'master', 'openid-connect', 0, b'0', b'0', 'CIBMTR-BioInformatics-Realm', b'0', 'client-secret', NULL, 'NMDP / CIBMTR-BioInformatics-Realm', NULL, b'1', b'0', b'0', b'0'),
('1eabef67-6473-4ba8-b07c-14bdbae4aaed', b'1', b'1', 'PhycusSHFCApp', 0, b'0', '2981ec96-1e1a-4c41-a0dc-507ae757e6ac', 'http://172.17.0.1:8080/phycusApp', b'0', 'http://172.17.0.1:8080/phycusApp', b'0', 'cibmtr-bioinformatics-realm', 'openid-connect', -1, b'0', b'0', 'PhycusSHFCApp', b'1', 'client-secret', '', 'PhycusSHFCApp Web App from NMDP/CIBMTR BioInformatics', NULL, b'1', b'1', b'1', b'0'),
('274afcdb-7742-4a3a-acc5-17db61a4d200', b'1', b'0', 'broker', 0, b'0', '**********', NULL, b'0', NULL, b'0', 'cibmtr-bioinformatics-realm', 'openid-connect', 0, b'0', b'0', '${client_broker}', b'0', 'client-secret', NULL, NULL, NULL, b'1', b'0', b'0', b'0'),
('3deba736-cf6f-44b8-8022-31f82347cc96', b'1', b'0', 'account-console', 0, b'1', '50a143b5-6ff7-4152-ab77-0b592ca439d1', '/realms/master/account/', b'0', NULL, b'0', 'master', 'openid-connect', 0, b'0', b'0', '${client_account-console}', b'0', 'client-secret', '${authBaseUrl}', NULL, NULL, b'1', b'0', b'0', b'0'),
('48fb7988-d909-445a-81db-fe825dca0db2', b'1', b'0', 'realm-management', 0, b'0', '**********', NULL, b'1', NULL, b'0', 'cibmtr-bioinformatics-realm', 'openid-connect', 0, b'0', b'0', '${client_realm-management}', b'0', 'client-secret', NULL, NULL, NULL, b'1', b'0', b'0', b'0'),
('5a9610bf-6a47-46a1-9442-9e43eacd98e8', b'1', b'0', 'admin-cli', 0, b'1', '**********', NULL, b'0', NULL, b'0', 'cibmtr-bioinformatics-realm', 'openid-connect', 0, b'0', b'0', '${client_admin-cli}', b'0', 'client-secret', NULL, NULL, NULL, b'0', b'0', b'1', b'0'),
('7b6ab455-242e-42aa-96d8-9c9e2b74da9d', b'1', b'0', 'account-console', 0, b'1', '**********', '/realms/cibmtr-bioinformatics-realm/account/', b'0', NULL, b'0', 'cibmtr-bioinformatics-realm', 'openid-connect', 0, b'0', b'0', '${client_account-console}', b'0', 'client-secret', '${authBaseUrl}', NULL, NULL, b'1', b'0', b'0', b'0'),
('98ae8603-4547-4218-8fb9-ebc550a0e10b', b'1', b'1', 'internal', 0, b'0', 'internal', NULL, b'0', NULL, b'0', 'cibmtr-bioinformatics-realm', 'openid-connect', -1, b'0', b'0', NULL, b'1', 'client-secret', NULL, NULL, NULL, b'0', b'0', b'0', b'0'),
('a48b81bb-db56-42a4-bf31-336a6e335001', b'1', b'0', 'admin-cli', 0, b'1', 'b4686441-2a6c-43f4-8be7-ab14b0de9daf', NULL, b'0', NULL, b'0', 'master', 'openid-connect', 0, b'0', b'0', '${client_admin-cli}', b'0', 'client-secret', NULL, NULL, NULL, b'0', b'0', b'1', b'0'),
('ab9a50dd-ef39-46cf-add0-af8ce9a00e61', b'1', b'0', 'security-admin-console', 0, b'1', '993b943b-ba74-4bec-b803-45f5f18cf8f4', '/admin/master/console/', b'0', NULL, b'0', 'master', 'openid-connect', 0, b'0', b'0', '${client_security-admin-console}', b'0', 'client-secret', '${authAdminUrl}', NULL, NULL, b'1', b'0', b'0', b'0'),
('bf8531b6-2a19-45e2-9a41-7a25d38ad69d', b'1', b'0', 'broker', 0, b'0', 'b1bb93eb-3463-4951-bf82-9428340bbfca', NULL, b'0', NULL, b'0', 'master', 'openid-connect', 0, b'0', b'0', '${client_broker}', b'0', 'client-secret', NULL, NULL, NULL, b'1', b'0', b'0', b'0'),
('e07da50b-cddc-4524-b630-436a5a6ba8ab', b'1', b'0', 'account', 0, b'0', '**********', '/realms/CIBMTR-BioInformatics-Realm/account/', b'0', NULL, b'0', 'cibmtr-bioinformatics-realm', 'openid-connect', 0, b'0', b'0', '${client_account}', b'0', 'client-secret', '${authBaseUrl}', NULL, NULL, b'1', b'0', b'0', b'0'),
('f1cbf82e-a285-4a15-a172-ff97732a2648', b'1', b'1', 'master-realm', 0, b'0', '106e73b7-1445-45f0-be44-5ac1f01be92e', NULL, b'1', NULL, b'0', 'master', NULL, 0, b'0', b'0', 'master Realm', b'0', 'client-secret', NULL, NULL, NULL, b'1', b'0', b'0', b'0'),
('f7123f46-5de8-4c40-8cff-5c52b3e26a84', b'1', b'0', 'account', 0, b'0', '262d9c71-22a7-4794-b2f7-3f63df3db367', '/realms/master/account/', b'0', NULL, b'0', 'master', 'openid-connect', 0, b'0', b'0', '${client_account}', b'0', 'client-secret', '${authBaseUrl}', NULL, NULL, b'1', b'0', b'0', b'0');

-- --------------------------------------------------------

--
-- Estrutura da tabela `client_attributes`
--

DROP TABLE IF EXISTS `client_attributes`;
CREATE TABLE IF NOT EXISTS `client_attributes` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` text,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `client_attributes`
--

INSERT INTO `client_attributes` (`CLIENT_ID`, `VALUE`, `NAME`) VALUES
('0aa176c1-8d28-4a8b-8e97-7e4b49a289ff', 'S256', 'pkce.code.challenge.method'),
('1cdadc8e-1773-47bc-9c01-875f84ea25ec', 'false', 'display.on.consent.screen'),
('1cdadc8e-1773-47bc-9c01-875f84ea25ec', 'false', 'exclude.session.state.from.auth.response'),
('1cdadc8e-1773-47bc-9c01-875f84ea25ec', 'false', 'saml_force_name_id_format'),
('1cdadc8e-1773-47bc-9c01-875f84ea25ec', 'false', 'saml.assertion.signature'),
('1cdadc8e-1773-47bc-9c01-875f84ea25ec', 'false', 'saml.authnstatement'),
('1cdadc8e-1773-47bc-9c01-875f84ea25ec', 'false', 'saml.client.signature'),
('1cdadc8e-1773-47bc-9c01-875f84ea25ec', 'false', 'saml.encrypt'),
('1cdadc8e-1773-47bc-9c01-875f84ea25ec', 'false', 'saml.force.post.binding'),
('1cdadc8e-1773-47bc-9c01-875f84ea25ec', 'false', 'saml.multivalued.roles'),
('1cdadc8e-1773-47bc-9c01-875f84ea25ec', 'false', 'saml.onetimeuse.condition'),
('1cdadc8e-1773-47bc-9c01-875f84ea25ec', 'false', 'saml.server.signature'),
('1cdadc8e-1773-47bc-9c01-875f84ea25ec', 'false', 'saml.server.signature.keyinfo.ext'),
('1cdadc8e-1773-47bc-9c01-875f84ea25ec', 'false', 'tls.client.certificate.bound.access.tokens'),
('1eabef67-6473-4ba8-b07c-14bdbae4aaed', '', 'access.token.signed.response.alg'),
('1eabef67-6473-4ba8-b07c-14bdbae4aaed', 'false', 'display.on.consent.screen'),
('1eabef67-6473-4ba8-b07c-14bdbae4aaed', 'false', 'exclude.session.state.from.auth.response'),
('1eabef67-6473-4ba8-b07c-14bdbae4aaed', '', 'id.token.signed.response.alg'),
('1eabef67-6473-4ba8-b07c-14bdbae4aaed', 'false', 'saml_force_name_id_format'),
('1eabef67-6473-4ba8-b07c-14bdbae4aaed', 'false', 'saml.assertion.signature'),
('1eabef67-6473-4ba8-b07c-14bdbae4aaed', 'false', 'saml.authnstatement'),
('1eabef67-6473-4ba8-b07c-14bdbae4aaed', 'false', 'saml.client.signature'),
('1eabef67-6473-4ba8-b07c-14bdbae4aaed', 'false', 'saml.encrypt'),
('1eabef67-6473-4ba8-b07c-14bdbae4aaed', 'false', 'saml.force.post.binding'),
('1eabef67-6473-4ba8-b07c-14bdbae4aaed', 'false', 'saml.multivalued.roles'),
('1eabef67-6473-4ba8-b07c-14bdbae4aaed', 'false', 'saml.onetimeuse.condition'),
('1eabef67-6473-4ba8-b07c-14bdbae4aaed', 'false', 'saml.server.signature'),
('1eabef67-6473-4ba8-b07c-14bdbae4aaed', 'false', 'saml.server.signature.keyinfo.ext'),
('1eabef67-6473-4ba8-b07c-14bdbae4aaed', 'false', 'tls.client.certificate.bound.access.tokens'),
('3deba736-cf6f-44b8-8022-31f82347cc96', 'S256', 'pkce.code.challenge.method'),
('7b6ab455-242e-42aa-96d8-9c9e2b74da9d', 'false', 'display.on.consent.screen'),
('7b6ab455-242e-42aa-96d8-9c9e2b74da9d', 'false', 'exclude.session.state.from.auth.response'),
('7b6ab455-242e-42aa-96d8-9c9e2b74da9d', 'S256', 'pkce.code.challenge.method'),
('7b6ab455-242e-42aa-96d8-9c9e2b74da9d', 'false', 'saml_force_name_id_format'),
('7b6ab455-242e-42aa-96d8-9c9e2b74da9d', 'false', 'saml.assertion.signature'),
('7b6ab455-242e-42aa-96d8-9c9e2b74da9d', 'false', 'saml.authnstatement'),
('7b6ab455-242e-42aa-96d8-9c9e2b74da9d', 'false', 'saml.client.signature'),
('7b6ab455-242e-42aa-96d8-9c9e2b74da9d', 'false', 'saml.encrypt'),
('7b6ab455-242e-42aa-96d8-9c9e2b74da9d', 'false', 'saml.force.post.binding'),
('7b6ab455-242e-42aa-96d8-9c9e2b74da9d', 'false', 'saml.multivalued.roles'),
('7b6ab455-242e-42aa-96d8-9c9e2b74da9d', 'false', 'saml.onetimeuse.condition'),
('7b6ab455-242e-42aa-96d8-9c9e2b74da9d', 'false', 'saml.server.signature'),
('7b6ab455-242e-42aa-96d8-9c9e2b74da9d', 'false', 'saml.server.signature.keyinfo.ext'),
('7b6ab455-242e-42aa-96d8-9c9e2b74da9d', 'false', 'tls.client.certificate.bound.access.tokens'),
('98ae8603-4547-4218-8fb9-ebc550a0e10b', 'false', 'display.on.consent.screen'),
('98ae8603-4547-4218-8fb9-ebc550a0e10b', 'false', 'exclude.session.state.from.auth.response'),
('98ae8603-4547-4218-8fb9-ebc550a0e10b', 'false', 'saml_force_name_id_format'),
('98ae8603-4547-4218-8fb9-ebc550a0e10b', 'false', 'saml.assertion.signature'),
('98ae8603-4547-4218-8fb9-ebc550a0e10b', 'false', 'saml.authnstatement'),
('98ae8603-4547-4218-8fb9-ebc550a0e10b', 'false', 'saml.client.signature'),
('98ae8603-4547-4218-8fb9-ebc550a0e10b', 'false', 'saml.encrypt'),
('98ae8603-4547-4218-8fb9-ebc550a0e10b', 'false', 'saml.force.post.binding'),
('98ae8603-4547-4218-8fb9-ebc550a0e10b', 'false', 'saml.multivalued.roles'),
('98ae8603-4547-4218-8fb9-ebc550a0e10b', 'false', 'saml.onetimeuse.condition'),
('98ae8603-4547-4218-8fb9-ebc550a0e10b', 'false', 'saml.server.signature'),
('98ae8603-4547-4218-8fb9-ebc550a0e10b', 'false', 'saml.server.signature.keyinfo.ext'),
('98ae8603-4547-4218-8fb9-ebc550a0e10b', 'false', 'tls.client.certificate.bound.access.tokens'),
('ab9a50dd-ef39-46cf-add0-af8ce9a00e61', 'S256', 'pkce.code.challenge.method');

-- --------------------------------------------------------

--
-- Estrutura da tabela `client_auth_flow_bindings`
--

DROP TABLE IF EXISTS `client_auth_flow_bindings`;
CREATE TABLE IF NOT EXISTS `client_auth_flow_bindings` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `FLOW_ID` varchar(36) DEFAULT NULL,
  `BINDING_NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`BINDING_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `client_default_roles`
--

DROP TABLE IF EXISTS `client_default_roles`;
CREATE TABLE IF NOT EXISTS `client_default_roles` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`ROLE_ID`),
  UNIQUE KEY `UK_8AELWNIBJI49AVXSRTUF6XJOW` (`ROLE_ID`),
  KEY `IDX_CLIENT_DEF_ROLES_CLIENT` (`CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `client_default_roles`
--

INSERT INTO `client_default_roles` (`CLIENT_ID`, `ROLE_ID`) VALUES
('e07da50b-cddc-4524-b630-436a5a6ba8ab', '21b65e52-b4e3-453e-b0f0-10a44a4a887d'),
('e07da50b-cddc-4524-b630-436a5a6ba8ab', '354b3a09-47a6-4051-957c-c6a3ee28a190'),
('f7123f46-5de8-4c40-8cff-5c52b3e26a84', 'aebcd69a-6a42-4790-9d80-6ad44be3f0e3'),
('f7123f46-5de8-4c40-8cff-5c52b3e26a84', 'b6e3d2e0-ba1a-4420-84d1-2cf72096fd38');

-- --------------------------------------------------------

--
-- Estrutura da tabela `client_initial_access`
--

DROP TABLE IF EXISTS `client_initial_access`;
CREATE TABLE IF NOT EXISTS `client_initial_access` (
  `ID` varchar(36) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `TIMESTAMP` int DEFAULT NULL,
  `EXPIRATION` int DEFAULT NULL,
  `COUNT` int DEFAULT NULL,
  `REMAINING_COUNT` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_CLIENT_INIT_ACC_REALM` (`REALM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `client_node_registrations`
--

DROP TABLE IF EXISTS `client_node_registrations`;
CREATE TABLE IF NOT EXISTS `client_node_registrations` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` int DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `client_scope`
--

DROP TABLE IF EXISTS `client_scope`;
CREATE TABLE IF NOT EXISTS `client_scope` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PROTOCOL` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_CLI_SCOPE` (`REALM_ID`,`NAME`),
  KEY `IDX_REALM_CLSCOPE` (`REALM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `client_scope`
--

INSERT INTO `client_scope` (`ID`, `NAME`, `REALM_ID`, `DESCRIPTION`, `PROTOCOL`) VALUES
('021d9ac1-9650-401c-b2a2-efa2f3e6b70c', 'roles', 'cibmtr-bioinformatics-realm', 'OpenID Connect scope for add user roles to the access token', 'openid-connect'),
('0d3b55db-e68b-4c83-91d4-7370a6810a24', 'phone', 'cibmtr-bioinformatics-realm', 'OpenID Connect built-in scope: phone', 'openid-connect'),
('1c9c1b4c-ccb9-4e8f-82b7-5b3a4ac06229', 'role_list', 'master', 'SAML role list', 'saml'),
('1dc1e050-891a-4f5b-ac9d-5ea0c2e3c05e', 'address', 'cibmtr-bioinformatics-realm', 'OpenID Connect built-in scope: address', 'openid-connect'),
('386b2097-465b-4135-a057-62709870909e', 'phone', 'master', 'OpenID Connect built-in scope: phone', 'openid-connect'),
('38793860-edb1-452f-b2e0-e5ad2041cb70', 'profile', 'master', 'OpenID Connect built-in scope: profile', 'openid-connect'),
('3880d5d9-fced-4446-97fe-0434f2bb76ea', 'PhycusSHFCClientScopeClaims01', 'cibmtr-bioinformatics-realm', 'PhycusSHFC Specific Claims', 'openid-connect'),
('391f1641-cb22-41a3-a0ed-752d9264aaf5', 'role_list', 'cibmtr-bioinformatics-realm', 'SAML role list', 'saml'),
('39e1693b-a924-4fbb-b98c-520869771f83', 'email', 'cibmtr-bioinformatics-realm', 'OpenID Connect built-in scope: email', 'openid-connect'),
('5253d2be-3116-4510-ac05-99619ce2494c', 'offline_access', 'cibmtr-bioinformatics-realm', 'OpenID Connect built-in scope: offline_access', 'openid-connect'),
('55178e4f-7c18-4d0d-b010-f9e4079d5d48', 'web-origins', 'master', 'OpenID Connect scope for add allowed web origins to the access token', 'openid-connect'),
('84fdcb72-668b-408e-aaea-110d594afe5e', 'web-origins', 'cibmtr-bioinformatics-realm', 'OpenID Connect scope for add allowed web origins to the access token', 'openid-connect'),
('8dee153c-4e64-435f-8a7c-cd9de0eb653d', 'address', 'master', 'OpenID Connect built-in scope: address', 'openid-connect'),
('8f9a1a9c-4bdf-41e2-a75b-544a12be1d67', 'offline_access', 'master', 'OpenID Connect built-in scope: offline_access', 'openid-connect'),
('a72d436e-111b-445b-804a-967d249f6455', 'microprofile-jwt', 'cibmtr-bioinformatics-realm', 'Microprofile - JWT built-in scope', 'openid-connect'),
('a749b2db-a1ac-4e58-9fd3-1142e96b0445', 'microprofile-jwt', 'master', 'Microprofile - JWT built-in scope', 'openid-connect'),
('bd76f66d-85f6-44a6-ad5a-133b3f32016a', 'email', 'master', 'OpenID Connect built-in scope: email', 'openid-connect'),
('d5de6a8a-8894-4e72-b6ef-f9bf3a7a6541', 'profile', 'cibmtr-bioinformatics-realm', 'OpenID Connect built-in scope: profile', 'openid-connect'),
('e3279721-a5de-46c7-b463-8d076a1631ae', 'roles', 'master', 'OpenID Connect scope for add user roles to the access token', 'openid-connect');

-- --------------------------------------------------------

--
-- Estrutura da tabela `client_scope_attributes`
--

DROP TABLE IF EXISTS `client_scope_attributes`;
CREATE TABLE IF NOT EXISTS `client_scope_attributes` (
  `SCOPE_ID` varchar(36) NOT NULL,
  `VALUE` text,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`NAME`),
  KEY `IDX_CLSCOPE_ATTRS` (`SCOPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `client_scope_attributes`
--

INSERT INTO `client_scope_attributes` (`SCOPE_ID`, `VALUE`, `NAME`) VALUES
('021d9ac1-9650-401c-b2a2-efa2f3e6b70c', '${rolesScopeConsentText}', 'consent.screen.text'),
('021d9ac1-9650-401c-b2a2-efa2f3e6b70c', 'true', 'display.on.consent.screen'),
('021d9ac1-9650-401c-b2a2-efa2f3e6b70c', 'false', 'include.in.token.scope'),
('0d3b55db-e68b-4c83-91d4-7370a6810a24', '${phoneScopeConsentText}', 'consent.screen.text'),
('0d3b55db-e68b-4c83-91d4-7370a6810a24', 'true', 'display.on.consent.screen'),
('1c9c1b4c-ccb9-4e8f-82b7-5b3a4ac06229', '${samlRoleListScopeConsentText}', 'consent.screen.text'),
('1c9c1b4c-ccb9-4e8f-82b7-5b3a4ac06229', 'true', 'display.on.consent.screen'),
('1dc1e050-891a-4f5b-ac9d-5ea0c2e3c05e', '${addressScopeConsentText}', 'consent.screen.text'),
('1dc1e050-891a-4f5b-ac9d-5ea0c2e3c05e', 'true', 'display.on.consent.screen'),
('386b2097-465b-4135-a057-62709870909e', '${phoneScopeConsentText}', 'consent.screen.text'),
('386b2097-465b-4135-a057-62709870909e', 'true', 'display.on.consent.screen'),
('386b2097-465b-4135-a057-62709870909e', 'true', 'include.in.token.scope'),
('38793860-edb1-452f-b2e0-e5ad2041cb70', '${profileScopeConsentText}', 'consent.screen.text'),
('38793860-edb1-452f-b2e0-e5ad2041cb70', 'true', 'display.on.consent.screen'),
('38793860-edb1-452f-b2e0-e5ad2041cb70', 'true', 'include.in.token.scope'),
('3880d5d9-fced-4446-97fe-0434f2bb76ea', 'Data fields you are consenting access.', 'consent.screen.text'),
('3880d5d9-fced-4446-97fe-0434f2bb76ea', 'true', 'display.on.consent.screen'),
('3880d5d9-fced-4446-97fe-0434f2bb76ea', 'true', 'include.in.token.scope'),
('391f1641-cb22-41a3-a0ed-752d9264aaf5', '${samlRoleListScopeConsentText}', 'consent.screen.text'),
('391f1641-cb22-41a3-a0ed-752d9264aaf5', 'true', 'display.on.consent.screen'),
('39e1693b-a924-4fbb-b98c-520869771f83', '${emailScopeConsentText}', 'consent.screen.text'),
('39e1693b-a924-4fbb-b98c-520869771f83', 'true', 'display.on.consent.screen'),
('5253d2be-3116-4510-ac05-99619ce2494c', '${offlineAccessScopeConsentText}', 'consent.screen.text'),
('5253d2be-3116-4510-ac05-99619ce2494c', 'true', 'display.on.consent.screen'),
('55178e4f-7c18-4d0d-b010-f9e4079d5d48', '', 'consent.screen.text'),
('55178e4f-7c18-4d0d-b010-f9e4079d5d48', 'false', 'display.on.consent.screen'),
('55178e4f-7c18-4d0d-b010-f9e4079d5d48', 'false', 'include.in.token.scope'),
('84fdcb72-668b-408e-aaea-110d594afe5e', '', 'consent.screen.text'),
('84fdcb72-668b-408e-aaea-110d594afe5e', 'false', 'display.on.consent.screen'),
('84fdcb72-668b-408e-aaea-110d594afe5e', 'false', 'include.in.token.scope'),
('8dee153c-4e64-435f-8a7c-cd9de0eb653d', '${addressScopeConsentText}', 'consent.screen.text'),
('8dee153c-4e64-435f-8a7c-cd9de0eb653d', 'true', 'display.on.consent.screen'),
('8dee153c-4e64-435f-8a7c-cd9de0eb653d', 'true', 'include.in.token.scope'),
('8f9a1a9c-4bdf-41e2-a75b-544a12be1d67', '${offlineAccessScopeConsentText}', 'consent.screen.text'),
('8f9a1a9c-4bdf-41e2-a75b-544a12be1d67', 'true', 'display.on.consent.screen'),
('a72d436e-111b-445b-804a-967d249f6455', 'false', 'display.on.consent.screen'),
('a72d436e-111b-445b-804a-967d249f6455', 'true', 'include.in.token.scope'),
('a749b2db-a1ac-4e58-9fd3-1142e96b0445', 'false', 'display.on.consent.screen'),
('a749b2db-a1ac-4e58-9fd3-1142e96b0445', 'true', 'include.in.token.scope'),
('bd76f66d-85f6-44a6-ad5a-133b3f32016a', '${emailScopeConsentText}', 'consent.screen.text'),
('bd76f66d-85f6-44a6-ad5a-133b3f32016a', 'true', 'display.on.consent.screen'),
('bd76f66d-85f6-44a6-ad5a-133b3f32016a', 'true', 'include.in.token.scope'),
('d5de6a8a-8894-4e72-b6ef-f9bf3a7a6541', '${profileScopeConsentText}', 'consent.screen.text'),
('d5de6a8a-8894-4e72-b6ef-f9bf3a7a6541', 'true', 'display.on.consent.screen'),
('e3279721-a5de-46c7-b463-8d076a1631ae', '${rolesScopeConsentText}', 'consent.screen.text'),
('e3279721-a5de-46c7-b463-8d076a1631ae', 'true', 'display.on.consent.screen'),
('e3279721-a5de-46c7-b463-8d076a1631ae', 'false', 'include.in.token.scope');

-- --------------------------------------------------------

--
-- Estrutura da tabela `client_scope_client`
--

DROP TABLE IF EXISTS `client_scope_client`;
CREATE TABLE IF NOT EXISTS `client_scope_client` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  `DEFAULT_SCOPE` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`CLIENT_ID`,`SCOPE_ID`),
  KEY `IDX_CLSCOPE_CL` (`CLIENT_ID`),
  KEY `IDX_CL_CLSCOPE` (`SCOPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `client_scope_client`
--

INSERT INTO `client_scope_client` (`CLIENT_ID`, `SCOPE_ID`, `DEFAULT_SCOPE`) VALUES
('0aa176c1-8d28-4a8b-8e97-7e4b49a289ff', '021d9ac1-9650-401c-b2a2-efa2f3e6b70c', b'1'),
('0aa176c1-8d28-4a8b-8e97-7e4b49a289ff', '0d3b55db-e68b-4c83-91d4-7370a6810a24', b'0'),
('0aa176c1-8d28-4a8b-8e97-7e4b49a289ff', '1dc1e050-891a-4f5b-ac9d-5ea0c2e3c05e', b'0'),
('0aa176c1-8d28-4a8b-8e97-7e4b49a289ff', '391f1641-cb22-41a3-a0ed-752d9264aaf5', b'1'),
('0aa176c1-8d28-4a8b-8e97-7e4b49a289ff', '39e1693b-a924-4fbb-b98c-520869771f83', b'1'),
('0aa176c1-8d28-4a8b-8e97-7e4b49a289ff', '5253d2be-3116-4510-ac05-99619ce2494c', b'0'),
('0aa176c1-8d28-4a8b-8e97-7e4b49a289ff', '84fdcb72-668b-408e-aaea-110d594afe5e', b'1'),
('0aa176c1-8d28-4a8b-8e97-7e4b49a289ff', 'a72d436e-111b-445b-804a-967d249f6455', b'0'),
('0aa176c1-8d28-4a8b-8e97-7e4b49a289ff', 'd5de6a8a-8894-4e72-b6ef-f9bf3a7a6541', b'1'),
('1cdadc8e-1773-47bc-9c01-875f84ea25ec', '1c9c1b4c-ccb9-4e8f-82b7-5b3a4ac06229', b'1'),
('1cdadc8e-1773-47bc-9c01-875f84ea25ec', '386b2097-465b-4135-a057-62709870909e', b'0'),
('1cdadc8e-1773-47bc-9c01-875f84ea25ec', '38793860-edb1-452f-b2e0-e5ad2041cb70', b'1'),
('1cdadc8e-1773-47bc-9c01-875f84ea25ec', '55178e4f-7c18-4d0d-b010-f9e4079d5d48', b'1'),
('1cdadc8e-1773-47bc-9c01-875f84ea25ec', '8dee153c-4e64-435f-8a7c-cd9de0eb653d', b'0'),
('1cdadc8e-1773-47bc-9c01-875f84ea25ec', '8f9a1a9c-4bdf-41e2-a75b-544a12be1d67', b'0'),
('1cdadc8e-1773-47bc-9c01-875f84ea25ec', 'a749b2db-a1ac-4e58-9fd3-1142e96b0445', b'0'),
('1cdadc8e-1773-47bc-9c01-875f84ea25ec', 'bd76f66d-85f6-44a6-ad5a-133b3f32016a', b'1'),
('1cdadc8e-1773-47bc-9c01-875f84ea25ec', 'e3279721-a5de-46c7-b463-8d076a1631ae', b'1'),
('1eabef67-6473-4ba8-b07c-14bdbae4aaed', '021d9ac1-9650-401c-b2a2-efa2f3e6b70c', b'1'),
('1eabef67-6473-4ba8-b07c-14bdbae4aaed', '0d3b55db-e68b-4c83-91d4-7370a6810a24', b'0'),
('1eabef67-6473-4ba8-b07c-14bdbae4aaed', '1dc1e050-891a-4f5b-ac9d-5ea0c2e3c05e', b'0'),
('1eabef67-6473-4ba8-b07c-14bdbae4aaed', '3880d5d9-fced-4446-97fe-0434f2bb76ea', b'1'),
('1eabef67-6473-4ba8-b07c-14bdbae4aaed', '391f1641-cb22-41a3-a0ed-752d9264aaf5', b'1'),
('1eabef67-6473-4ba8-b07c-14bdbae4aaed', '39e1693b-a924-4fbb-b98c-520869771f83', b'1'),
('1eabef67-6473-4ba8-b07c-14bdbae4aaed', '5253d2be-3116-4510-ac05-99619ce2494c', b'0'),
('1eabef67-6473-4ba8-b07c-14bdbae4aaed', '84fdcb72-668b-408e-aaea-110d594afe5e', b'1'),
('1eabef67-6473-4ba8-b07c-14bdbae4aaed', 'a72d436e-111b-445b-804a-967d249f6455', b'0'),
('1eabef67-6473-4ba8-b07c-14bdbae4aaed', 'd5de6a8a-8894-4e72-b6ef-f9bf3a7a6541', b'1'),
('274afcdb-7742-4a3a-acc5-17db61a4d200', '021d9ac1-9650-401c-b2a2-efa2f3e6b70c', b'1'),
('274afcdb-7742-4a3a-acc5-17db61a4d200', '0d3b55db-e68b-4c83-91d4-7370a6810a24', b'0'),
('274afcdb-7742-4a3a-acc5-17db61a4d200', '1dc1e050-891a-4f5b-ac9d-5ea0c2e3c05e', b'0'),
('274afcdb-7742-4a3a-acc5-17db61a4d200', '391f1641-cb22-41a3-a0ed-752d9264aaf5', b'1'),
('274afcdb-7742-4a3a-acc5-17db61a4d200', '39e1693b-a924-4fbb-b98c-520869771f83', b'1'),
('274afcdb-7742-4a3a-acc5-17db61a4d200', '5253d2be-3116-4510-ac05-99619ce2494c', b'0'),
('274afcdb-7742-4a3a-acc5-17db61a4d200', '84fdcb72-668b-408e-aaea-110d594afe5e', b'1'),
('274afcdb-7742-4a3a-acc5-17db61a4d200', 'a72d436e-111b-445b-804a-967d249f6455', b'0'),
('274afcdb-7742-4a3a-acc5-17db61a4d200', 'd5de6a8a-8894-4e72-b6ef-f9bf3a7a6541', b'1'),
('3deba736-cf6f-44b8-8022-31f82347cc96', '1c9c1b4c-ccb9-4e8f-82b7-5b3a4ac06229', b'1'),
('3deba736-cf6f-44b8-8022-31f82347cc96', '386b2097-465b-4135-a057-62709870909e', b'0'),
('3deba736-cf6f-44b8-8022-31f82347cc96', '38793860-edb1-452f-b2e0-e5ad2041cb70', b'1'),
('3deba736-cf6f-44b8-8022-31f82347cc96', '55178e4f-7c18-4d0d-b010-f9e4079d5d48', b'1'),
('3deba736-cf6f-44b8-8022-31f82347cc96', '8dee153c-4e64-435f-8a7c-cd9de0eb653d', b'0'),
('3deba736-cf6f-44b8-8022-31f82347cc96', '8f9a1a9c-4bdf-41e2-a75b-544a12be1d67', b'0'),
('3deba736-cf6f-44b8-8022-31f82347cc96', 'a749b2db-a1ac-4e58-9fd3-1142e96b0445', b'0'),
('3deba736-cf6f-44b8-8022-31f82347cc96', 'bd76f66d-85f6-44a6-ad5a-133b3f32016a', b'1'),
('3deba736-cf6f-44b8-8022-31f82347cc96', 'e3279721-a5de-46c7-b463-8d076a1631ae', b'1'),
('48fb7988-d909-445a-81db-fe825dca0db2', '0d3b55db-e68b-4c83-91d4-7370a6810a24', b'0'),
('48fb7988-d909-445a-81db-fe825dca0db2', '1dc1e050-891a-4f5b-ac9d-5ea0c2e3c05e', b'0'),
('48fb7988-d909-445a-81db-fe825dca0db2', '391f1641-cb22-41a3-a0ed-752d9264aaf5', b'1'),
('48fb7988-d909-445a-81db-fe825dca0db2', '39e1693b-a924-4fbb-b98c-520869771f83', b'1'),
('48fb7988-d909-445a-81db-fe825dca0db2', '5253d2be-3116-4510-ac05-99619ce2494c', b'0'),
('48fb7988-d909-445a-81db-fe825dca0db2', 'a72d436e-111b-445b-804a-967d249f6455', b'0'),
('48fb7988-d909-445a-81db-fe825dca0db2', 'd5de6a8a-8894-4e72-b6ef-f9bf3a7a6541', b'1'),
('5a9610bf-6a47-46a1-9442-9e43eacd98e8', '021d9ac1-9650-401c-b2a2-efa2f3e6b70c', b'1'),
('5a9610bf-6a47-46a1-9442-9e43eacd98e8', '0d3b55db-e68b-4c83-91d4-7370a6810a24', b'0'),
('5a9610bf-6a47-46a1-9442-9e43eacd98e8', '1dc1e050-891a-4f5b-ac9d-5ea0c2e3c05e', b'0'),
('5a9610bf-6a47-46a1-9442-9e43eacd98e8', '391f1641-cb22-41a3-a0ed-752d9264aaf5', b'1'),
('5a9610bf-6a47-46a1-9442-9e43eacd98e8', '39e1693b-a924-4fbb-b98c-520869771f83', b'1'),
('5a9610bf-6a47-46a1-9442-9e43eacd98e8', '5253d2be-3116-4510-ac05-99619ce2494c', b'0'),
('5a9610bf-6a47-46a1-9442-9e43eacd98e8', '84fdcb72-668b-408e-aaea-110d594afe5e', b'1'),
('5a9610bf-6a47-46a1-9442-9e43eacd98e8', 'a72d436e-111b-445b-804a-967d249f6455', b'0'),
('5a9610bf-6a47-46a1-9442-9e43eacd98e8', 'd5de6a8a-8894-4e72-b6ef-f9bf3a7a6541', b'1'),
('7b6ab455-242e-42aa-96d8-9c9e2b74da9d', '021d9ac1-9650-401c-b2a2-efa2f3e6b70c', b'1'),
('7b6ab455-242e-42aa-96d8-9c9e2b74da9d', '0d3b55db-e68b-4c83-91d4-7370a6810a24', b'0'),
('7b6ab455-242e-42aa-96d8-9c9e2b74da9d', '1dc1e050-891a-4f5b-ac9d-5ea0c2e3c05e', b'0'),
('7b6ab455-242e-42aa-96d8-9c9e2b74da9d', '391f1641-cb22-41a3-a0ed-752d9264aaf5', b'1'),
('7b6ab455-242e-42aa-96d8-9c9e2b74da9d', '39e1693b-a924-4fbb-b98c-520869771f83', b'1'),
('7b6ab455-242e-42aa-96d8-9c9e2b74da9d', '5253d2be-3116-4510-ac05-99619ce2494c', b'0'),
('7b6ab455-242e-42aa-96d8-9c9e2b74da9d', '84fdcb72-668b-408e-aaea-110d594afe5e', b'1'),
('7b6ab455-242e-42aa-96d8-9c9e2b74da9d', 'a72d436e-111b-445b-804a-967d249f6455', b'0'),
('7b6ab455-242e-42aa-96d8-9c9e2b74da9d', 'd5de6a8a-8894-4e72-b6ef-f9bf3a7a6541', b'1'),
('98ae8603-4547-4218-8fb9-ebc550a0e10b', '021d9ac1-9650-401c-b2a2-efa2f3e6b70c', b'1'),
('98ae8603-4547-4218-8fb9-ebc550a0e10b', '0d3b55db-e68b-4c83-91d4-7370a6810a24', b'0'),
('98ae8603-4547-4218-8fb9-ebc550a0e10b', '1dc1e050-891a-4f5b-ac9d-5ea0c2e3c05e', b'0'),
('98ae8603-4547-4218-8fb9-ebc550a0e10b', '391f1641-cb22-41a3-a0ed-752d9264aaf5', b'1'),
('98ae8603-4547-4218-8fb9-ebc550a0e10b', '39e1693b-a924-4fbb-b98c-520869771f83', b'1'),
('98ae8603-4547-4218-8fb9-ebc550a0e10b', '5253d2be-3116-4510-ac05-99619ce2494c', b'0'),
('98ae8603-4547-4218-8fb9-ebc550a0e10b', '84fdcb72-668b-408e-aaea-110d594afe5e', b'1'),
('98ae8603-4547-4218-8fb9-ebc550a0e10b', 'a72d436e-111b-445b-804a-967d249f6455', b'0'),
('98ae8603-4547-4218-8fb9-ebc550a0e10b', 'd5de6a8a-8894-4e72-b6ef-f9bf3a7a6541', b'1'),
('a48b81bb-db56-42a4-bf31-336a6e335001', '1c9c1b4c-ccb9-4e8f-82b7-5b3a4ac06229', b'1'),
('a48b81bb-db56-42a4-bf31-336a6e335001', '386b2097-465b-4135-a057-62709870909e', b'0'),
('a48b81bb-db56-42a4-bf31-336a6e335001', '38793860-edb1-452f-b2e0-e5ad2041cb70', b'1'),
('a48b81bb-db56-42a4-bf31-336a6e335001', '55178e4f-7c18-4d0d-b010-f9e4079d5d48', b'1'),
('a48b81bb-db56-42a4-bf31-336a6e335001', '8dee153c-4e64-435f-8a7c-cd9de0eb653d', b'0'),
('a48b81bb-db56-42a4-bf31-336a6e335001', '8f9a1a9c-4bdf-41e2-a75b-544a12be1d67', b'0'),
('a48b81bb-db56-42a4-bf31-336a6e335001', 'a749b2db-a1ac-4e58-9fd3-1142e96b0445', b'0'),
('a48b81bb-db56-42a4-bf31-336a6e335001', 'bd76f66d-85f6-44a6-ad5a-133b3f32016a', b'1'),
('a48b81bb-db56-42a4-bf31-336a6e335001', 'e3279721-a5de-46c7-b463-8d076a1631ae', b'1'),
('ab9a50dd-ef39-46cf-add0-af8ce9a00e61', '1c9c1b4c-ccb9-4e8f-82b7-5b3a4ac06229', b'1'),
('ab9a50dd-ef39-46cf-add0-af8ce9a00e61', '386b2097-465b-4135-a057-62709870909e', b'0'),
('ab9a50dd-ef39-46cf-add0-af8ce9a00e61', '38793860-edb1-452f-b2e0-e5ad2041cb70', b'1'),
('ab9a50dd-ef39-46cf-add0-af8ce9a00e61', '55178e4f-7c18-4d0d-b010-f9e4079d5d48', b'1'),
('ab9a50dd-ef39-46cf-add0-af8ce9a00e61', '8dee153c-4e64-435f-8a7c-cd9de0eb653d', b'0'),
('ab9a50dd-ef39-46cf-add0-af8ce9a00e61', '8f9a1a9c-4bdf-41e2-a75b-544a12be1d67', b'0'),
('ab9a50dd-ef39-46cf-add0-af8ce9a00e61', 'a749b2db-a1ac-4e58-9fd3-1142e96b0445', b'0'),
('ab9a50dd-ef39-46cf-add0-af8ce9a00e61', 'bd76f66d-85f6-44a6-ad5a-133b3f32016a', b'1'),
('ab9a50dd-ef39-46cf-add0-af8ce9a00e61', 'e3279721-a5de-46c7-b463-8d076a1631ae', b'1'),
('bf8531b6-2a19-45e2-9a41-7a25d38ad69d', '1c9c1b4c-ccb9-4e8f-82b7-5b3a4ac06229', b'1'),
('bf8531b6-2a19-45e2-9a41-7a25d38ad69d', '386b2097-465b-4135-a057-62709870909e', b'0'),
('bf8531b6-2a19-45e2-9a41-7a25d38ad69d', '38793860-edb1-452f-b2e0-e5ad2041cb70', b'1'),
('bf8531b6-2a19-45e2-9a41-7a25d38ad69d', '55178e4f-7c18-4d0d-b010-f9e4079d5d48', b'1'),
('bf8531b6-2a19-45e2-9a41-7a25d38ad69d', '8dee153c-4e64-435f-8a7c-cd9de0eb653d', b'0'),
('bf8531b6-2a19-45e2-9a41-7a25d38ad69d', '8f9a1a9c-4bdf-41e2-a75b-544a12be1d67', b'0'),
('bf8531b6-2a19-45e2-9a41-7a25d38ad69d', 'a749b2db-a1ac-4e58-9fd3-1142e96b0445', b'0'),
('bf8531b6-2a19-45e2-9a41-7a25d38ad69d', 'bd76f66d-85f6-44a6-ad5a-133b3f32016a', b'1'),
('bf8531b6-2a19-45e2-9a41-7a25d38ad69d', 'e3279721-a5de-46c7-b463-8d076a1631ae', b'1'),
('e07da50b-cddc-4524-b630-436a5a6ba8ab', '021d9ac1-9650-401c-b2a2-efa2f3e6b70c', b'1'),
('e07da50b-cddc-4524-b630-436a5a6ba8ab', '0d3b55db-e68b-4c83-91d4-7370a6810a24', b'0'),
('e07da50b-cddc-4524-b630-436a5a6ba8ab', '1dc1e050-891a-4f5b-ac9d-5ea0c2e3c05e', b'0'),
('e07da50b-cddc-4524-b630-436a5a6ba8ab', '391f1641-cb22-41a3-a0ed-752d9264aaf5', b'1'),
('e07da50b-cddc-4524-b630-436a5a6ba8ab', '39e1693b-a924-4fbb-b98c-520869771f83', b'1'),
('e07da50b-cddc-4524-b630-436a5a6ba8ab', '5253d2be-3116-4510-ac05-99619ce2494c', b'0'),
('e07da50b-cddc-4524-b630-436a5a6ba8ab', '84fdcb72-668b-408e-aaea-110d594afe5e', b'1'),
('e07da50b-cddc-4524-b630-436a5a6ba8ab', 'a72d436e-111b-445b-804a-967d249f6455', b'0'),
('e07da50b-cddc-4524-b630-436a5a6ba8ab', 'd5de6a8a-8894-4e72-b6ef-f9bf3a7a6541', b'1'),
('f1cbf82e-a285-4a15-a172-ff97732a2648', '1c9c1b4c-ccb9-4e8f-82b7-5b3a4ac06229', b'1'),
('f1cbf82e-a285-4a15-a172-ff97732a2648', '386b2097-465b-4135-a057-62709870909e', b'0'),
('f1cbf82e-a285-4a15-a172-ff97732a2648', '38793860-edb1-452f-b2e0-e5ad2041cb70', b'1'),
('f1cbf82e-a285-4a15-a172-ff97732a2648', '55178e4f-7c18-4d0d-b010-f9e4079d5d48', b'1'),
('f1cbf82e-a285-4a15-a172-ff97732a2648', '8dee153c-4e64-435f-8a7c-cd9de0eb653d', b'0'),
('f1cbf82e-a285-4a15-a172-ff97732a2648', '8f9a1a9c-4bdf-41e2-a75b-544a12be1d67', b'0'),
('f1cbf82e-a285-4a15-a172-ff97732a2648', 'a749b2db-a1ac-4e58-9fd3-1142e96b0445', b'0'),
('f1cbf82e-a285-4a15-a172-ff97732a2648', 'bd76f66d-85f6-44a6-ad5a-133b3f32016a', b'1'),
('f1cbf82e-a285-4a15-a172-ff97732a2648', 'e3279721-a5de-46c7-b463-8d076a1631ae', b'1'),
('f7123f46-5de8-4c40-8cff-5c52b3e26a84', '1c9c1b4c-ccb9-4e8f-82b7-5b3a4ac06229', b'1'),
('f7123f46-5de8-4c40-8cff-5c52b3e26a84', '386b2097-465b-4135-a057-62709870909e', b'0'),
('f7123f46-5de8-4c40-8cff-5c52b3e26a84', '38793860-edb1-452f-b2e0-e5ad2041cb70', b'1'),
('f7123f46-5de8-4c40-8cff-5c52b3e26a84', '55178e4f-7c18-4d0d-b010-f9e4079d5d48', b'1'),
('f7123f46-5de8-4c40-8cff-5c52b3e26a84', '8dee153c-4e64-435f-8a7c-cd9de0eb653d', b'0'),
('f7123f46-5de8-4c40-8cff-5c52b3e26a84', '8f9a1a9c-4bdf-41e2-a75b-544a12be1d67', b'0'),
('f7123f46-5de8-4c40-8cff-5c52b3e26a84', 'a749b2db-a1ac-4e58-9fd3-1142e96b0445', b'0'),
('f7123f46-5de8-4c40-8cff-5c52b3e26a84', 'bd76f66d-85f6-44a6-ad5a-133b3f32016a', b'1'),
('f7123f46-5de8-4c40-8cff-5c52b3e26a84', 'e3279721-a5de-46c7-b463-8d076a1631ae', b'1');

-- --------------------------------------------------------

--
-- Estrutura da tabela `client_scope_role_mapping`
--

DROP TABLE IF EXISTS `client_scope_role_mapping`;
CREATE TABLE IF NOT EXISTS `client_scope_role_mapping` (
  `SCOPE_ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`ROLE_ID`),
  KEY `IDX_CLSCOPE_ROLE` (`SCOPE_ID`),
  KEY `IDX_ROLE_CLSCOPE` (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `client_scope_role_mapping`
--

INSERT INTO `client_scope_role_mapping` (`SCOPE_ID`, `ROLE_ID`) VALUES
('3880d5d9-fced-4446-97fe-0434f2bb76ea', '62880c1c-3e64-48fa-902f-fa8354347ab8'),
('5253d2be-3116-4510-ac05-99619ce2494c', '932ca70d-a311-42f9-9042-431cef835b9e'),
('8f9a1a9c-4bdf-41e2-a75b-544a12be1d67', 'a91bfa14-c447-4159-9de1-64a51fbf2227');

-- --------------------------------------------------------

--
-- Estrutura da tabela `client_session`
--

DROP TABLE IF EXISTS `client_session`;
CREATE TABLE IF NOT EXISTS `client_session` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(36) DEFAULT NULL,
  `REDIRECT_URI` varchar(255) DEFAULT NULL,
  `STATE` varchar(255) DEFAULT NULL,
  `TIMESTAMP` int DEFAULT NULL,
  `SESSION_ID` varchar(36) DEFAULT NULL,
  `AUTH_METHOD` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `AUTH_USER_ID` varchar(36) DEFAULT NULL,
  `CURRENT_ACTION` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_CLIENT_SESSION_SESSION` (`SESSION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `client_session_auth_status`
--

DROP TABLE IF EXISTS `client_session_auth_status`;
CREATE TABLE IF NOT EXISTS `client_session_auth_status` (
  `AUTHENTICATOR` varchar(36) NOT NULL,
  `STATUS` int DEFAULT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`AUTHENTICATOR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `client_session_note`
--

DROP TABLE IF EXISTS `client_session_note`;
CREATE TABLE IF NOT EXISTS `client_session_note` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `client_session_prot_mapper`
--

DROP TABLE IF EXISTS `client_session_prot_mapper`;
CREATE TABLE IF NOT EXISTS `client_session_prot_mapper` (
  `PROTOCOL_MAPPER_ID` varchar(36) NOT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`PROTOCOL_MAPPER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `client_session_role`
--

DROP TABLE IF EXISTS `client_session_role`;
CREATE TABLE IF NOT EXISTS `client_session_role` (
  `ROLE_ID` varchar(255) NOT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `client_user_session_note`
--

DROP TABLE IF EXISTS `client_user_session_note`;
CREATE TABLE IF NOT EXISTS `client_user_session_note` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` text,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `component`
--

DROP TABLE IF EXISTS `component`;
CREATE TABLE IF NOT EXISTS `component` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `PARENT_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_TYPE` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `SUB_TYPE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_COMPONENT_REALM` (`REALM_ID`),
  KEY `IDX_COMPONENT_PROVIDER_TYPE` (`PROVIDER_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `component`
--

INSERT INTO `component` (`ID`, `NAME`, `PARENT_ID`, `PROVIDER_ID`, `PROVIDER_TYPE`, `REALM_ID`, `SUB_TYPE`) VALUES
('10b808c5-dd59-4f4b-a45b-8591deaa4f17', 'Max Clients Limit', 'master', 'max-clients', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'anonymous'),
('1175c6f8-2d58-437f-bb21-4660c8c1a62c', 'Full Scope Disabled', 'cibmtr-bioinformatics-realm', 'scope', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'cibmtr-bioinformatics-realm', 'anonymous'),
('1d291cea-3d41-41cb-9ab6-ef1513fe3fe8', 'hmac-generated', 'cibmtr-bioinformatics-realm', 'hmac-generated', 'org.keycloak.keys.KeyProvider', 'cibmtr-bioinformatics-realm', NULL),
('280c7b8a-d954-47ec-b29d-44330785410d', 'Full Scope Disabled', 'master', 'scope', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'anonymous'),
('2a3661d8-3594-4872-881a-9f2d394b675d', 'rsa-generated', 'cibmtr-bioinformatics-realm', 'rsa-generated', 'org.keycloak.keys.KeyProvider', 'cibmtr-bioinformatics-realm', NULL),
('3ac8184d-24a7-4abb-988e-b075015c9826', 'fallback-ES256', 'cibmtr-bioinformatics-realm', 'ecdsa-generated', 'org.keycloak.keys.KeyProvider', 'cibmtr-bioinformatics-realm', NULL),
('41441c32-3b55-4685-8bde-b331f699d74b', 'hmac-generated', 'master', 'hmac-generated', 'org.keycloak.keys.KeyProvider', 'master', NULL),
('4bd2778a-908f-4ac3-873f-61e674eecc2f', 'Consent Required', 'cibmtr-bioinformatics-realm', 'consent-required', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'cibmtr-bioinformatics-realm', 'anonymous'),
('4d25f10d-e980-4e13-b9d0-b5afe7a44e33', 'Allowed Client Scopes', 'master', 'allowed-client-templates', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'authenticated'),
('5782d02c-2ba5-47d1-9732-dfaaf0e5cfdf', 'Allowed Protocol Mapper Types', 'cibmtr-bioinformatics-realm', 'allowed-protocol-mappers', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'cibmtr-bioinformatics-realm', 'authenticated'),
('65809493-b60f-4b44-b1dc-28a22772c321', 'Allowed Client Scopes', 'cibmtr-bioinformatics-realm', 'allowed-client-templates', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'cibmtr-bioinformatics-realm', 'anonymous'),
('7821abd7-f4e0-424e-9964-fd847592b290', 'Trusted Hosts', 'master', 'trusted-hosts', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'anonymous'),
('7c57905e-d208-49cf-ac53-088e60607811', 'Allowed Protocol Mapper Types', 'master', 'allowed-protocol-mappers', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'anonymous'),
('8ab3be1d-3e01-4eb6-8ff2-d116b02ffc48', 'aes-generated', 'cibmtr-bioinformatics-realm', 'aes-generated', 'org.keycloak.keys.KeyProvider', 'cibmtr-bioinformatics-realm', NULL),
('950acf43-614d-47a3-a7c9-d5072433c4b8', 'Max Clients Limit', 'cibmtr-bioinformatics-realm', 'max-clients', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'cibmtr-bioinformatics-realm', 'anonymous'),
('96bb5289-e057-4a3d-a273-89372bbc8cc0', 'Allowed Client Scopes', 'cibmtr-bioinformatics-realm', 'allowed-client-templates', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'cibmtr-bioinformatics-realm', 'authenticated'),
('9c298b30-b0af-4e8e-8f7a-a29decd984e5', 'Allowed Protocol Mapper Types', 'master', 'allowed-protocol-mappers', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'authenticated'),
('a465cc7b-3b76-40fe-940e-4724872fe9ba', 'Allowed Client Scopes', 'master', 'allowed-client-templates', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'anonymous'),
('c8d395e2-dd81-4118-b838-7095be5cc1c8', 'Allowed Protocol Mapper Types', 'cibmtr-bioinformatics-realm', 'allowed-protocol-mappers', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'cibmtr-bioinformatics-realm', 'anonymous'),
('d386fa7e-48fd-4cef-bf92-0cc7bfa90751', 'Consent Required', 'master', 'consent-required', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'anonymous'),
('d471fa1e-c844-4b58-8220-e511b8aa748a', 'rsa-generated', 'master', 'rsa-generated', 'org.keycloak.keys.KeyProvider', 'master', NULL),
('d6558e3e-8262-46d7-a344-df82c6f1bbd8', 'aes-generated', 'master', 'aes-generated', 'org.keycloak.keys.KeyProvider', 'master', NULL),
('e2a65f9f-5ad8-4634-ab3a-810409a3e067', 'Trusted Hosts', 'cibmtr-bioinformatics-realm', 'trusted-hosts', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'cibmtr-bioinformatics-realm', 'anonymous');

-- --------------------------------------------------------

--
-- Estrutura da tabela `component_config`
--

DROP TABLE IF EXISTS `component_config`;
CREATE TABLE IF NOT EXISTS `component_config` (
  `ID` varchar(36) NOT NULL,
  `COMPONENT_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_COMPO_CONFIG_COMPO` (`COMPONENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `component_config`
--

INSERT INTO `component_config` (`ID`, `COMPONENT_ID`, `NAME`, `VALUE`) VALUES
('00934a7b-f490-4901-824a-2e6eddbad8df', '96bb5289-e057-4a3d-a273-89372bbc8cc0', 'allow-default-scopes', 'true'),
('043fe56c-188e-4c2d-8c2f-ac1124505b96', '950acf43-614d-47a3-a7c9-d5072433c4b8', 'max-clients', '200'),
('06834866-1d25-418e-8f97-acf5ccb755f3', 'd471fa1e-c844-4b58-8220-e511b8aa748a', 'priority', '100'),
('0e9cbc0e-218c-4fea-9a61-d795a72b8457', '4d25f10d-e980-4e13-b9d0-b5afe7a44e33', 'allow-default-scopes', 'true'),
('0f3f2c8a-3c37-420a-838e-332b55493da8', '5782d02c-2ba5-47d1-9732-dfaaf0e5cfdf', 'allowed-protocol-mapper-types', 'oidc-usermodel-property-mapper'),
('16ab7ffd-559d-4725-9453-f5bb2c7e6ff6', '7821abd7-f4e0-424e-9964-fd847592b290', 'host-sending-registration-request-must-match', 'true'),
('18166645-7b0c-4975-9604-11a9b349cfdf', '7c57905e-d208-49cf-ac53-088e60607811', 'allowed-protocol-mapper-types', 'saml-role-list-mapper'),
('1eda3c77-6b8c-471a-8d77-6463eb1e5a32', 'd6558e3e-8262-46d7-a344-df82c6f1bbd8', 'kid', '7c5a0d5a-7f72-4e79-bdd0-1e9a38b7f1ff'),
('1fe03c89-7f0e-47aa-9523-15bee76ad6fe', '9c298b30-b0af-4e8e-8f7a-a29decd984e5', 'allowed-protocol-mapper-types', 'oidc-address-mapper'),
('22a5d182-b63e-4899-971b-6d0a028b3e87', 'c8d395e2-dd81-4118-b838-7095be5cc1c8', 'allowed-protocol-mapper-types', 'saml-user-property-mapper'),
('25ab8a4b-49ca-4f90-9445-557d3b9a9b48', '7c57905e-d208-49cf-ac53-088e60607811', 'allowed-protocol-mapper-types', 'oidc-sha256-pairwise-sub-mapper'),
('270df5da-887b-42bc-8c75-12f34d198001', 'c8d395e2-dd81-4118-b838-7095be5cc1c8', 'allowed-protocol-mapper-types', 'oidc-usermodel-attribute-mapper'),
('27edbb05-8183-43ca-ae83-34f3e6746b04', 'a465cc7b-3b76-40fe-940e-4724872fe9ba', 'allow-default-scopes', 'true'),
('295e97ba-180b-4eea-8165-1057273c9ba0', 'd471fa1e-c844-4b58-8220-e511b8aa748a', 'privateKey', 'MIIEpAIBAAKCAQEAnZSctIOJ1gHbJqnnZQ+85vG8smI9pHVT0SF3duIgyI8KRluQA8adbcQVL3nPEa/n9+91xP75y6zdnLdBpQIGlb/VLPQTHmkYuqAphcGwc3Lda+Q7nmfm3b422nnCLyLMPGkcpc5AiYiGvTtwgyoIUgqG9Bt8X/1PWbYAwiKSI68P4K/taJAowbVDRM4g7FjfpOXvn9EHWe9TMc5MGObVo1FRKIVV8ZNhTXwwCA2nq740cC+APUpUfVgRd4sEJDUcovyI9X168MrtJyKgJWVferU6vsjUWviG6mnQ2EsjRhkrjXNybnl3iE0J+5kTdAHSf0SNxsKSGNBmiao8+0mv/wIDAQABAoIBADAVjxPOJ5s0Cclsgv1lpgDatve/3ot2edMQ4UFXkyVf8ISzn+hnDNbXxJcuFi+Re7k+SrOIEnVCFIWjrdZKHfRICyaie8sFytP313PHPK6d2E753+9gSSRUzKwyBz0W4zdz45f8rdjJ3kOUBasgglV2fOO0F2m7BCGd1fFnVyyn3OevQqN76TK7lmZXWJXb2f7+1EIHdovtz1SJN7D/RrfzMNlx0DFauqIAofZlSCHZ5zvyXuAJ0cC0t9ioIQTiGOOWVGwRY7a1MCPuqBoo395NcEPNBV9W2RVhjyAZG/VsvNW9m7ZGWcXqZXPDNPnR5JumTY1PxKHeGsGrP1OTuBECgYEA5zH9VG8PAijou9o+BwthmKkY8hlHSGo9qFzdw7o1ja3LuW4yiHUBhF5DmGYMveb1nIWkvYHn9FEFFQOL05DbpXmChArnb1rpTKOcZPY1Fgf7Zvmvh1TWbbd0gt1t/NJrdv7OpDTQEF89HKMjuaFfCVC1e77yl2SdW+4g6JXwvlsCgYEArny4JjBWkKJqWrCDKPF5VxOm2iG+jnp7HiQsKHxNYi+dfshleLooYXGmYGUa0PH/Ss2dv0vGGa680e9tVgt2X6m0Sl76TsPtxwF0AHENL3jakM2owznzMGrqzRNPsgEsywe2bVi+EEmZ1KMU2GoQW/4oitqbZHJ32madq8RRzi0CgYEAwjisqRHjed0EJ0vgb+qPwr/LxRaXW65kvdvGMXdtJeirDMwWh6xD6f+GqbCRY7dy/lsHWmyXgBfQPScNgF5hJ1I84tCGPHYTJ98Ks4Zicm+iM4/udbI/sUw9BPMgQxRCU2UcE7aKVDauEDC9AmUegaTb0WlIQwaza1dRLhNIe6ECgYAfvG+CAqi8Bc5yUEiK2eDIBbsDUb/nCj/6a3ncoz8v7Jkoxioumy1dC97HCZynBFz6rgtTD+UoJrARPwsT62HMZIF2RXAhg2FsIMeIjQdo6wJV9BIN8CxbUhcC1dBY//21r+FuYgWv0LM6Ca9w7VmsYb3eA4Tf8DH8d02WQE7gwQKBgQCSCVyLah6zTZW/nlAe+88i5TvQ4125AaYKTrQ+yS1XPuFRNNLStseOYo+Wsj9/zX59NLkjAYZnA2KktYWcMzWis/pgqdk4FdW3sCHcxhmtHm9DXuA0MZ6fXdQTs3AjVcbZFo1HGaC1Q/4XilIwzdHa/RZBbFnMlkFZ/8N3k+Llgg=='),
('2e66e5ae-5843-462c-b493-3bec30f80059', '1d291cea-3d41-41cb-9ab6-ef1513fe3fe8', 'secret', 'r2X9QG4kCwPcI4FYZiCjM3rRjMIfTibUUCP_Wdr1eTRoR7mNy2vQsKxi6F0rg76VVw0Ga3iLbyq2RJ_8kqfHEA'),
('3299e005-91c1-4c89-85ae-9d03df4aee5d', '9c298b30-b0af-4e8e-8f7a-a29decd984e5', 'allowed-protocol-mapper-types', 'saml-user-property-mapper'),
('338f7664-ba3e-453e-85f2-c519e40323fa', '5782d02c-2ba5-47d1-9732-dfaaf0e5cfdf', 'allowed-protocol-mapper-types', 'saml-user-attribute-mapper'),
('35f22889-d93c-4714-962a-898f89909304', '5782d02c-2ba5-47d1-9732-dfaaf0e5cfdf', 'allowed-protocol-mapper-types', 'oidc-full-name-mapper'),
('37778c22-b5e1-4314-8bd9-3f9e31e8baf6', 'c8d395e2-dd81-4118-b838-7095be5cc1c8', 'allowed-protocol-mapper-types', 'oidc-address-mapper'),
('388aee91-d5e2-4cd3-94b6-116a3a65ccf2', 'd6558e3e-8262-46d7-a344-df82c6f1bbd8', 'secret', 'BAptjMCDGj4amt5LrGDyMQ'),
('3b823056-14f2-4dfc-b32f-b7a3cbac4f76', '7c57905e-d208-49cf-ac53-088e60607811', 'allowed-protocol-mapper-types', 'saml-user-attribute-mapper'),
('4026bef3-5bac-48af-84f6-293eb89822e3', '65809493-b60f-4b44-b1dc-28a22772c321', 'allow-default-scopes', 'true'),
('40e35be9-478e-4112-9168-78f17c3d1ba4', 'c8d395e2-dd81-4118-b838-7095be5cc1c8', 'allowed-protocol-mapper-types', 'saml-role-list-mapper'),
('49f459b6-6118-4229-99f6-c997a95664ce', '5782d02c-2ba5-47d1-9732-dfaaf0e5cfdf', 'allowed-protocol-mapper-types', 'saml-user-property-mapper'),
('50431eb8-2d68-4600-8fb8-f2f798f16400', '7c57905e-d208-49cf-ac53-088e60607811', 'allowed-protocol-mapper-types', 'oidc-usermodel-attribute-mapper'),
('53407c10-4d4b-45de-b1bb-f3b7bf5b8ba6', '5782d02c-2ba5-47d1-9732-dfaaf0e5cfdf', 'allowed-protocol-mapper-types', 'oidc-sha256-pairwise-sub-mapper'),
('552ddf7d-3acb-40f3-8112-efcb01ff147e', '7c57905e-d208-49cf-ac53-088e60607811', 'allowed-protocol-mapper-types', 'saml-user-property-mapper'),
('58709cca-2433-4ebb-b6a2-8b37ad687cef', '3ac8184d-24a7-4abb-988e-b075015c9826', 'priority', '-100'),
('73cfb901-0aaa-4178-98a6-4aadc0fbfae7', '5782d02c-2ba5-47d1-9732-dfaaf0e5cfdf', 'allowed-protocol-mapper-types', 'oidc-address-mapper'),
('749750cf-4f59-4f76-9b29-315c03e5fb44', 'c8d395e2-dd81-4118-b838-7095be5cc1c8', 'allowed-protocol-mapper-types', 'saml-user-attribute-mapper'),
('7bb8df9e-19e9-4329-9114-c661d971aad5', '41441c32-3b55-4685-8bde-b331f699d74b', 'priority', '100'),
('7bf10eee-321f-4bf8-ad61-50ceb1fe3953', '41441c32-3b55-4685-8bde-b331f699d74b', 'secret', 'KEICM7xU-JmzxfTDs_FvuFTDrIYJfousOQQhHj2UmChQGnkhwln9Uh91i_4Tpf6ovFbQID6iGwjcUiSHzeijxQ'),
('82cf1387-c7f2-4581-901c-09facf50ccce', '2a3661d8-3594-4872-881a-9f2d394b675d', 'certificate', 'MIICnzCCAYcCBgFw/2G5qjANBgkqhkiG9w0BAQsFADATMREwDwYDVQQDDAhqaGlwc3RlcjAeFw0yMDAzMjEyMzE0MTlaFw0zMDAzMjEyMzE1NTlaMBMxETAPBgNVBAMMCGpoaXBzdGVyMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAugeXBRxbZrcE1Mz0c/WxRtc3sG623ooKCvb0RI+Z+XLX6cOhBQhIzJUTs390XxmDqYk6mxc0G9K9BzeAUjiMViKnqZI7DYWvGs252FMcSHtgy8j9GsBPtPbz6eHGecDEuS6xeTQyPBGdYAUywEuXnBHK2ON7zUYJBH5EhmjpqsxqF92g+nr8bHa77Uv1poinSakHGu/dd+tLsR/w0V++HW8gsYhcxcNV19a4tJpRnRu2JajIv+W4QgcOnwBbu5ekEmIJp4FOpt4/0wgLEYp+miv3hwqTK1tUdTN8Ll+4L+pYQZPPnvRFWAKcEdOUVY4R1HYoaJDkT3npfCN6H9mMRwIDAQABMA0GCSqGSIb3DQEBCwUAA4IBAQBX5RiWVoKBUxNuyqnD2o+u1qUSW7O50yrRShlBK7qpvj+q6yN7DIMUYc/yxpYKSEdK+W5QoH2VIdshOAXJC2UP2s6Q48qQxV5Nhr9z4LVcBN9QPcCafVtZXfhU8yyZ1rZsJAtsaF0CrA3vwJ/gmEdv9O4ZC9FzCyKQwxwtw9Eac2TOj6X8ZOaHI5PSEXLZxzJOP5ICq0HOqah9RWpPw+a3Y+Yv7ITL18KJAsLSrm0IkVrHsLMp7sVkeNow30qHs9Eo8GNXVAm8MhmqGgwlo3siCVUGk2gsty5d9cIx7uFAQ8WnBkVMgb5NzZsqtGUmGNkwkdjTcTEOjID49xdhZdTW'),
('8564d1ea-91c6-4638-8176-6a15096a9eb9', '3ac8184d-24a7-4abb-988e-b075015c9826', 'ecdsaPublicKey', 'MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAEZrelamB2+MWrwDt8gXsYp+/7V2/IHPblBe2OktILXcOFvC9it6VM5SHT+IKGqPzbRz90lQMD8DONZjtG3vBR5Q=='),
('87ae009e-9d92-48f9-8861-cca5e902442d', 'c8d395e2-dd81-4118-b838-7095be5cc1c8', 'allowed-protocol-mapper-types', 'oidc-sha256-pairwise-sub-mapper'),
('8bbb6abf-ad4c-4c2c-bed9-161017171297', '9c298b30-b0af-4e8e-8f7a-a29decd984e5', 'allowed-protocol-mapper-types', 'oidc-sha256-pairwise-sub-mapper'),
('8e111c44-4bbe-4308-9bbd-ea2ef8cc68d5', '41441c32-3b55-4685-8bde-b331f699d74b', 'kid', '35b948f2-3f6e-4016-a50e-77930af5fc73'),
('922d4e40-15d4-470d-af46-d8997ff779b5', '7c57905e-d208-49cf-ac53-088e60607811', 'allowed-protocol-mapper-types', 'oidc-address-mapper'),
('942db24d-2e29-4922-b13b-8e14961ef5dd', '7821abd7-f4e0-424e-9964-fd847592b290', 'client-uris-must-match', 'true'),
('94bf3fb9-8575-47b9-b84b-0ff5c52e3439', '5782d02c-2ba5-47d1-9732-dfaaf0e5cfdf', 'allowed-protocol-mapper-types', 'saml-role-list-mapper'),
('9b814224-b261-4892-8690-3f588950ff5b', '8ab3be1d-3e01-4eb6-8ff2-d116b02ffc48', 'secret', 'R7fZxuI65r5vQEQvR9_98A'),
('9c1ee22d-7ae7-4b7a-b0bf-a87268decd49', 'c8d395e2-dd81-4118-b838-7095be5cc1c8', 'allowed-protocol-mapper-types', 'oidc-usermodel-property-mapper'),
('a3d9d971-f626-44e1-ae9e-50c1e63c9c80', '9c298b30-b0af-4e8e-8f7a-a29decd984e5', 'allowed-protocol-mapper-types', 'oidc-full-name-mapper'),
('a5f090fd-c24d-47e4-85c7-01f31acf9ef1', '9c298b30-b0af-4e8e-8f7a-a29decd984e5', 'allowed-protocol-mapper-types', 'saml-user-attribute-mapper'),
('a64ac3ee-4a86-46ea-8eda-29a5e0271440', '5782d02c-2ba5-47d1-9732-dfaaf0e5cfdf', 'allowed-protocol-mapper-types', 'oidc-usermodel-attribute-mapper'),
('a8adff24-497b-49b8-8b80-f9d9be22a051', '8ab3be1d-3e01-4eb6-8ff2-d116b02ffc48', 'priority', '100'),
('a91ac465-39b7-4af5-a054-055fe267ad3c', '7c57905e-d208-49cf-ac53-088e60607811', 'allowed-protocol-mapper-types', 'oidc-full-name-mapper'),
('b150fb23-b26b-40b9-9e9e-69b84f4d4fad', '2a3661d8-3594-4872-881a-9f2d394b675d', 'privateKey', 'MIIEowIBAAKCAQEAugeXBRxbZrcE1Mz0c/WxRtc3sG623ooKCvb0RI+Z+XLX6cOhBQhIzJUTs390XxmDqYk6mxc0G9K9BzeAUjiMViKnqZI7DYWvGs252FMcSHtgy8j9GsBPtPbz6eHGecDEuS6xeTQyPBGdYAUywEuXnBHK2ON7zUYJBH5EhmjpqsxqF92g+nr8bHa77Uv1poinSakHGu/dd+tLsR/w0V++HW8gsYhcxcNV19a4tJpRnRu2JajIv+W4QgcOnwBbu5ekEmIJp4FOpt4/0wgLEYp+miv3hwqTK1tUdTN8Ll+4L+pYQZPPnvRFWAKcEdOUVY4R1HYoaJDkT3npfCN6H9mMRwIDAQABAoIBAQCb+9E9j9F0BvIeHNy8fr7uz3b6kVr0rnpNR1T6SA6rgwhYEpjpR1EDedzTHYPOWe50MYTallIzIjkt2/PU/WVutBAxt1OcuwNgTjAOm2GTxSAcv6K605YB/y/2ZEGvxVsui2B0aLfWdk6nPLSZWMj/LEwSIGymapsVEWsT6NRFSUOG/vWdNe0OuMno5viq+MnZCHRSnlHg4UyeWC6VejM23sI1Z4GqLxUfqNgp9mTWnYA7C+Oa8xiuxT5O/zI6wcMvb+Wn1q/ujyrQI1M+G+B/2r4nj83m+1YuHh2+5WJui4LDhXJi88/JVWvsHFf4FTCy+NgMdI2p8fKYn6Igr7YBAoGBAN3rXExBEt7ciuuHLkDYKcfmnSg5luQXAdX6cn+NpYFrCu6i5CS9CHQgh/Y2NqKjtf2TyhD9uKOwVxIHYYwtcn/tGGFfsyLY2OvFjusONgH1rxFh4g89Tx7S9NpnN5sRofu0EwRbWT35Dnou/FWm782HM5MZ1drICACIDGOI1zKhAoGBANaZPoYMf/T98u3x+2ldZtzrLcwxuWeyvVhY7IQFjzA072PKsTrlW7zJ1vp1YIVu7roO2cRvcfk+B0i2fZk1Rwc4Ky9YG+C4hVcvu1+WSQ1EBVmE1kZUfn04dJ3XZC9cmxelpwEdoxDsz+Hs8H6Aym1CceaQ+SeTJjIZryHrCr3nAoGAUUnTR0NW7DeQ03Fy6eHEfCrnSkK+GNKso3rX0g1KoLtbB8q3ExYDMLZx1yhInw6krTwjelHV/m+rlTkK7FQBawaoNZLehVc1Ljfxf/x2oAUkmZNnQPnOL5ZKhm3kmnK9CPwPMzta1y6RtQPc/mrl0D1EERAXm8pF1BwBnbwUR8ECgYBIXZzr70MnBovpGXTCbzDExrnG5e2zvl6DcFkxm/5RL0iayjtBtR5eZ2ILS5Gk7Werbl6ZE0vH1Nb3+jIYfBLbqGFHsdqUySSN5ha1gSRZSNrU+SqYxN1ytJr+ryeloQDb1Iygn7HhfzoK4a+nuR6KAaIPMkwSwFhdBLQ+J9iTeQKBgF3Wge+HgsVWIet+xPESjuVG+MIM0XmUoUY0g9HiBcH7AvNqrH0lzt/cK7I1beql/o9eHsnRHecaBGMa3Q9fjfvDFlg6HQAAj5s/Uz4wy2Un83JMoB0v6FLpTNosT8P0ZtLxTZB2kF05T392lgwDm2alKeo4UKsMd9g2J3YKtuM5'),
('bbcda9b8-e25b-41b3-983d-2a56747a280b', '7c57905e-d208-49cf-ac53-088e60607811', 'allowed-protocol-mapper-types', 'oidc-usermodel-property-mapper'),
('bc231638-67c2-4bb1-bdab-aa8e348d9b49', 'd6558e3e-8262-46d7-a344-df82c6f1bbd8', 'priority', '100'),
('be86039a-c2c9-4055-beb9-bfb33b47957c', '2a3661d8-3594-4872-881a-9f2d394b675d', 'priority', '100'),
('c388739f-1205-4681-ba7c-89c6b08576af', '3ac8184d-24a7-4abb-988e-b075015c9826', 'ecdsaPrivateKey', 'MEECAQAwEwYHKoZIzj0CAQYIKoZIzj0DAQcEJzAlAgEBBCAfN0seE3XOtAlONsoH2vxsRKVCgwEh7Vjac56Kz0EAhA=='),
('ca06d5dc-cace-432a-9ac7-dca6ba302091', '3ac8184d-24a7-4abb-988e-b075015c9826', 'ecdsaEllipticCurveKey', 'P-256'),
('cab6dff8-5a7e-41b4-9d70-57639c3b5f0b', '10b808c5-dd59-4f4b-a45b-8591deaa4f17', 'max-clients', '200'),
('dabc7737-a4e1-4215-8962-056d80fdf49b', 'c8d395e2-dd81-4118-b838-7095be5cc1c8', 'allowed-protocol-mapper-types', 'oidc-full-name-mapper'),
('dbb8d809-fb31-45a0-87cb-5eb85dc7edf9', 'e2a65f9f-5ad8-4634-ab3a-810409a3e067', 'host-sending-registration-request-must-match', 'true'),
('dd4968ae-96cb-49b8-8ba1-cd3dab134ada', '1d291cea-3d41-41cb-9ab6-ef1513fe3fe8', 'kid', '6c8dacf3-d9dd-4272-8a6a-b3951f2d2c89'),
('e2cb926e-1ba7-4421-b11f-7700c000a2d3', '1d291cea-3d41-41cb-9ab6-ef1513fe3fe8', 'priority', '100'),
('e55d6964-bda7-4801-a710-234f0151b08f', 'e2a65f9f-5ad8-4634-ab3a-810409a3e067', 'client-uris-must-match', 'true'),
('e641e3ae-bfd5-41b8-b199-aa766fb081a7', '9c298b30-b0af-4e8e-8f7a-a29decd984e5', 'allowed-protocol-mapper-types', 'oidc-usermodel-property-mapper'),
('efcd3c6b-7bec-4a2c-aa34-547c72d1fcc2', '9c298b30-b0af-4e8e-8f7a-a29decd984e5', 'allowed-protocol-mapper-types', 'oidc-usermodel-attribute-mapper'),
('f549df25-9c1f-4390-ad3d-70f91161fe69', '8ab3be1d-3e01-4eb6-8ff2-d116b02ffc48', 'kid', '60154949-aa70-4ff8-9e14-49bbdcc232de'),
('f9da3b8a-0b8f-4db8-8155-e8011482f575', '41441c32-3b55-4685-8bde-b331f699d74b', 'algorithm', 'HS256'),
('fafd16cd-d6e0-4215-8480-0d06b4fe353c', 'd471fa1e-c844-4b58-8220-e511b8aa748a', 'certificate', 'MIICmzCCAYMCBgFw/2GvmzANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjAwMzIxMjMxNDE2WhcNMzAwMzIxMjMxNTU2WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCdlJy0g4nWAdsmqedlD7zm8byyYj2kdVPRIXd24iDIjwpGW5ADxp1txBUvec8Rr+f373XE/vnLrN2ct0GlAgaVv9Us9BMeaRi6oCmFwbBzct1r5DueZ+bdvjbaecIvIsw8aRylzkCJiIa9O3CDKghSCob0G3xf/U9ZtgDCIpIjrw/gr+1okCjBtUNEziDsWN+k5e+f0QdZ71MxzkwY5tWjUVEohVXxk2FNfDAIDaervjRwL4A9SlR9WBF3iwQkNRyi/Ij1fXrwyu0nIqAlZV96tTq+yNRa+IbqadDYSyNGGSuNc3JueXeITQn7mRN0AdJ/RI3GwpIY0GaJqjz7Sa//AgMBAAEwDQYJKoZIhvcNAQELBQADggEBADL7nPWkR2QTOF3oJVbg7i6J6bpUpniDhlPdB22fP0d3brX0+5SyDEFN7hVxDUWY9SKU1D+w3DF8HHfglq3dYnD/H5vf8780lsoId/P0tzQBciOPLi8V5RJEUD+rWJQw00GjScgGDx/7rsmZXEk73Ua2kvZp06WZTjwCyYqwaXmwxpLUfRb0TZS2zt+NVr0d/TT8vNnzy5sFcd9Y+mqnHGghRURxBpLLgt3kLYWkkIO5dBU/bhQDFwt2PK3bNxJ6Uk8o1YAYQ+DzkN0fQC+wgu3ISS9du8O6n+C3/Zkc9dGuGT6SSVCk9yK0hm4mfuU4nrVSdhQEvB9Fhqcd5/0a8co='),
('ff274641-0250-469d-a6d7-4c4d40c9034d', '9c298b30-b0af-4e8e-8f7a-a29decd984e5', 'allowed-protocol-mapper-types', 'saml-role-list-mapper');

-- --------------------------------------------------------

--
-- Estrutura da tabela `composite_role`
--

DROP TABLE IF EXISTS `composite_role`;
CREATE TABLE IF NOT EXISTS `composite_role` (
  `COMPOSITE` varchar(36) NOT NULL,
  `CHILD_ROLE` varchar(36) NOT NULL,
  PRIMARY KEY (`COMPOSITE`,`CHILD_ROLE`),
  KEY `IDX_COMPOSITE` (`COMPOSITE`),
  KEY `IDX_COMPOSITE_CHILD` (`CHILD_ROLE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `composite_role`
--

INSERT INTO `composite_role` (`COMPOSITE`, `CHILD_ROLE`) VALUES
('083a848a-49cb-457f-9615-120be8c74d9e', '11bc32e5-55a6-431d-b6c7-32bd9504d070'),
('083a848a-49cb-457f-9615-120be8c74d9e', '24493c26-5ea3-4e53-b949-ca27a06ff098'),
('083a848a-49cb-457f-9615-120be8c74d9e', '24ba1589-1141-4836-91bb-ad1b10db4944'),
('083a848a-49cb-457f-9615-120be8c74d9e', '2a54d26e-7a55-4fc9-92cb-45e613084562'),
('083a848a-49cb-457f-9615-120be8c74d9e', '2d8a0ec8-111b-41a2-bf49-7f1ae086c5b1'),
('083a848a-49cb-457f-9615-120be8c74d9e', '2f58d746-0582-47fe-9b67-30809d5ad461'),
('083a848a-49cb-457f-9615-120be8c74d9e', '3774414f-db0d-4928-b080-f22599622e97'),
('083a848a-49cb-457f-9615-120be8c74d9e', '38cbec3e-9ca1-4292-a513-09e86fdcf6b1'),
('083a848a-49cb-457f-9615-120be8c74d9e', '42abef51-b33b-4eb3-8515-3c6b16ca3849'),
('083a848a-49cb-457f-9615-120be8c74d9e', '4873b8a8-8035-4b5e-bdd9-99ac74a4a43b'),
('083a848a-49cb-457f-9615-120be8c74d9e', '4ee94804-bc06-4d02-8541-410768b88a49'),
('083a848a-49cb-457f-9615-120be8c74d9e', '5aa18f9b-2fb1-4edb-bdde-fb79273eee38'),
('083a848a-49cb-457f-9615-120be8c74d9e', '5ea73aac-d0cf-4303-87a4-c9d7f5852734'),
('083a848a-49cb-457f-9615-120be8c74d9e', '8018bd1e-0b43-4b0c-8e5a-fbf31f8ee6db'),
('083a848a-49cb-457f-9615-120be8c74d9e', '84752518-6f2f-451f-ab59-de3ce6674ba1'),
('083a848a-49cb-457f-9615-120be8c74d9e', '8fdff21b-f46c-407c-b566-ce4fcc4c51d4'),
('083a848a-49cb-457f-9615-120be8c74d9e', 'a3f9ba91-6ed5-47ff-a1cc-384c00cc203d'),
('083a848a-49cb-457f-9615-120be8c74d9e', 'c9fb6965-e734-46b4-a174-fa9d1fb7e1cc'),
('0e81ebbb-f3d1-4fbd-bfef-72f9b987d6c3', '62880c1c-3e64-48fa-902f-fa8354347ab8'),
('11bc32e5-55a6-431d-b6c7-32bd9504d070', '4873b8a8-8035-4b5e-bdd9-99ac74a4a43b'),
('1720600c-859b-44a5-9c18-5e52dc2889c6', 'fa28bdd3-33ed-4a5a-a09f-6561fce814e5'),
('21a2bc5f-a976-435d-bee4-48b69da694e0', '5537c057-dd18-4349-871e-170ca3b0d8c1'),
('21b65e52-b4e3-453e-b0f0-10a44a4a887d', '8d650dc2-d0e7-4ad7-8193-3ce1b7361b02'),
('2de49c9d-f49d-4740-9efe-60300788a4e7', '76a4f31d-7149-4d92-bfba-654c2cb6c754'),
('42dcf4f5-8f73-4907-bd90-669cccd66c23', '91f398b2-23a0-4cd3-8bc0-c3097df0e1e5'),
('4a092fac-6395-411d-96d7-89d44bd5f45b', 'd0e1cd3e-97c6-4d95-9e8e-82672d651bc3'),
('5537c057-dd18-4349-871e-170ca3b0d8c1', '62880c1c-3e64-48fa-902f-fa8354347ab8'),
('5537c057-dd18-4349-871e-170ca3b0d8c1', 'a374e2d8-5a96-4f06-bdeb-87d2d1fd92f2'),
('6c47d98c-a723-4053-8e87-762c04a3c72f', '2de49c9d-f49d-4740-9efe-60300788a4e7'),
('6e9c2f6c-209f-407f-b3ca-514fe7f823a8', '009e9136-3a22-481c-963f-1975f8752bdc'),
('6e9c2f6c-209f-407f-b3ca-514fe7f823a8', '0712cdcc-c020-4adb-9666-e455b77f4803'),
('6e9c2f6c-209f-407f-b3ca-514fe7f823a8', '1088e338-7373-46fb-aa87-886ed7c3907d'),
('6e9c2f6c-209f-407f-b3ca-514fe7f823a8', '1235ad96-d5a3-4632-b9f7-367030b03962'),
('6e9c2f6c-209f-407f-b3ca-514fe7f823a8', '1280edcf-1968-4cba-9a1f-a3ea2153ce1b'),
('6e9c2f6c-209f-407f-b3ca-514fe7f823a8', '23f08d10-bcf7-4247-b4c0-684e3e29c1bb'),
('6e9c2f6c-209f-407f-b3ca-514fe7f823a8', '25d085af-e999-4256-b07d-a2832be50fe6'),
('6e9c2f6c-209f-407f-b3ca-514fe7f823a8', '26874e1f-65be-45c2-a6b4-ab133a85c169'),
('6e9c2f6c-209f-407f-b3ca-514fe7f823a8', '2751187a-c709-4ac1-bada-8fd93cdbdcf4'),
('6e9c2f6c-209f-407f-b3ca-514fe7f823a8', '2c2938a2-8c99-4c66-bfd7-47331dd9d45c'),
('6e9c2f6c-209f-407f-b3ca-514fe7f823a8', '4a092fac-6395-411d-96d7-89d44bd5f45b'),
('6e9c2f6c-209f-407f-b3ca-514fe7f823a8', '4ee6ec5a-1aa5-4458-9575-8e3879b90575'),
('6e9c2f6c-209f-407f-b3ca-514fe7f823a8', '4f099d14-b60c-4389-9a7a-7c96e149f912'),
('6e9c2f6c-209f-407f-b3ca-514fe7f823a8', '5f884970-9b9e-4d53-89b7-700d93dba404'),
('6e9c2f6c-209f-407f-b3ca-514fe7f823a8', '631e9bda-5884-47b8-b0d6-838e2ce5002a'),
('6e9c2f6c-209f-407f-b3ca-514fe7f823a8', '6a80905b-a478-4508-ad14-34cf340aca3e'),
('6e9c2f6c-209f-407f-b3ca-514fe7f823a8', '6c8abaad-5f92-4c96-843b-65fa9442893c'),
('6e9c2f6c-209f-407f-b3ca-514fe7f823a8', '751e44ac-04c7-4a95-805c-f907f205c48a'),
('6e9c2f6c-209f-407f-b3ca-514fe7f823a8', '7d14203c-2cb4-4d49-8bb3-c56d425e9db1'),
('6e9c2f6c-209f-407f-b3ca-514fe7f823a8', '8b2aacae-a622-446c-9954-a8de983150f0'),
('6e9c2f6c-209f-407f-b3ca-514fe7f823a8', '9315172c-6dc1-4d8c-973a-4309599cf07b'),
('6e9c2f6c-209f-407f-b3ca-514fe7f823a8', '944d3748-9707-4ff3-95a6-4a6b6d34243b'),
('6e9c2f6c-209f-407f-b3ca-514fe7f823a8', '9d7cc7b1-217f-47bd-9347-a3f141638576'),
('6e9c2f6c-209f-407f-b3ca-514fe7f823a8', 'a1daea5c-dd4c-4528-bcfd-2922afc47cc0'),
('6e9c2f6c-209f-407f-b3ca-514fe7f823a8', 'a29864c1-5a10-4c4d-82f7-72b6becb4416'),
('6e9c2f6c-209f-407f-b3ca-514fe7f823a8', 'a6174657-cbd7-40a6-ae34-c83cabdd1791'),
('6e9c2f6c-209f-407f-b3ca-514fe7f823a8', 'b8fb8449-0975-425e-abe9-edcf6bfcdc9a'),
('6e9c2f6c-209f-407f-b3ca-514fe7f823a8', 'c6ceaf7a-8a48-45d6-99b0-99665a2e4136'),
('6e9c2f6c-209f-407f-b3ca-514fe7f823a8', 'd0e1cd3e-97c6-4d95-9e8e-82672d651bc3'),
('6e9c2f6c-209f-407f-b3ca-514fe7f823a8', 'd810cfe5-f254-4e37-8b9a-0922ebd84a27'),
('6e9c2f6c-209f-407f-b3ca-514fe7f823a8', 'dfb5d699-91ee-4938-8991-618fecf0aaba'),
('6e9c2f6c-209f-407f-b3ca-514fe7f823a8', 'dfebf1c8-3fb6-4b78-9b05-ae9dd4ff92be'),
('6e9c2f6c-209f-407f-b3ca-514fe7f823a8', 'e1481a47-36c4-42e2-b55c-fcf0e0395af2'),
('6e9c2f6c-209f-407f-b3ca-514fe7f823a8', 'e58b182a-9ca9-4135-9562-d5493bcf26cc'),
('6e9c2f6c-209f-407f-b3ca-514fe7f823a8', 'f6e211bd-443d-47fe-9888-ed50e6463eaa'),
('6e9c2f6c-209f-407f-b3ca-514fe7f823a8', 'f793ecc6-713f-4630-8777-90c5f45a504a'),
('6e9c2f6c-209f-407f-b3ca-514fe7f823a8', 'f909e7c2-1f7d-4dc4-b0ca-bdfc8d1f7b2c'),
('76a4f31d-7149-4d92-bfba-654c2cb6c754', '21a2bc5f-a976-435d-bee4-48b69da694e0'),
('84752518-6f2f-451f-ab59-de3ce6674ba1', '2f58d746-0582-47fe-9b67-30809d5ad461'),
('84752518-6f2f-451f-ab59-de3ce6674ba1', '8018bd1e-0b43-4b0c-8e5a-fbf31f8ee6db'),
('b6e3d2e0-ba1a-4420-84d1-2cf72096fd38', '9ce77c75-2e84-4d14-9655-706a2f3fc159'),
('d810cfe5-f254-4e37-8b9a-0922ebd84a27', '4f099d14-b60c-4389-9a7a-7c96e149f912'),
('f793ecc6-713f-4630-8777-90c5f45a504a', '4ee6ec5a-1aa5-4458-9575-8e3879b90575'),
('f793ecc6-713f-4630-8777-90c5f45a504a', '9315172c-6dc1-4d8c-973a-4309599cf07b'),
('f909e7c2-1f7d-4dc4-b0ca-bdfc8d1f7b2c', '26874e1f-65be-45c2-a6b4-ab133a85c169'),
('f909e7c2-1f7d-4dc4-b0ca-bdfc8d1f7b2c', '8b2aacae-a622-446c-9954-a8de983150f0');

-- --------------------------------------------------------

--
-- Estrutura da tabela `credential`
--

DROP TABLE IF EXISTS `credential`;
CREATE TABLE IF NOT EXISTS `credential` (
  `ID` varchar(36) NOT NULL,
  `SALT` tinyblob,
  `TYPE` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(36) DEFAULT NULL,
  `CREATED_DATE` bigint DEFAULT NULL,
  `USER_LABEL` varchar(255) DEFAULT NULL,
  `SECRET_DATA` longtext,
  `CREDENTIAL_DATA` longtext,
  `PRIORITY` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USER_CREDENTIAL` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `credential`
--

INSERT INTO `credential` (`ID`, `SALT`, `TYPE`, `USER_ID`, `CREATED_DATE`, `USER_LABEL`, `SECRET_DATA`, `CREDENTIAL_DATA`, `PRIORITY`) VALUES
('0d2417b8-8b49-4d79-ac42-7d52fc16ac42', NULL, 'password', '2286609b-e45f-49d0-a0de-3194d2e98d6d', 1584890674225, NULL, '{\"value\":\"LDSTwa72rOGC5eYjnoKQt0n3mRorwCV8iCGlCdNgSZuMmyyhmFE8cRfgi8WwYz8tYvC90DgcixOpoagJYdabMw==\",\"salt\":\"aKC0nTjAFfqSpK5fCAsJ7w==\"}', '{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\"}', 10),
('1f45ac21-e589-4911-a4f4-62e42ece36cf', NULL, 'password', '70bb6673-d928-4320-87b8-e7b8af6c5a27', 1584888748188, NULL, '{\"value\":\"ZYGNf8Q84T1HBnGNNepva4N4WOdk1sbmNzzRtslHb80c1kiH06D29MQ/68ELGoCnjE2DCm7HsyxUAC6lAG+6Rg==\",\"salt\":\"wCdXzmsyhcHAh/psD73caw==\"}', '{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\"}', 10),
('381e8ad0-4bad-4c96-a5b8-65a2ef7a33e8', NULL, 'password', '1a038ff7-3be2-4d48-98c8-02dd11750cb0', 1584890596203, NULL, '{\"value\":\"Ub0fMLzt05QD1CwKqxiYOFM0egZve60e/lOfZkwigFY+Yf7M65qY/1N64frPOXB8G55BUGWfppluviQvW0JGvQ==\",\"salt\":\"Rwlb3L8zjhMd45CHTRQH5A==\"}', '{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\"}', 10),
('454dd372-579d-4593-9344-1679ffcdead7', NULL, 'password', '688171b4-638a-43df-87c4-c5e85751346f', 1584888405526, NULL, '{\"value\":\"pmuoNZ5IlbYAyaMvkH07edBdhWdNGUDhZ4IWoNCcRVwoILkl8RcmaDlHJGc7ZAJdcaSgDSv8b0v+Vtr/rgzMCw==\",\"salt\":\"eIOX2sKFcRXugg2cY2TNCQ==\"}', '{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\"}', 10),
('63c91e19-de3e-49a2-9f5e-99bb40279c07', NULL, 'password', 'c96b54e0-8164-4004-aec8-025f7af0838c', 1584887748675, NULL, '{\"value\":\"Nw1ui9LNMy4u9eRayXW7Mr6q71c0WzbuCDT09BTPUlsb9A3Pulgc8qwpQGU3OrWNuAfj9XdNta7awAosr9dQPw==\",\"salt\":\"djJ7bt0FuQxvzd+rFQuTiw==\"}', '{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\"}', 10),
('7821832b-1e82-45a2-b8d3-f1a6ad909e64', NULL, 'password', 'c4af4e2f-b432-4c3b-8405-cca86cd5b97b', 1505479392766, NULL, '{\"value\":\"MbKsMgWPnZyImih8s4SaoCSCq+XIY/c6S9F93sXEidHF1TjPWxCqMkec0+o3860CMLXHt3az61cIJOWI0FW9aw==\",\"salt\":\"fmpBI1r8R1u75hDLMUlwBw==\"}', '{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\"}', 10),
('9a611fc5-5e7d-4dd9-a33e-8cf68944c584', NULL, 'password', '54384ff2-4758-49f5-be96-9a944eafa60f', 1584832560623, NULL, '{\"value\":\"s2UuQX+Af91Se/WuC1nmmJilwLr2XHofZTnWKG+/K+U9m6GddJrlsL+0K9Us1nBOd8QbtE6mamsbS/R7jqbGOA==\",\"salt\":\"cAGlG/Hy2CXAsGiBUJ/llw==\"}', '{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\"}', 10),
('a7ecd220-d60a-4083-8f23-b220de9f5b6e', NULL, 'password', 'b3c1bfae-0a77-48a2-8dba-7b6559b8959f', 1584888065712, NULL, '{\"value\":\"Quf0MO9OwQenLbjqxQiD9d/e6iP4hHXpAQx9+16Qxtz9SCvnl7C3YaVJZ3MuW8TaaRl5NOYF4/I04M/FgKravg==\",\"salt\":\"WBdEcSfHDdmxN7wqa774HA==\"}', '{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\"}', 10),
('bd5fdfc7-3c1f-412d-bf60-9bf97791d71c', NULL, 'password', '8f57c0d4-2f03-4f33-b3b3-837ed2a147f1', 1584890457644, NULL, '{\"value\":\"46Kxg5HQA3FWlNqM/WPB61RB8jvseSv2AQkIm43luKvpoQWByUIHhNZe+lS4DJBGuOP3tk5e5g1WD8DUZ9MxbA==\",\"salt\":\"Gs+USXarxGetZKz1J5iKUg==\"}', '{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\"}', 10),
('da5509b6-246c-4db8-880f-0f103f972995', NULL, 'password', '4c973896-5761-41fc-8217-07c5d13a004b', 1584995642370, NULL, '{\"value\":\"2MwhfRvMCgOxrls+tg2lWWc8Ccu/9+LzY5X1y815enXkFwUdDbAgXR6wZP5hawzG//hqBktxMN/MxO91PefCbQ==\",\"salt\":\"YiT3pc+0HYtK8Ac6GmgeMg==\"}', '{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\"}', 10),
('e91b8cf4-07b9-47ec-86b4-2dcd743b54bc', NULL, 'password', '600c76dd-7e28-4067-83a8-8afd8acdadaa', 1584887949924, NULL, '{\"value\":\"a8Kb0KtZsoKBXACW+0HrRl+gGjFmLy/s4Wzh86Pp+JVy/mTC37Z9vAqd+zIW2FWvc13rZTtjINe2aBHa29K1RQ==\",\"salt\":\"feQR13mB7Rj2Lslt+NEq+A==\"}', '{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\"}', 10);

-- --------------------------------------------------------

--
-- Estrutura da tabela `databasechangelog`
--

DROP TABLE IF EXISTS `databasechangelog`;
CREATE TABLE IF NOT EXISTS `databasechangelog` (
  `ID` varchar(255) NOT NULL,
  `AUTHOR` varchar(255) NOT NULL,
  `FILENAME` varchar(255) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int NOT NULL,
  `EXECTYPE` varchar(10) NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL,
  `CONTEXTS` varchar(255) DEFAULT NULL,
  `LABELS` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `databasechangelog`
--

INSERT INTO `databasechangelog` (`ID`, `AUTHOR`, `FILENAME`, `DATEEXECUTED`, `ORDEREXECUTED`, `EXECTYPE`, `MD5SUM`, `DESCRIPTION`, `COMMENTS`, `TAG`, `LIQUIBASE`, `CONTEXTS`, `LABELS`, `DEPLOYMENT_ID`) VALUES
('1.0.0.Final-KEYCLOAK-5461', 'sthorger@redhat.com', 'META-INF/jpa-changelog-1.0.0.Final.xml', '2020-03-21 23:14:38', 1, 'EXECUTED', '7:4e70412f24a3f382c82183742ec79317', 'createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...', '', NULL, '3.5.4', NULL, NULL, '4832466971'),
('1.0.0.Final-KEYCLOAK-5461', 'sthorger@redhat.com', 'META-INF/db2-jpa-changelog-1.0.0.Final.xml', '2020-03-21 23:14:38', 2, 'MARK_RAN', '7:cb16724583e9675711801c6875114f28', 'createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...', '', NULL, '3.5.4', NULL, NULL, '4832466971'),
('1.1.0.Beta1', 'sthorger@redhat.com', 'META-INF/jpa-changelog-1.1.0.Beta1.xml', '2020-03-21 23:14:40', 3, 'EXECUTED', '7:0310eb8ba07cec616460794d42ade0fa', 'delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...', '', NULL, '3.5.4', NULL, NULL, '4832466971'),
('1.1.0.Final', 'sthorger@redhat.com', 'META-INF/jpa-changelog-1.1.0.Final.xml', '2020-03-21 23:14:40', 4, 'EXECUTED', '7:5d25857e708c3233ef4439df1f93f012', 'renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY', '', NULL, '3.5.4', NULL, NULL, '4832466971'),
('1.2.0.Beta1', 'psilva@redhat.com', 'META-INF/jpa-changelog-1.2.0.Beta1.xml', '2020-03-21 23:14:44', 5, 'EXECUTED', '7:c7a54a1041d58eb3817a4a883b4d4e84', 'delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...', '', NULL, '3.5.4', NULL, NULL, '4832466971'),
('1.2.0.Beta1', 'psilva@redhat.com', 'META-INF/db2-jpa-changelog-1.2.0.Beta1.xml', '2020-03-21 23:14:44', 6, 'MARK_RAN', '7:2e01012df20974c1c2a605ef8afe25b7', 'delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...', '', NULL, '3.5.4', NULL, NULL, '4832466971'),
('1.2.0.RC1', 'bburke@redhat.com', 'META-INF/jpa-changelog-1.2.0.CR1.xml', '2020-03-21 23:14:50', 7, 'EXECUTED', '7:0f08df48468428e0f30ee59a8ec01a41', 'delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...', '', NULL, '3.5.4', NULL, NULL, '4832466971'),
('1.2.0.RC1', 'bburke@redhat.com', 'META-INF/db2-jpa-changelog-1.2.0.CR1.xml', '2020-03-21 23:14:50', 8, 'MARK_RAN', '7:a77ea2ad226b345e7d689d366f185c8c', 'delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...', '', NULL, '3.5.4', NULL, NULL, '4832466971'),
('1.2.0.Final', 'keycloak', 'META-INF/jpa-changelog-1.2.0.Final.xml', '2020-03-21 23:14:50', 9, 'EXECUTED', '7:a3377a2059aefbf3b90ebb4c4cc8e2ab', 'update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT', '', NULL, '3.5.4', NULL, NULL, '4832466971'),
('1.3.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-1.3.0.xml', '2020-03-21 23:14:55', 10, 'EXECUTED', '7:04c1dbedc2aa3e9756d1a1668e003451', 'delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...', '', NULL, '3.5.4', NULL, NULL, '4832466971'),
('1.4.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-1.4.0.xml', '2020-03-21 23:14:57', 11, 'EXECUTED', '7:36ef39ed560ad07062d956db861042ba', 'delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...', '', NULL, '3.5.4', NULL, NULL, '4832466971'),
('1.4.0', 'bburke@redhat.com', 'META-INF/db2-jpa-changelog-1.4.0.xml', '2020-03-21 23:14:57', 12, 'MARK_RAN', '7:d909180b2530479a716d3f9c9eaea3d7', 'delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...', '', NULL, '3.5.4', NULL, NULL, '4832466971'),
('1.5.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-1.5.0.xml', '2020-03-21 23:14:58', 13, 'EXECUTED', '7:cf12b04b79bea5152f165eb41f3955f6', 'delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...', '', NULL, '3.5.4', NULL, NULL, '4832466971'),
('1.6.1_from15', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.6.1.xml', '2020-03-21 23:14:59', 14, 'EXECUTED', '7:7e32c8f05c755e8675764e7d5f514509', 'addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...', '', NULL, '3.5.4', NULL, NULL, '4832466971'),
('1.6.1_from16-pre', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.6.1.xml', '2020-03-21 23:14:59', 15, 'MARK_RAN', '7:980ba23cc0ec39cab731ce903dd01291', 'delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION', '', NULL, '3.5.4', NULL, NULL, '4832466971'),
('1.6.1_from16', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.6.1.xml', '2020-03-21 23:14:59', 16, 'MARK_RAN', '7:2fa220758991285312eb84f3b4ff5336', 'dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...', '', NULL, '3.5.4', NULL, NULL, '4832466971'),
('1.6.1', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.6.1.xml', '2020-03-21 23:14:59', 17, 'EXECUTED', '7:d41d8cd98f00b204e9800998ecf8427e', 'empty', '', NULL, '3.5.4', NULL, NULL, '4832466971'),
('1.7.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-1.7.0.xml', '2020-03-21 23:15:02', 18, 'EXECUTED', '7:91ace540896df890cc00a0490ee52bbc', 'createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...', '', NULL, '3.5.4', NULL, NULL, '4832466971'),
('1.8.0', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.8.0.xml', '2020-03-21 23:15:05', 19, 'EXECUTED', '7:c31d1646dfa2618a9335c00e07f89f24', 'addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...', '', NULL, '3.5.4', NULL, NULL, '4832466971'),
('1.8.0-2', 'keycloak', 'META-INF/jpa-changelog-1.8.0.xml', '2020-03-21 23:15:05', 20, 'EXECUTED', '7:df8bc21027a4f7cbbb01f6344e89ce07', 'dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL', '', NULL, '3.5.4', NULL, NULL, '4832466971'),
('1.8.0', 'mposolda@redhat.com', 'META-INF/db2-jpa-changelog-1.8.0.xml', '2020-03-21 23:15:05', 21, 'MARK_RAN', '7:f987971fe6b37d963bc95fee2b27f8df', 'addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...', '', NULL, '3.5.4', NULL, NULL, '4832466971'),
('1.8.0-2', 'keycloak', 'META-INF/db2-jpa-changelog-1.8.0.xml', '2020-03-21 23:15:05', 22, 'MARK_RAN', '7:df8bc21027a4f7cbbb01f6344e89ce07', 'dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL', '', NULL, '3.5.4', NULL, NULL, '4832466971'),
('1.9.0', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.9.0.xml', '2020-03-21 23:15:05', 23, 'EXECUTED', '7:ed2dc7f799d19ac452cbcda56c929e47', 'update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...', '', NULL, '3.5.4', NULL, NULL, '4832466971'),
('1.9.1', 'keycloak', 'META-INF/jpa-changelog-1.9.1.xml', '2020-03-21 23:15:06', 24, 'EXECUTED', '7:80b5db88a5dda36ece5f235be8757615', 'modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM', '', NULL, '3.5.4', NULL, NULL, '4832466971'),
('1.9.1', 'keycloak', 'META-INF/db2-jpa-changelog-1.9.1.xml', '2020-03-21 23:15:06', 25, 'MARK_RAN', '7:1437310ed1305a9b93f8848f301726ce', 'modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM', '', NULL, '3.5.4', NULL, NULL, '4832466971'),
('1.9.2', 'keycloak', 'META-INF/jpa-changelog-1.9.2.xml', '2020-03-21 23:15:06', 26, 'EXECUTED', '7:b82ffb34850fa0836be16deefc6a87c4', 'createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...', '', NULL, '3.5.4', NULL, NULL, '4832466971'),
('authz-2.0.0', 'psilva@redhat.com', 'META-INF/jpa-changelog-authz-2.0.0.xml', '2020-03-21 23:15:11', 27, 'EXECUTED', '7:9cc98082921330d8d9266decdd4bd658', 'createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...', '', NULL, '3.5.4', NULL, NULL, '4832466971'),
('authz-2.5.1', 'psilva@redhat.com', 'META-INF/jpa-changelog-authz-2.5.1.xml', '2020-03-21 23:15:11', 28, 'EXECUTED', '7:03d64aeed9cb52b969bd30a7ac0db57e', 'update tableName=RESOURCE_SERVER_POLICY', '', NULL, '3.5.4', NULL, NULL, '4832466971'),
('2.1.0-KEYCLOAK-5461', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.1.0.xml', '2020-03-21 23:15:13', 29, 'EXECUTED', '7:f1f9fd8710399d725b780f463c6b21cd', 'createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...', '', NULL, '3.5.4', NULL, NULL, '4832466971'),
('2.2.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.2.0.xml', '2020-03-21 23:15:14', 30, 'EXECUTED', '7:53188c3eb1107546e6f765835705b6c1', 'addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...', '', NULL, '3.5.4', NULL, NULL, '4832466971'),
('2.3.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.3.0.xml', '2020-03-21 23:15:16', 31, 'EXECUTED', '7:d6e6f3bc57a0c5586737d1351725d4d4', 'createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...', '', NULL, '3.5.4', NULL, NULL, '4832466971'),
('2.4.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.4.0.xml', '2020-03-21 23:15:16', 32, 'EXECUTED', '7:454d604fbd755d9df3fd9c6329043aa5', 'customChange', '', NULL, '3.5.4', NULL, NULL, '4832466971'),
('2.5.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.5.0.xml', '2020-03-21 23:15:16', 33, 'EXECUTED', '7:57e98a3077e29caf562f7dbf80c72600', 'customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION', '', NULL, '3.5.4', NULL, NULL, '4832466971'),
('2.5.0-unicode-oracle', 'hmlnarik@redhat.com', 'META-INF/jpa-changelog-2.5.0.xml', '2020-03-21 23:15:16', 34, 'MARK_RAN', '7:e4c7e8f2256210aee71ddc42f538b57a', 'modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...', '', NULL, '3.5.4', NULL, NULL, '4832466971'),
('2.5.0-unicode-other-dbs', 'hmlnarik@redhat.com', 'META-INF/jpa-changelog-2.5.0.xml', '2020-03-21 23:15:20', 35, 'EXECUTED', '7:09a43c97e49bc626460480aa1379b522', 'modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...', '', NULL, '3.5.4', NULL, NULL, '4832466971'),
('2.5.0-duplicate-email-support', 'slawomir@dabek.name', 'META-INF/jpa-changelog-2.5.0.xml', '2020-03-21 23:15:20', 36, 'EXECUTED', '7:26bfc7c74fefa9126f2ce702fb775553', 'addColumn tableName=REALM', '', NULL, '3.5.4', NULL, NULL, '4832466971'),
('2.5.0-unique-group-names', 'hmlnarik@redhat.com', 'META-INF/jpa-changelog-2.5.0.xml', '2020-03-21 23:15:20', 37, 'EXECUTED', '7:a161e2ae671a9020fff61e996a207377', 'addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP', '', NULL, '3.5.4', NULL, NULL, '4832466971'),
('2.5.1', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.5.1.xml', '2020-03-21 23:15:20', 38, 'EXECUTED', '7:37fc1781855ac5388c494f1442b3f717', 'addColumn tableName=FED_USER_CONSENT', '', NULL, '3.5.4', NULL, NULL, '4832466971'),
('3.0.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-3.0.0.xml', '2020-03-21 23:15:21', 39, 'EXECUTED', '7:13a27db0dae6049541136adad7261d27', 'addColumn tableName=IDENTITY_PROVIDER', '', NULL, '3.5.4', NULL, NULL, '4832466971'),
('3.2.0-fix', 'keycloak', 'META-INF/jpa-changelog-3.2.0.xml', '2020-03-21 23:15:21', 40, 'MARK_RAN', '7:550300617e3b59e8af3a6294df8248a3', 'addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS', '', NULL, '3.5.4', NULL, NULL, '4832466971'),
('3.2.0-fix-with-keycloak-5416', 'keycloak', 'META-INF/jpa-changelog-3.2.0.xml', '2020-03-21 23:15:21', 41, 'MARK_RAN', '7:e3a9482b8931481dc2772a5c07c44f17', 'dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS', '', NULL, '3.5.4', NULL, NULL, '4832466971'),
('3.2.0-fix-offline-sessions', 'hmlnarik', 'META-INF/jpa-changelog-3.2.0.xml', '2020-03-21 23:15:21', 42, 'EXECUTED', '7:72b07d85a2677cb257edb02b408f332d', 'customChange', '', NULL, '3.5.4', NULL, NULL, '4832466971'),
('3.2.0-fixed', 'keycloak', 'META-INF/jpa-changelog-3.2.0.xml', '2020-03-21 23:15:25', 43, 'EXECUTED', '7:a72a7858967bd414835d19e04d880312', 'addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...', '', NULL, '3.5.4', NULL, NULL, '4832466971'),
('3.3.0', 'keycloak', 'META-INF/jpa-changelog-3.3.0.xml', '2020-03-21 23:15:25', 44, 'EXECUTED', '7:94edff7cf9ce179e7e85f0cd78a3cf2c', 'addColumn tableName=USER_ENTITY', '', NULL, '3.5.4', NULL, NULL, '4832466971'),
('authz-3.4.0.CR1-resource-server-pk-change-part1', 'glavoie@gmail.com', 'META-INF/jpa-changelog-authz-3.4.0.CR1.xml', '2020-03-21 23:15:26', 45, 'EXECUTED', '7:6a48ce645a3525488a90fbf76adf3bb3', 'addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE', '', NULL, '3.5.4', NULL, NULL, '4832466971'),
('authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095', 'hmlnarik@redhat.com', 'META-INF/jpa-changelog-authz-3.4.0.CR1.xml', '2020-03-21 23:15:26', 46, 'EXECUTED', '7:e64b5dcea7db06077c6e57d3b9e5ca14', 'customChange', '', NULL, '3.5.4', NULL, NULL, '4832466971'),
('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed', 'glavoie@gmail.com', 'META-INF/jpa-changelog-authz-3.4.0.CR1.xml', '2020-03-21 23:15:26', 47, 'MARK_RAN', '7:fd8cf02498f8b1e72496a20afc75178c', 'dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE', '', NULL, '3.5.4', NULL, NULL, '4832466971'),
('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex', 'glavoie@gmail.com', 'META-INF/jpa-changelog-authz-3.4.0.CR1.xml', '2020-03-21 23:15:29', 48, 'EXECUTED', '7:542794f25aa2b1fbabb7e577d6646319', 'addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...', '', NULL, '3.5.4', NULL, NULL, '4832466971'),
('authn-3.4.0.CR1-refresh-token-max-reuse', 'glavoie@gmail.com', 'META-INF/jpa-changelog-authz-3.4.0.CR1.xml', '2020-03-21 23:15:29', 49, 'EXECUTED', '7:edad604c882df12f74941dac3cc6d650', 'addColumn tableName=REALM', '', NULL, '3.5.4', NULL, NULL, '4832466971'),
('3.4.0', 'keycloak', 'META-INF/jpa-changelog-3.4.0.xml', '2020-03-21 23:15:32', 50, 'EXECUTED', '7:0f88b78b7b46480eb92690cbf5e44900', 'addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...', '', NULL, '3.5.4', NULL, NULL, '4832466971'),
('3.4.0-KEYCLOAK-5230', 'hmlnarik@redhat.com', 'META-INF/jpa-changelog-3.4.0.xml', '2020-03-21 23:15:33', 51, 'EXECUTED', '7:d560e43982611d936457c327f872dd59', 'createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...', '', NULL, '3.5.4', NULL, NULL, '4832466971'),
('3.4.1', 'psilva@redhat.com', 'META-INF/jpa-changelog-3.4.1.xml', '2020-03-21 23:15:33', 52, 'EXECUTED', '7:c155566c42b4d14ef07059ec3b3bbd8e', 'modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES', '', NULL, '3.5.4', NULL, NULL, '4832466971'),
('3.4.2', 'keycloak', 'META-INF/jpa-changelog-3.4.2.xml', '2020-03-21 23:15:33', 53, 'EXECUTED', '7:b40376581f12d70f3c89ba8ddf5b7dea', 'update tableName=REALM', '', NULL, '3.5.4', NULL, NULL, '4832466971'),
('3.4.2-KEYCLOAK-5172', 'mkanis@redhat.com', 'META-INF/jpa-changelog-3.4.2.xml', '2020-03-21 23:15:33', 54, 'EXECUTED', '7:a1132cc395f7b95b3646146c2e38f168', 'update tableName=CLIENT', '', NULL, '3.5.4', NULL, NULL, '4832466971'),
('4.0.0-KEYCLOAK-6335', 'bburke@redhat.com', 'META-INF/jpa-changelog-4.0.0.xml', '2020-03-21 23:15:33', 55, 'EXECUTED', '7:d8dc5d89c789105cfa7ca0e82cba60af', 'createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS', '', NULL, '3.5.4', NULL, NULL, '4832466971'),
('4.0.0-CLEANUP-UNUSED-TABLE', 'bburke@redhat.com', 'META-INF/jpa-changelog-4.0.0.xml', '2020-03-21 23:15:33', 56, 'EXECUTED', '7:7822e0165097182e8f653c35517656a3', 'dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING', '', NULL, '3.5.4', NULL, NULL, '4832466971'),
('4.0.0-KEYCLOAK-6228', 'bburke@redhat.com', 'META-INF/jpa-changelog-4.0.0.xml', '2020-03-21 23:15:34', 57, 'EXECUTED', '7:c6538c29b9c9a08f9e9ea2de5c2b6375', 'dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...', '', NULL, '3.5.4', NULL, NULL, '4832466971'),
('4.0.0-KEYCLOAK-5579-fixed', 'mposolda@redhat.com', 'META-INF/jpa-changelog-4.0.0.xml', '2020-03-21 23:15:42', 58, 'EXECUTED', '7:6d4893e36de22369cf73bcb051ded875', 'dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...', '', NULL, '3.5.4', NULL, NULL, '4832466971'),
('authz-4.0.0.CR1', 'psilva@redhat.com', 'META-INF/jpa-changelog-authz-4.0.0.CR1.xml', '2020-03-21 23:15:43', 59, 'EXECUTED', '7:57960fc0b0f0dd0563ea6f8b2e4a1707', 'createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...', '', NULL, '3.5.4', NULL, NULL, '4832466971'),
('authz-4.0.0.Beta3', 'psilva@redhat.com', 'META-INF/jpa-changelog-authz-4.0.0.Beta3.xml', '2020-03-21 23:15:44', 60, 'EXECUTED', '7:2b4b8bff39944c7097977cc18dbceb3b', 'addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY', '', NULL, '3.5.4', NULL, NULL, '4832466971'),
('authz-4.2.0.Final', 'mhajas@redhat.com', 'META-INF/jpa-changelog-authz-4.2.0.Final.xml', '2020-03-21 23:15:44', 61, 'EXECUTED', '7:2aa42a964c59cd5b8ca9822340ba33a8', 'createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...', '', NULL, '3.5.4', NULL, NULL, '4832466971'),
('authz-4.2.0.Final-KEYCLOAK-9944', 'hmlnarik@redhat.com', 'META-INF/jpa-changelog-authz-4.2.0.Final.xml', '2020-03-21 23:15:44', 62, 'EXECUTED', '7:9ac9e58545479929ba23f4a3087a0346', 'addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS', '', NULL, '3.5.4', NULL, NULL, '4832466971'),
('4.2.0-KEYCLOAK-6313', 'wadahiro@gmail.com', 'META-INF/jpa-changelog-4.2.0.xml', '2020-03-21 23:15:44', 63, 'EXECUTED', '7:14d407c35bc4fe1976867756bcea0c36', 'addColumn tableName=REQUIRED_ACTION_PROVIDER', '', NULL, '3.5.4', NULL, NULL, '4832466971'),
('4.3.0-KEYCLOAK-7984', 'wadahiro@gmail.com', 'META-INF/jpa-changelog-4.3.0.xml', '2020-03-21 23:15:44', 64, 'EXECUTED', '7:241a8030c748c8548e346adee548fa93', 'update tableName=REQUIRED_ACTION_PROVIDER', '', NULL, '3.5.4', NULL, NULL, '4832466971'),
('4.6.0-KEYCLOAK-7950', 'psilva@redhat.com', 'META-INF/jpa-changelog-4.6.0.xml', '2020-03-21 23:15:44', 65, 'EXECUTED', '7:7d3182f65a34fcc61e8d23def037dc3f', 'update tableName=RESOURCE_SERVER_RESOURCE', '', NULL, '3.5.4', NULL, NULL, '4832466971'),
('4.6.0-KEYCLOAK-8377', 'keycloak', 'META-INF/jpa-changelog-4.6.0.xml', '2020-03-21 23:15:45', 66, 'EXECUTED', '7:b30039e00a0b9715d430d1b0636728fa', 'createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...', '', NULL, '3.5.4', NULL, NULL, '4832466971'),
('4.6.0-KEYCLOAK-8555', 'gideonray@gmail.com', 'META-INF/jpa-changelog-4.6.0.xml', '2020-03-21 23:15:45', 67, 'EXECUTED', '7:3797315ca61d531780f8e6f82f258159', 'createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT', '', NULL, '3.5.4', NULL, NULL, '4832466971'),
('4.7.0-KEYCLOAK-1267', 'sguilhen@redhat.com', 'META-INF/jpa-changelog-4.7.0.xml', '2020-03-21 23:15:45', 68, 'EXECUTED', '7:c7aa4c8d9573500c2d347c1941ff0301', 'addColumn tableName=REALM', '', NULL, '3.5.4', NULL, NULL, '4832466971'),
('4.7.0-KEYCLOAK-7275', 'keycloak', 'META-INF/jpa-changelog-4.7.0.xml', '2020-03-21 23:15:45', 69, 'EXECUTED', '7:b207faee394fc074a442ecd42185a5dd', 'renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...', '', NULL, '3.5.4', NULL, NULL, '4832466971'),
('4.8.0-KEYCLOAK-8835', 'sguilhen@redhat.com', 'META-INF/jpa-changelog-4.8.0.xml', '2020-03-21 23:15:46', 70, 'EXECUTED', '7:ab9a9762faaba4ddfa35514b212c4922', 'addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM', '', NULL, '3.5.4', NULL, NULL, '4832466971'),
('authz-7.0.0-KEYCLOAK-10443', 'psilva@redhat.com', 'META-INF/jpa-changelog-authz-7.0.0.xml', '2020-03-21 23:15:46', 71, 'EXECUTED', '7:b9710f74515a6ccb51b72dc0d19df8c4', 'addColumn tableName=RESOURCE_SERVER', '', NULL, '3.5.4', NULL, NULL, '4832466971'),
('8.0.0-adding-credential-columns', 'keycloak', 'META-INF/jpa-changelog-8.0.0.xml', '2020-03-21 23:15:46', 72, 'EXECUTED', '7:ec9707ae4d4f0b7452fee20128083879', 'addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL', '', NULL, '3.5.4', NULL, NULL, '4832466971'),
('8.0.0-updating-credential-data-not-oracle', 'keycloak', 'META-INF/jpa-changelog-8.0.0.xml', '2020-03-21 23:15:46', 73, 'EXECUTED', '7:03b3f4b264c3c68ba082250a80b74216', 'update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL', '', NULL, '3.5.4', NULL, NULL, '4832466971'),
('8.0.0-updating-credential-data-oracle', 'keycloak', 'META-INF/jpa-changelog-8.0.0.xml', '2020-03-21 23:15:46', 74, 'MARK_RAN', '7:64c5728f5ca1f5aa4392217701c4fe23', 'update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL', '', NULL, '3.5.4', NULL, NULL, '4832466971'),
('8.0.0-credential-cleanup', 'keycloak', 'META-INF/jpa-changelog-8.0.0.xml', '2020-03-21 23:15:49', 75, 'EXECUTED', '7:41f3566ac5177459e1ed3ce8f0ad35d2', 'dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...', '', NULL, '3.5.4', NULL, NULL, '4832466971'),
('8.0.0-resource-tag-support', 'keycloak', 'META-INF/jpa-changelog-8.0.0.xml', '2020-03-21 23:15:49', 76, 'EXECUTED', '7:a73379915c23bfad3e8f5c6d5c0aa4bd', 'addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL', '', NULL, '3.5.4', NULL, NULL, '4832466971'),
('9.0.0-always-display-client', 'keycloak', 'META-INF/jpa-changelog-9.0.0.xml', '2020-03-21 23:15:49', 77, 'EXECUTED', '7:39e0073779aba192646291aa2332493d', 'addColumn tableName=CLIENT', '', NULL, '3.5.4', NULL, NULL, '4832466971'),
('9.0.0-drop-constraints-for-column-increase', 'keycloak', 'META-INF/jpa-changelog-9.0.0.xml', '2020-03-21 23:15:49', 78, 'MARK_RAN', '7:81f87368f00450799b4bf42ea0b3ec34', 'dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...', '', NULL, '3.5.4', NULL, NULL, '4832466971'),
('9.0.0-increase-column-size-federated-fk', 'keycloak', 'META-INF/jpa-changelog-9.0.0.xml', '2020-03-21 23:15:51', 79, 'EXECUTED', '7:20b37422abb9fb6571c618148f013a15', 'modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...', '', NULL, '3.5.4', NULL, NULL, '4832466971'),
('9.0.0-recreate-constraints-after-column-increase', 'keycloak', 'META-INF/jpa-changelog-9.0.0.xml', '2020-03-21 23:15:51', 80, 'MARK_RAN', '7:1970bb6cfb5ee800736b95ad3fb3c78a', 'addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...', '', NULL, '3.5.4', NULL, NULL, '4832466971');

-- --------------------------------------------------------

--
-- Estrutura da tabela `databasechangeloglock`
--

DROP TABLE IF EXISTS `databasechangeloglock`;
CREATE TABLE IF NOT EXISTS `databasechangeloglock` (
  `ID` int NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `databasechangeloglock`
--

INSERT INTO `databasechangeloglock` (`ID`, `LOCKED`, `LOCKGRANTED`, `LOCKEDBY`) VALUES
(1, b'0', NULL, NULL),
(1000, b'0', NULL, NULL),
(1001, b'0', NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `default_client_scope`
--

DROP TABLE IF EXISTS `default_client_scope`;
CREATE TABLE IF NOT EXISTS `default_client_scope` (
  `REALM_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  `DEFAULT_SCOPE` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`REALM_ID`,`SCOPE_ID`),
  KEY `IDX_DEFCLS_REALM` (`REALM_ID`),
  KEY `IDX_DEFCLS_SCOPE` (`SCOPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `default_client_scope`
--

INSERT INTO `default_client_scope` (`REALM_ID`, `SCOPE_ID`, `DEFAULT_SCOPE`) VALUES
('cibmtr-bioinformatics-realm', '021d9ac1-9650-401c-b2a2-efa2f3e6b70c', b'1'),
('cibmtr-bioinformatics-realm', '0d3b55db-e68b-4c83-91d4-7370a6810a24', b'0'),
('cibmtr-bioinformatics-realm', '1dc1e050-891a-4f5b-ac9d-5ea0c2e3c05e', b'0'),
('cibmtr-bioinformatics-realm', '391f1641-cb22-41a3-a0ed-752d9264aaf5', b'1'),
('cibmtr-bioinformatics-realm', '39e1693b-a924-4fbb-b98c-520869771f83', b'1'),
('cibmtr-bioinformatics-realm', '5253d2be-3116-4510-ac05-99619ce2494c', b'0'),
('cibmtr-bioinformatics-realm', '84fdcb72-668b-408e-aaea-110d594afe5e', b'1'),
('cibmtr-bioinformatics-realm', 'a72d436e-111b-445b-804a-967d249f6455', b'0'),
('cibmtr-bioinformatics-realm', 'd5de6a8a-8894-4e72-b6ef-f9bf3a7a6541', b'1'),
('master', '1c9c1b4c-ccb9-4e8f-82b7-5b3a4ac06229', b'1'),
('master', '386b2097-465b-4135-a057-62709870909e', b'0'),
('master', '38793860-edb1-452f-b2e0-e5ad2041cb70', b'1'),
('master', '55178e4f-7c18-4d0d-b010-f9e4079d5d48', b'1'),
('master', '8dee153c-4e64-435f-8a7c-cd9de0eb653d', b'0'),
('master', '8f9a1a9c-4bdf-41e2-a75b-544a12be1d67', b'0'),
('master', 'a749b2db-a1ac-4e58-9fd3-1142e96b0445', b'0'),
('master', 'bd76f66d-85f6-44a6-ad5a-133b3f32016a', b'1'),
('master', 'e3279721-a5de-46c7-b463-8d076a1631ae', b'1');

-- --------------------------------------------------------

--
-- Estrutura da tabela `event_entity`
--

DROP TABLE IF EXISTS `event_entity`;
CREATE TABLE IF NOT EXISTS `event_entity` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `DETAILS_JSON` text,
  `ERROR` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `SESSION_ID` varchar(255) DEFAULT NULL,
  `EVENT_TIME` bigint DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `federated_identity`
--

DROP TABLE IF EXISTS `federated_identity`;
CREATE TABLE IF NOT EXISTS `federated_identity` (
  `IDENTITY_PROVIDER` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `FEDERATED_USER_ID` varchar(255) DEFAULT NULL,
  `FEDERATED_USERNAME` varchar(255) DEFAULT NULL,
  `TOKEN` text,
  `USER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER`,`USER_ID`),
  KEY `IDX_FEDIDENTITY_USER` (`USER_ID`),
  KEY `IDX_FEDIDENTITY_FEDUSER` (`FEDERATED_USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `federated_user`
--

DROP TABLE IF EXISTS `federated_user`;
CREATE TABLE IF NOT EXISTS `federated_user` (
  `ID` varchar(255) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `fed_user_attribute`
--

DROP TABLE IF EXISTS `fed_user_attribute`;
CREATE TABLE IF NOT EXISTS `fed_user_attribute` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  `VALUE` text,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_ATTRIBUTE` (`USER_ID`,`REALM_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `fed_user_consent`
--

DROP TABLE IF EXISTS `fed_user_consent`;
CREATE TABLE IF NOT EXISTS `fed_user_consent` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  `CREATED_DATE` bigint DEFAULT NULL,
  `LAST_UPDATED_DATE` bigint DEFAULT NULL,
  `CLIENT_STORAGE_PROVIDER` varchar(36) DEFAULT NULL,
  `EXTERNAL_CLIENT_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_CONSENT` (`USER_ID`,`CLIENT_ID`),
  KEY `IDX_FU_CONSENT_RU` (`REALM_ID`,`USER_ID`),
  KEY `IDX_FU_CNSNT_EXT` (`USER_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `fed_user_consent_cl_scope`
--

DROP TABLE IF EXISTS `fed_user_consent_cl_scope`;
CREATE TABLE IF NOT EXISTS `fed_user_consent_cl_scope` (
  `USER_CONSENT_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`USER_CONSENT_ID`,`SCOPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `fed_user_credential`
--

DROP TABLE IF EXISTS `fed_user_credential`;
CREATE TABLE IF NOT EXISTS `fed_user_credential` (
  `ID` varchar(36) NOT NULL,
  `SALT` tinyblob,
  `TYPE` varchar(255) DEFAULT NULL,
  `CREATED_DATE` bigint DEFAULT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  `USER_LABEL` varchar(255) DEFAULT NULL,
  `SECRET_DATA` longtext,
  `CREDENTIAL_DATA` longtext,
  `PRIORITY` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_CREDENTIAL` (`USER_ID`,`TYPE`),
  KEY `IDX_FU_CREDENTIAL_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `fed_user_group_membership`
--

DROP TABLE IF EXISTS `fed_user_group_membership`;
CREATE TABLE IF NOT EXISTS `fed_user_group_membership` (
  `GROUP_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`GROUP_ID`,`USER_ID`),
  KEY `IDX_FU_GROUP_MEMBERSHIP` (`USER_ID`,`GROUP_ID`),
  KEY `IDX_FU_GROUP_MEMBERSHIP_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `fed_user_required_action`
--

DROP TABLE IF EXISTS `fed_user_required_action`;
CREATE TABLE IF NOT EXISTS `fed_user_required_action` (
  `REQUIRED_ACTION` varchar(255) NOT NULL DEFAULT ' ',
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`REQUIRED_ACTION`,`USER_ID`),
  KEY `IDX_FU_REQUIRED_ACTION` (`USER_ID`,`REQUIRED_ACTION`),
  KEY `IDX_FU_REQUIRED_ACTION_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `fed_user_role_mapping`
--

DROP TABLE IF EXISTS `fed_user_role_mapping`;
CREATE TABLE IF NOT EXISTS `fed_user_role_mapping` (
  `ROLE_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`,`USER_ID`),
  KEY `IDX_FU_ROLE_MAPPING` (`USER_ID`,`ROLE_ID`),
  KEY `IDX_FU_ROLE_MAPPING_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `group_attribute`
--

DROP TABLE IF EXISTS `group_attribute`;
CREATE TABLE IF NOT EXISTS `group_attribute` (
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `GROUP_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_GROUP_ATTR_GROUP` (`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `group_role_mapping`
--

DROP TABLE IF EXISTS `group_role_mapping`;
CREATE TABLE IF NOT EXISTS `group_role_mapping` (
  `ROLE_ID` varchar(36) NOT NULL,
  `GROUP_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ROLE_ID`,`GROUP_ID`),
  KEY `IDX_GROUP_ROLE_MAPP_GROUP` (`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `group_role_mapping`
--

INSERT INTO `group_role_mapping` (`ROLE_ID`, `GROUP_ID`) VALUES
('76a4f31d-7149-4d92-bfba-654c2cb6c754', 'a9d6a304-5647-460d-9cb8-9ef4429204aa'),
('5537c057-dd18-4349-871e-170ca3b0d8c1', 'ab0947d8-3b91-42a0-81e7-953a3c207316'),
('2de49c9d-f49d-4740-9efe-60300788a4e7', 'bc2923fc-c800-444f-aae3-63a3a55c2bfe'),
('0e81ebbb-f3d1-4fbd-bfef-72f9b987d6c3', 'c4255caa-6cf7-40fb-8d5a-1b8799a438b8'),
('6c47d98c-a723-4053-8e87-762c04a3c72f', 'c4255caa-6cf7-40fb-8d5a-1b8799a438b8'),
('a374e2d8-5a96-4f06-bdeb-87d2d1fd92f2', 'd1513a1f-a357-4a85-b039-21a116553130'),
('21a2bc5f-a976-435d-bee4-48b69da694e0', 'f37ebe97-4ebe-4ab2-9582-1a4e61505a2d'),
('8612f4fc-b1fd-43af-8ff8-193a62225bcf', 'f5225541-75da-474a-85b5-206168064336');

-- --------------------------------------------------------

--
-- Estrutura da tabela `identity_provider`
--

DROP TABLE IF EXISTS `identity_provider`;
CREATE TABLE IF NOT EXISTS `identity_provider` (
  `INTERNAL_ID` varchar(36) NOT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `PROVIDER_ALIAS` varchar(255) DEFAULT NULL,
  `PROVIDER_ID` varchar(255) DEFAULT NULL,
  `STORE_TOKEN` bit(1) NOT NULL DEFAULT b'0',
  `AUTHENTICATE_BY_DEFAULT` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) DEFAULT NULL,
  `ADD_TOKEN_ROLE` bit(1) NOT NULL DEFAULT b'1',
  `TRUST_EMAIL` bit(1) NOT NULL DEFAULT b'0',
  `FIRST_BROKER_LOGIN_FLOW_ID` varchar(36) DEFAULT NULL,
  `POST_BROKER_LOGIN_FLOW_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_DISPLAY_NAME` varchar(255) DEFAULT NULL,
  `LINK_ONLY` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`INTERNAL_ID`),
  UNIQUE KEY `UK_2DAELWNIBJI49AVXSRTUF6XJ33` (`PROVIDER_ALIAS`,`REALM_ID`),
  KEY `IDX_IDENT_PROV_REALM` (`REALM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `identity_provider_config`
--

DROP TABLE IF EXISTS `identity_provider_config`;
CREATE TABLE IF NOT EXISTS `identity_provider_config` (
  `IDENTITY_PROVIDER_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `identity_provider_mapper`
--

DROP TABLE IF EXISTS `identity_provider_mapper`;
CREATE TABLE IF NOT EXISTS `identity_provider_mapper` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `IDP_ALIAS` varchar(255) NOT NULL,
  `IDP_MAPPER_NAME` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_ID_PROV_MAPP_REALM` (`REALM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `idp_mapper_config`
--

DROP TABLE IF EXISTS `idp_mapper_config`;
CREATE TABLE IF NOT EXISTS `idp_mapper_config` (
  `IDP_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`IDP_MAPPER_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `keycloak_group`
--

DROP TABLE IF EXISTS `keycloak_group`;
CREATE TABLE IF NOT EXISTS `keycloak_group` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PARENT_GROUP` varchar(36) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `SIBLING_NAMES` (`REALM_ID`,`PARENT_GROUP`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `keycloak_group`
--

INSERT INTO `keycloak_group` (`ID`, `NAME`, `PARENT_GROUP`, `REALM_ID`) VALUES
('c4255caa-6cf7-40fb-8d5a-1b8799a438b8', '01-SystemAdministratorsGroup', NULL, 'cibmtr-bioinformatics-realm'),
('bc2923fc-c800-444f-aae3-63a3a55c2bfe', '02-ApplicationManagersGroup', NULL, 'cibmtr-bioinformatics-realm'),
('a9d6a304-5647-460d-9cb8-9ef4429204aa', '03-ReviewersGroup', NULL, 'cibmtr-bioinformatics-realm'),
('f37ebe97-4ebe-4ab2-9582-1a4e61505a2d', '04-PublishersGroup', NULL, 'cibmtr-bioinformatics-realm'),
('ab0947d8-3b91-42a0-81e7-953a3c207316', '05-RegisteredUsersGroup', NULL, 'cibmtr-bioinformatics-realm'),
('d1513a1f-a357-4a85-b039-21a116553130', '06-MembersOfTheStreetGroup', NULL, 'cibmtr-bioinformatics-realm'),
('f5225541-75da-474a-85b5-206168064336', '99-APIConsumersAppsGroup', NULL, 'cibmtr-bioinformatics-realm');

-- --------------------------------------------------------

--
-- Estrutura da tabela `keycloak_role`
--

DROP TABLE IF EXISTS `keycloak_role`;
CREATE TABLE IF NOT EXISTS `keycloak_role` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_REALM_CONSTRAINT` varchar(255) DEFAULT NULL,
  `CLIENT_ROLE` bit(1) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `CLIENT` varchar(36) DEFAULT NULL,
  `REALM` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_J3RWUVD56ONTGSUHOGM184WW2-2` (`NAME`,`CLIENT_REALM_CONSTRAINT`),
  KEY `IDX_KEYCLOAK_ROLE_CLIENT` (`CLIENT`),
  KEY `IDX_KEYCLOAK_ROLE_REALM` (`REALM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `keycloak_role`
--

INSERT INTO `keycloak_role` (`ID`, `CLIENT_REALM_CONSTRAINT`, `CLIENT_ROLE`, `DESCRIPTION`, `NAME`, `REALM_ID`, `CLIENT`, `REALM`) VALUES
('009e9136-3a22-481c-963f-1975f8752bdc', '1cdadc8e-1773-47bc-9c01-875f84ea25ec', b'1', '${role_create-client}', 'create-client', 'master', '1cdadc8e-1773-47bc-9c01-875f84ea25ec', NULL),
('0712cdcc-c020-4adb-9666-e455b77f4803', '1cdadc8e-1773-47bc-9c01-875f84ea25ec', b'1', '${role_manage-clients}', 'manage-clients', 'master', '1cdadc8e-1773-47bc-9c01-875f84ea25ec', NULL),
('083a848a-49cb-457f-9615-120be8c74d9e', '48fb7988-d909-445a-81db-fe825dca0db2', b'1', '${role_realm-admin}', 'realm-admin', 'cibmtr-bioinformatics-realm', '48fb7988-d909-445a-81db-fe825dca0db2', NULL),
('0e81ebbb-f3d1-4fbd-bfef-72f9b987d6c3', 'cibmtr-bioinformatics-realm', b'0', 'Realm Global Role for System Administrators Profile.', 'ADMIN_GLOBAL_ROLE', 'cibmtr-bioinformatics-realm', NULL, 'cibmtr-bioinformatics-realm'),
('1088e338-7373-46fb-aa87-886ed7c3907d', '1cdadc8e-1773-47bc-9c01-875f84ea25ec', b'1', '${role_manage-identity-providers}', 'manage-identity-providers', 'master', '1cdadc8e-1773-47bc-9c01-875f84ea25ec', NULL),
('11bc32e5-55a6-431d-b6c7-32bd9504d070', '48fb7988-d909-445a-81db-fe825dca0db2', b'1', '${role_view-clients}', 'view-clients', 'cibmtr-bioinformatics-realm', '48fb7988-d909-445a-81db-fe825dca0db2', NULL),
('1235ad96-d5a3-4632-b9f7-367030b03962', 'f1cbf82e-a285-4a15-a172-ff97732a2648', b'1', '${role_view-authorization}', 'view-authorization', 'master', 'f1cbf82e-a285-4a15-a172-ff97732a2648', NULL),
('1280edcf-1968-4cba-9a1f-a3ea2153ce1b', '1cdadc8e-1773-47bc-9c01-875f84ea25ec', b'1', '${role_view-authorization}', 'view-authorization', 'master', '1cdadc8e-1773-47bc-9c01-875f84ea25ec', NULL),
('1720600c-859b-44a5-9c18-5e52dc2889c6', 'f7123f46-5de8-4c40-8cff-5c52b3e26a84', b'1', '${role_manage-consent}', 'manage-consent', 'master', 'f7123f46-5de8-4c40-8cff-5c52b3e26a84', NULL),
('21a2bc5f-a976-435d-bee4-48b69da694e0', '1eabef67-6473-4ba8-b07c-14bdbae4aaed', b'1', 'Client Role for Publishers Profile.', '04_PUBLISHER_CLIENT_ROLE', 'cibmtr-bioinformatics-realm', '1eabef67-6473-4ba8-b07c-14bdbae4aaed', NULL),
('21b65e52-b4e3-453e-b0f0-10a44a4a887d', 'e07da50b-cddc-4524-b630-436a5a6ba8ab', b'1', '${role_manage-account}', 'manage-account', 'cibmtr-bioinformatics-realm', 'e07da50b-cddc-4524-b630-436a5a6ba8ab', NULL),
('225066d4-4a07-4550-a851-3d9359cbbac2', '274afcdb-7742-4a3a-acc5-17db61a4d200', b'1', '${role_read-token}', 'read-token', 'cibmtr-bioinformatics-realm', '274afcdb-7742-4a3a-acc5-17db61a4d200', NULL),
('23f08d10-bcf7-4247-b4c0-684e3e29c1bb', 'f1cbf82e-a285-4a15-a172-ff97732a2648', b'1', '${role_manage-realm}', 'manage-realm', 'master', 'f1cbf82e-a285-4a15-a172-ff97732a2648', NULL),
('24493c26-5ea3-4e53-b949-ca27a06ff098', '48fb7988-d909-445a-81db-fe825dca0db2', b'1', '${role_manage-users}', 'manage-users', 'cibmtr-bioinformatics-realm', '48fb7988-d909-445a-81db-fe825dca0db2', NULL),
('24ba1589-1141-4836-91bb-ad1b10db4944', '48fb7988-d909-445a-81db-fe825dca0db2', b'1', '${role_create-client}', 'create-client', 'cibmtr-bioinformatics-realm', '48fb7988-d909-445a-81db-fe825dca0db2', NULL),
('25d085af-e999-4256-b07d-a2832be50fe6', 'f1cbf82e-a285-4a15-a172-ff97732a2648', b'1', '${role_view-events}', 'view-events', 'master', 'f1cbf82e-a285-4a15-a172-ff97732a2648', NULL),
('26874e1f-65be-45c2-a6b4-ab133a85c169', '1cdadc8e-1773-47bc-9c01-875f84ea25ec', b'1', '${role_query-users}', 'query-users', 'master', '1cdadc8e-1773-47bc-9c01-875f84ea25ec', NULL),
('2751187a-c709-4ac1-bada-8fd93cdbdcf4', 'f1cbf82e-a285-4a15-a172-ff97732a2648', b'1', '${role_manage-identity-providers}', 'manage-identity-providers', 'master', 'f1cbf82e-a285-4a15-a172-ff97732a2648', NULL),
('2a54d26e-7a55-4fc9-92cb-45e613084562', '48fb7988-d909-445a-81db-fe825dca0db2', b'1', '${role_view-realm}', 'view-realm', 'cibmtr-bioinformatics-realm', '48fb7988-d909-445a-81db-fe825dca0db2', NULL),
('2c2938a2-8c99-4c66-bfd7-47331dd9d45c', '1cdadc8e-1773-47bc-9c01-875f84ea25ec', b'1', '${role_view-events}', 'view-events', 'master', '1cdadc8e-1773-47bc-9c01-875f84ea25ec', NULL),
('2d8a0ec8-111b-41a2-bf49-7f1ae086c5b1', '48fb7988-d909-445a-81db-fe825dca0db2', b'1', '${role_manage-realm}', 'manage-realm', 'cibmtr-bioinformatics-realm', '48fb7988-d909-445a-81db-fe825dca0db2', NULL),
('2de49c9d-f49d-4740-9efe-60300788a4e7', '1eabef67-6473-4ba8-b07c-14bdbae4aaed', b'1', 'Client Role for Application Managers Profile.', '02_APP_MANAGER_CLIENT_ROLE', 'cibmtr-bioinformatics-realm', '1eabef67-6473-4ba8-b07c-14bdbae4aaed', NULL),
('2f58d746-0582-47fe-9b67-30809d5ad461', '48fb7988-d909-445a-81db-fe825dca0db2', b'1', '${role_query-users}', 'query-users', 'cibmtr-bioinformatics-realm', '48fb7988-d909-445a-81db-fe825dca0db2', NULL),
('33c455ac-906c-47c4-8bc1-135014aa8efc', 'master', b'0', '${role_uma_authorization}', 'uma_authorization', 'master', NULL, 'master'),
('354b3a09-47a6-4051-957c-c6a3ee28a190', 'e07da50b-cddc-4524-b630-436a5a6ba8ab', b'1', '${role_view-profile}', 'view-profile', 'cibmtr-bioinformatics-realm', 'e07da50b-cddc-4524-b630-436a5a6ba8ab', NULL),
('3774414f-db0d-4928-b080-f22599622e97', '48fb7988-d909-445a-81db-fe825dca0db2', b'1', '${role_manage-clients}', 'manage-clients', 'cibmtr-bioinformatics-realm', '48fb7988-d909-445a-81db-fe825dca0db2', NULL),
('38cbec3e-9ca1-4292-a513-09e86fdcf6b1', '48fb7988-d909-445a-81db-fe825dca0db2', b'1', '${role_view-identity-providers}', 'view-identity-providers', 'cibmtr-bioinformatics-realm', '48fb7988-d909-445a-81db-fe825dca0db2', NULL),
('42abef51-b33b-4eb3-8515-3c6b16ca3849', '48fb7988-d909-445a-81db-fe825dca0db2', b'1', '${role_manage-identity-providers}', 'manage-identity-providers', 'cibmtr-bioinformatics-realm', '48fb7988-d909-445a-81db-fe825dca0db2', NULL),
('42dcf4f5-8f73-4907-bd90-669cccd66c23', 'e07da50b-cddc-4524-b630-436a5a6ba8ab', b'1', '${role_manage-consent}', 'manage-consent', 'cibmtr-bioinformatics-realm', 'e07da50b-cddc-4524-b630-436a5a6ba8ab', NULL),
('4873b8a8-8035-4b5e-bdd9-99ac74a4a43b', '48fb7988-d909-445a-81db-fe825dca0db2', b'1', '${role_query-clients}', 'query-clients', 'cibmtr-bioinformatics-realm', '48fb7988-d909-445a-81db-fe825dca0db2', NULL),
('4a092fac-6395-411d-96d7-89d44bd5f45b', '1cdadc8e-1773-47bc-9c01-875f84ea25ec', b'1', '${role_view-clients}', 'view-clients', 'master', '1cdadc8e-1773-47bc-9c01-875f84ea25ec', NULL),
('4ee6ec5a-1aa5-4458-9575-8e3879b90575', 'f1cbf82e-a285-4a15-a172-ff97732a2648', b'1', '${role_query-users}', 'query-users', 'master', 'f1cbf82e-a285-4a15-a172-ff97732a2648', NULL),
('4ee94804-bc06-4d02-8541-410768b88a49', '48fb7988-d909-445a-81db-fe825dca0db2', b'1', '${role_manage-authorization}', 'manage-authorization', 'cibmtr-bioinformatics-realm', '48fb7988-d909-445a-81db-fe825dca0db2', NULL),
('4f099d14-b60c-4389-9a7a-7c96e149f912', 'f1cbf82e-a285-4a15-a172-ff97732a2648', b'1', '${role_query-clients}', 'query-clients', 'master', 'f1cbf82e-a285-4a15-a172-ff97732a2648', NULL),
('5328d093-e39c-4a2d-b664-01ed54505337', 'e07da50b-cddc-4524-b630-436a5a6ba8ab', b'1', '${role_view-applications}', 'view-applications', 'cibmtr-bioinformatics-realm', 'e07da50b-cddc-4524-b630-436a5a6ba8ab', NULL),
('5537c057-dd18-4349-871e-170ca3b0d8c1', '1eabef67-6473-4ba8-b07c-14bdbae4aaed', b'1', 'Client Role for Common Registered Users Profile.', '05_REGISTERED_USERS_CLIENT_ROLE', 'cibmtr-bioinformatics-realm', '1eabef67-6473-4ba8-b07c-14bdbae4aaed', NULL),
('5aa18f9b-2fb1-4edb-bdde-fb79273eee38', '48fb7988-d909-445a-81db-fe825dca0db2', b'1', '${role_view-events}', 'view-events', 'cibmtr-bioinformatics-realm', '48fb7988-d909-445a-81db-fe825dca0db2', NULL),
('5ea73aac-d0cf-4303-87a4-c9d7f5852734', '48fb7988-d909-445a-81db-fe825dca0db2', b'1', '${role_query-realms}', 'query-realms', 'cibmtr-bioinformatics-realm', '48fb7988-d909-445a-81db-fe825dca0db2', NULL),
('5f884970-9b9e-4d53-89b7-700d93dba404', 'f1cbf82e-a285-4a15-a172-ff97732a2648', b'1', '${role_create-client}', 'create-client', 'master', 'f1cbf82e-a285-4a15-a172-ff97732a2648', NULL),
('62880c1c-3e64-48fa-902f-fa8354347ab8', 'cibmtr-bioinformatics-realm', b'0', 'Realm Global Role for Comon Users Registered Profile.', 'BASIC_REGISTERED_GLOBAL_ROLE', 'cibmtr-bioinformatics-realm', NULL, 'cibmtr-bioinformatics-realm'),
('631e9bda-5884-47b8-b0d6-838e2ce5002a', 'f1cbf82e-a285-4a15-a172-ff97732a2648', b'1', '${role_manage-authorization}', 'manage-authorization', 'master', 'f1cbf82e-a285-4a15-a172-ff97732a2648', NULL),
('6a80905b-a478-4508-ad14-34cf340aca3e', '1cdadc8e-1773-47bc-9c01-875f84ea25ec', b'1', '${role_view-identity-providers}', 'view-identity-providers', 'master', '1cdadc8e-1773-47bc-9c01-875f84ea25ec', NULL),
('6c47d98c-a723-4053-8e87-762c04a3c72f', '1eabef67-6473-4ba8-b07c-14bdbae4aaed', b'1', 'Client Role for System Administrators Profile.', '01_SYSTEM_ADMINISTRATOR_CLIENT_ROLE', 'cibmtr-bioinformatics-realm', '1eabef67-6473-4ba8-b07c-14bdbae4aaed', NULL),
('6c8abaad-5f92-4c96-843b-65fa9442893c', 'f1cbf82e-a285-4a15-a172-ff97732a2648', b'1', '${role_manage-clients}', 'manage-clients', 'master', 'f1cbf82e-a285-4a15-a172-ff97732a2648', NULL),
('6ceaaca5-30a4-444b-9078-723b7cc13591', '98ae8603-4547-4218-8fb9-ebc550a0e10b', b'1', NULL, 'uma_protection', 'cibmtr-bioinformatics-realm', '98ae8603-4547-4218-8fb9-ebc550a0e10b', NULL),
('6e9c2f6c-209f-407f-b3ca-514fe7f823a8', 'master', b'0', '${role_admin}', 'admin', 'master', NULL, 'master'),
('751e44ac-04c7-4a95-805c-f907f205c48a', '1cdadc8e-1773-47bc-9c01-875f84ea25ec', b'1', '${role_manage-realm}', 'manage-realm', 'master', '1cdadc8e-1773-47bc-9c01-875f84ea25ec', NULL),
('76a4f31d-7149-4d92-bfba-654c2cb6c754', '1eabef67-6473-4ba8-b07c-14bdbae4aaed', b'1', 'Client Role for Reviewers Profile.', '03_REVIEWER_CLIENT_ROLE', 'cibmtr-bioinformatics-realm', '1eabef67-6473-4ba8-b07c-14bdbae4aaed', NULL),
('7d14203c-2cb4-4d49-8bb3-c56d425e9db1', 'f1cbf82e-a285-4a15-a172-ff97732a2648', b'1', '${role_query-realms}', 'query-realms', 'master', 'f1cbf82e-a285-4a15-a172-ff97732a2648', NULL),
('8018bd1e-0b43-4b0c-8e5a-fbf31f8ee6db', '48fb7988-d909-445a-81db-fe825dca0db2', b'1', '${role_query-groups}', 'query-groups', 'cibmtr-bioinformatics-realm', '48fb7988-d909-445a-81db-fe825dca0db2', NULL),
('84752518-6f2f-451f-ab59-de3ce6674ba1', '48fb7988-d909-445a-81db-fe825dca0db2', b'1', '${role_view-users}', 'view-users', 'cibmtr-bioinformatics-realm', '48fb7988-d909-445a-81db-fe825dca0db2', NULL),
('8612f4fc-b1fd-43af-8ff8-193a62225bcf', '1eabef67-6473-4ba8-b07c-14bdbae4aaed', b'1', 'Client Role for External Applications that consume the PhyCuS API\'s Profile.', '99_API_CONSUMERS_APP_CLIENT_ROLE', 'cibmtr-bioinformatics-realm', '1eabef67-6473-4ba8-b07c-14bdbae4aaed', NULL),
('8b2aacae-a622-446c-9954-a8de983150f0', '1cdadc8e-1773-47bc-9c01-875f84ea25ec', b'1', '${role_query-groups}', 'query-groups', 'master', '1cdadc8e-1773-47bc-9c01-875f84ea25ec', NULL),
('8d650dc2-d0e7-4ad7-8193-3ce1b7361b02', 'e07da50b-cddc-4524-b630-436a5a6ba8ab', b'1', '${role_manage-account-links}', 'manage-account-links', 'cibmtr-bioinformatics-realm', 'e07da50b-cddc-4524-b630-436a5a6ba8ab', NULL),
('8fdff21b-f46c-407c-b566-ce4fcc4c51d4', '48fb7988-d909-445a-81db-fe825dca0db2', b'1', '${role_view-authorization}', 'view-authorization', 'cibmtr-bioinformatics-realm', '48fb7988-d909-445a-81db-fe825dca0db2', NULL),
('91f398b2-23a0-4cd3-8bc0-c3097df0e1e5', 'e07da50b-cddc-4524-b630-436a5a6ba8ab', b'1', '${role_view-consent}', 'view-consent', 'cibmtr-bioinformatics-realm', 'e07da50b-cddc-4524-b630-436a5a6ba8ab', NULL),
('9315172c-6dc1-4d8c-973a-4309599cf07b', 'f1cbf82e-a285-4a15-a172-ff97732a2648', b'1', '${role_query-groups}', 'query-groups', 'master', 'f1cbf82e-a285-4a15-a172-ff97732a2648', NULL),
('932ca70d-a311-42f9-9042-431cef835b9e', 'cibmtr-bioinformatics-realm', b'0', '${role_offline-access}', 'offline_access', 'cibmtr-bioinformatics-realm', NULL, 'cibmtr-bioinformatics-realm'),
('9398cf0f-6bd8-495b-b3e3-dea8e44872a9', 'bf8531b6-2a19-45e2-9a41-7a25d38ad69d', b'1', '${role_read-token}', 'read-token', 'master', 'bf8531b6-2a19-45e2-9a41-7a25d38ad69d', NULL),
('944d3748-9707-4ff3-95a6-4a6b6d34243b', 'f1cbf82e-a285-4a15-a172-ff97732a2648', b'1', '${role_manage-events}', 'manage-events', 'master', 'f1cbf82e-a285-4a15-a172-ff97732a2648', NULL),
('96c0124c-0f00-4769-8cd3-f7dfd74a0af3', 'cibmtr-bioinformatics-realm', b'0', '${role_uma_authorization}', 'uma_authorization', 'cibmtr-bioinformatics-realm', NULL, 'cibmtr-bioinformatics-realm'),
('9ce77c75-2e84-4d14-9655-706a2f3fc159', 'f7123f46-5de8-4c40-8cff-5c52b3e26a84', b'1', '${role_manage-account-links}', 'manage-account-links', 'master', 'f7123f46-5de8-4c40-8cff-5c52b3e26a84', NULL),
('9d7cc7b1-217f-47bd-9347-a3f141638576', '1cdadc8e-1773-47bc-9c01-875f84ea25ec', b'1', '${role_manage-users}', 'manage-users', 'master', '1cdadc8e-1773-47bc-9c01-875f84ea25ec', NULL),
('a1daea5c-dd4c-4528-bcfd-2922afc47cc0', 'f1cbf82e-a285-4a15-a172-ff97732a2648', b'1', '${role_view-realm}', 'view-realm', 'master', 'f1cbf82e-a285-4a15-a172-ff97732a2648', NULL),
('a29864c1-5a10-4c4d-82f7-72b6becb4416', 'f1cbf82e-a285-4a15-a172-ff97732a2648', b'1', '${role_manage-users}', 'manage-users', 'master', 'f1cbf82e-a285-4a15-a172-ff97732a2648', NULL),
('a2dae096-2824-42c2-854a-834d216991e7', 'f7123f46-5de8-4c40-8cff-5c52b3e26a84', b'1', '${role_view-applications}', 'view-applications', 'master', 'f7123f46-5de8-4c40-8cff-5c52b3e26a84', NULL),
('a374e2d8-5a96-4f06-bdeb-87d2d1fd92f2', '1eabef67-6473-4ba8-b07c-14bdbae4aaed', b'1', 'Client Role for MOTS Users Profile.', '06_MEMBERS_OF_THE_STREET_CLIENT_ROLE', 'cibmtr-bioinformatics-realm', '1eabef67-6473-4ba8-b07c-14bdbae4aaed', NULL),
('a3f9ba91-6ed5-47ff-a1cc-384c00cc203d', '48fb7988-d909-445a-81db-fe825dca0db2', b'1', '${role_impersonation}', 'impersonation', 'cibmtr-bioinformatics-realm', '48fb7988-d909-445a-81db-fe825dca0db2', NULL),
('a6174657-cbd7-40a6-ae34-c83cabdd1791', 'master', b'0', '${role_create-realm}', 'create-realm', 'master', NULL, 'master'),
('a91bfa14-c447-4159-9de1-64a51fbf2227', 'master', b'0', '${role_offline-access}', 'offline_access', 'master', NULL, 'master'),
('aebcd69a-6a42-4790-9d80-6ad44be3f0e3', 'f7123f46-5de8-4c40-8cff-5c52b3e26a84', b'1', '${role_view-profile}', 'view-profile', 'master', 'f7123f46-5de8-4c40-8cff-5c52b3e26a84', NULL),
('b6e3d2e0-ba1a-4420-84d1-2cf72096fd38', 'f7123f46-5de8-4c40-8cff-5c52b3e26a84', b'1', '${role_manage-account}', 'manage-account', 'master', 'f7123f46-5de8-4c40-8cff-5c52b3e26a84', NULL),
('b8fb8449-0975-425e-abe9-edcf6bfcdc9a', '1cdadc8e-1773-47bc-9c01-875f84ea25ec', b'1', '${role_manage-authorization}', 'manage-authorization', 'master', '1cdadc8e-1773-47bc-9c01-875f84ea25ec', NULL),
('c6ceaf7a-8a48-45d6-99b0-99665a2e4136', '1cdadc8e-1773-47bc-9c01-875f84ea25ec', b'1', '${role_manage-events}', 'manage-events', 'master', '1cdadc8e-1773-47bc-9c01-875f84ea25ec', NULL),
('c9fb6965-e734-46b4-a174-fa9d1fb7e1cc', '48fb7988-d909-445a-81db-fe825dca0db2', b'1', '${role_manage-events}', 'manage-events', 'cibmtr-bioinformatics-realm', '48fb7988-d909-445a-81db-fe825dca0db2', NULL),
('caa9819c-d584-4d06-aeee-f0e6bcbc8f7c', '1eabef67-6473-4ba8-b07c-14bdbae4aaed', b'1', NULL, 'uma_protection', 'cibmtr-bioinformatics-realm', '1eabef67-6473-4ba8-b07c-14bdbae4aaed', NULL),
('d0e1cd3e-97c6-4d95-9e8e-82672d651bc3', '1cdadc8e-1773-47bc-9c01-875f84ea25ec', b'1', '${role_query-clients}', 'query-clients', 'master', '1cdadc8e-1773-47bc-9c01-875f84ea25ec', NULL),
('d810cfe5-f254-4e37-8b9a-0922ebd84a27', 'f1cbf82e-a285-4a15-a172-ff97732a2648', b'1', '${role_view-clients}', 'view-clients', 'master', 'f1cbf82e-a285-4a15-a172-ff97732a2648', NULL),
('dfb5d699-91ee-4938-8991-618fecf0aaba', 'f1cbf82e-a285-4a15-a172-ff97732a2648', b'1', '${role_impersonation}', 'impersonation', 'master', 'f1cbf82e-a285-4a15-a172-ff97732a2648', NULL),
('dfebf1c8-3fb6-4b78-9b05-ae9dd4ff92be', '1cdadc8e-1773-47bc-9c01-875f84ea25ec', b'1', '${role_view-realm}', 'view-realm', 'master', '1cdadc8e-1773-47bc-9c01-875f84ea25ec', NULL),
('e1481a47-36c4-42e2-b55c-fcf0e0395af2', '1cdadc8e-1773-47bc-9c01-875f84ea25ec', b'1', '${role_impersonation}', 'impersonation', 'master', '1cdadc8e-1773-47bc-9c01-875f84ea25ec', NULL),
('e58b182a-9ca9-4135-9562-d5493bcf26cc', '1cdadc8e-1773-47bc-9c01-875f84ea25ec', b'1', '${role_query-realms}', 'query-realms', 'master', '1cdadc8e-1773-47bc-9c01-875f84ea25ec', NULL),
('f6e211bd-443d-47fe-9888-ed50e6463eaa', 'f1cbf82e-a285-4a15-a172-ff97732a2648', b'1', '${role_view-identity-providers}', 'view-identity-providers', 'master', 'f1cbf82e-a285-4a15-a172-ff97732a2648', NULL),
('f793ecc6-713f-4630-8777-90c5f45a504a', 'f1cbf82e-a285-4a15-a172-ff97732a2648', b'1', '${role_view-users}', 'view-users', 'master', 'f1cbf82e-a285-4a15-a172-ff97732a2648', NULL),
('f909e7c2-1f7d-4dc4-b0ca-bdfc8d1f7b2c', '1cdadc8e-1773-47bc-9c01-875f84ea25ec', b'1', '${role_view-users}', 'view-users', 'master', '1cdadc8e-1773-47bc-9c01-875f84ea25ec', NULL),
('fa28bdd3-33ed-4a5a-a09f-6561fce814e5', 'f7123f46-5de8-4c40-8cff-5c52b3e26a84', b'1', '${role_view-consent}', 'view-consent', 'master', 'f7123f46-5de8-4c40-8cff-5c52b3e26a84', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `migration_model`
--

DROP TABLE IF EXISTS `migration_model`;
CREATE TABLE IF NOT EXISTS `migration_model` (
  `ID` varchar(36) NOT NULL,
  `VERSION` varchar(36) DEFAULT NULL,
  `UPDATE_TIME` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `IDX_UPDATE_TIME` (`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `migration_model`
--

INSERT INTO `migration_model` (`ID`, `VERSION`, `UPDATE_TIME`) VALUES
('ry3cm', '9.0.0', 1584832555);

-- --------------------------------------------------------

--
-- Estrutura da tabela `offline_client_session`
--

DROP TABLE IF EXISTS `offline_client_session`;
CREATE TABLE IF NOT EXISTS `offline_client_session` (
  `USER_SESSION_ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) NOT NULL,
  `OFFLINE_FLAG` varchar(4) NOT NULL,
  `TIMESTAMP` int DEFAULT NULL,
  `DATA` longtext,
  `CLIENT_STORAGE_PROVIDER` varchar(36) NOT NULL DEFAULT 'local',
  `EXTERNAL_CLIENT_ID` varchar(255) NOT NULL DEFAULT 'local',
  PRIMARY KEY (`USER_SESSION_ID`,`CLIENT_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`,`OFFLINE_FLAG`),
  KEY `IDX_US_SESS_ID_ON_CL_SESS` (`USER_SESSION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `offline_client_session`
--

INSERT INTO `offline_client_session` (`USER_SESSION_ID`, `CLIENT_ID`, `OFFLINE_FLAG`, `TIMESTAMP`, `DATA`, `CLIENT_STORAGE_PROVIDER`, `EXTERNAL_CLIENT_ID`) VALUES
('0200c7a9-c637-4524-825a-d2ee22197df6', '1eabef67-6473-4ba8-b07c-14bdbae4aaed', '1', 1585062949, '{\"authMethod\":\"openid-connect\",\"redirectUri\":\"http://localhost:8080/phycusApp/login/oauth2/code/oidc\",\"notes\":{\"scope\":\"openid address email microprofile-jwt offline_access phone PhycusSHFCClientScopeClaims01 profile roles web-origins\",\"iss\":\"http://localhost:9080/auth/realms/CIBMTR-BioInformatics-Realm\",\"response_type\":\"code\",\"redirect_uri\":\"http://localhost:8080/phycusApp/login/oauth2/code/oidc\",\"state\":\"CAO7GnsvZGchKGPuq-WLPuHqQGzxeajqzALbOEQp9xw=\",\"nonce\":\"aY_byk4GGFTV-cFobkK3EHvezWWpjCQMa4kQ5Zefm5U\"}}', 'local', 'local'),
('1e495e8c-d347-4392-bdce-2d2816a64291', '1eabef67-6473-4ba8-b07c-14bdbae4aaed', '1', 1585079866, '{\"authMethod\":\"openid-connect\",\"redirectUri\":\"http://172.17.0.1:8080/phycusApp/login/oauth2/code/oidc\",\"notes\":{\"scope\":\"openid address email microprofile-jwt offline_access phone PhycusSHFCClientScopeClaims01 profile roles web-origins\",\"iss\":\"http://localhost:9080/auth/realms/CIBMTR-BioInformatics-Realm\",\"response_type\":\"code\",\"redirect_uri\":\"http://172.17.0.1:8080/phycusApp/login/oauth2/code/oidc\",\"state\":\"FoCm8eYvNqQ8SPOU_LosHlKKwF7NORS-mUyAp9Keozg=\",\"nonce\":\"ojQb0iZGUXgrypVP5P-FtwNFE987rA4xTRCD4YsG1bM\"}}', 'local', 'local'),
('293185d3-65ad-4f7b-b0a7-f2e5156fa08c', '1eabef67-6473-4ba8-b07c-14bdbae4aaed', '1', 1585086919, '{\"authMethod\":\"openid-connect\",\"redirectUri\":\"http://172.17.0.1:8080/phycusApp/login/oauth2/code/oidc\",\"notes\":{\"scope\":\"openid address email microprofile-jwt offline_access phone PhycusSHFCClientScopeClaims01 profile roles web-origins\",\"iss\":\"http://localhost:9080/auth/realms/CIBMTR-BioInformatics-Realm\",\"response_type\":\"code\",\"redirect_uri\":\"http://172.17.0.1:8080/phycusApp/login/oauth2/code/oidc\",\"state\":\"iK6g9stekB4QSBRtuYNZigSqOe7KlXNm3KAR5usBBes=\",\"nonce\":\"cQpt9iGZekkf-FUSEJfz6VEXruEYxNqFfO5gjf9VCog\"}}', 'local', 'local'),
('2a029388-f29a-449e-8376-5b3050777727', '1eabef67-6473-4ba8-b07c-14bdbae4aaed', '1', 1585069091, '{\"authMethod\":\"openid-connect\",\"redirectUri\":\"http://172.17.0.1:8080/phycusApp/login/oauth2/code/oidc\",\"notes\":{\"scope\":\"openid address email microprofile-jwt offline_access phone PhycusSHFCClientScopeClaims01 profile roles web-origins\",\"iss\":\"http://localhost:9080/auth/realms/CIBMTR-BioInformatics-Realm\",\"response_type\":\"code\",\"redirect_uri\":\"http://172.17.0.1:8080/phycusApp/login/oauth2/code/oidc\",\"state\":\"w-7fStHXxt7zNI_bfidBBoBrvj3uKdVKf8hN31BqfsA=\",\"nonce\":\"A1dIrAlg0MX7TWdEq9dDyi0gs2Bu9aIIeQGaR3MBcfs\"}}', 'local', 'local'),
('34015ca0-9c6d-4882-9d26-4b805f50395f', '1eabef67-6473-4ba8-b07c-14bdbae4aaed', '1', 1585064547, '{\"authMethod\":\"openid-connect\",\"redirectUri\":\"http://localhost:8080/phycusApp/login/oauth2/code/oidc\",\"notes\":{\"scope\":\"openid address email microprofile-jwt offline_access phone PhycusSHFCClientScopeClaims01 profile roles web-origins\",\"iss\":\"http://localhost:9080/auth/realms/CIBMTR-BioInformatics-Realm\",\"response_type\":\"code\",\"redirect_uri\":\"http://localhost:8080/phycusApp/login/oauth2/code/oidc\",\"state\":\"0mXa5RhiuT7bDOI0XbV_DeJOoNrp71KY31tAOr_orEc=\",\"nonce\":\"_wqGYZjeQKxbg-az6ZYneX2Pu8pQyYeFO0loAKJe28g\"}}', 'local', 'local'),
('390ddfd3-f63a-4020-9388-28de4cbe50e6', '1eabef67-6473-4ba8-b07c-14bdbae4aaed', '1', 1585007169, '{\"authMethod\":\"openid-connect\",\"redirectUri\":\"http://localhost:8080/phycusApp/login/oauth2/code/oidc\",\"notes\":{\"scope\":\"openid address email microprofile-jwt offline_access phone PhycusSHFCClientScopeClaims01 profile roles web-origins\",\"iss\":\"http://localhost:9080/auth/realms/CIBMTR-BioInformatics-Realm\",\"response_type\":\"code\",\"redirect_uri\":\"http://localhost:8080/phycusApp/login/oauth2/code/oidc\",\"state\":\"WnbKRu0S_vXL78oWYaHIhE4NUHKxWdMjmklikN0Ta-U=\",\"nonce\":\"s4jkzBVXADqOKw61nzwt5AecZ90MnK3Zyh6utTDQRaY\"}}', 'local', 'local'),
('3a44ee6a-ab54-444a-99a0-6dc847edbaaa', '1eabef67-6473-4ba8-b07c-14bdbae4aaed', '1', 1585088765, '{\"authMethod\":\"openid-connect\",\"redirectUri\":\"http://172.17.0.1:8080/phycusApp/login/oauth2/code/oidc\",\"notes\":{\"scope\":\"openid address email microprofile-jwt offline_access phone PhycusSHFCClientScopeClaims01 profile roles web-origins\",\"SSO_AUTH\":\"true\",\"iss\":\"http://localhost:9080/auth/realms/CIBMTR-BioInformatics-Realm\",\"response_type\":\"code\",\"redirect_uri\":\"http://172.17.0.1:8080/phycusApp/login/oauth2/code/oidc\",\"state\":\"Pm4F5JbvVAIXrf6bdvoVahwpSwwAjVeq2XdKR8prnPI=\",\"nonce\":\"LuuR4jm1WPjnC2v0pUcRcqP2698lB6KdcPOBETmVIVk\"}}', 'local', 'local'),
('4639c4c1-568c-4929-b789-7ae809e7490a', '1eabef67-6473-4ba8-b07c-14bdbae4aaed', '1', 1585089121, '{\"authMethod\":\"openid-connect\",\"redirectUri\":\"http://172.17.0.1:8080/phycusApp/login/oauth2/code/oidc\",\"notes\":{\"scope\":\"openid address email microprofile-jwt offline_access phone PhycusSHFCClientScopeClaims01 profile roles web-origins\",\"iss\":\"http://localhost:9080/auth/realms/CIBMTR-BioInformatics-Realm\",\"response_type\":\"code\",\"redirect_uri\":\"http://172.17.0.1:8080/phycusApp/login/oauth2/code/oidc\",\"state\":\"yI9Q1kHPZpoR9vmTe0fj1y9FedM5yqzVeprjt4irw-Y=\",\"nonce\":\"COUHFVg06xaFhkJwQ7QArJG3rgaIfa2BYszkf_GcmLY\"}}', 'local', 'local'),
('5fa4353e-df74-40bd-9a13-24398fe6a050', '1eabef67-6473-4ba8-b07c-14bdbae4aaed', '1', 1585070265, '{\"authMethod\":\"openid-connect\",\"redirectUri\":\"http://172.17.0.1:8080/phycusApp/login/oauth2/code/oidc\",\"notes\":{\"scope\":\"openid address email microprofile-jwt offline_access phone PhycusSHFCClientScopeClaims01 profile roles web-origins\",\"iss\":\"http://localhost:9080/auth/realms/CIBMTR-BioInformatics-Realm\",\"response_type\":\"code\",\"redirect_uri\":\"http://172.17.0.1:8080/phycusApp/login/oauth2/code/oidc\",\"state\":\"Ou57BUtDC1SqJEcN23guOcg5DMadMukZ8uE2gaoWNsk=\",\"nonce\":\"6ffFqpggIgZDv2FfdeM3gBR5g94vTkDVL-t_EagO3iE\"}}', 'local', 'local'),
('62a49c30-5974-4a53-9bbd-dcd8249009bc', '1eabef67-6473-4ba8-b07c-14bdbae4aaed', '1', 1584999117, '{\"authMethod\":\"openid-connect\",\"redirectUri\":\"http://localhost:8080/phycusApp/login/oauth2/code/oidc\",\"notes\":{\"scope\":\"openid address email microprofile-jwt offline_access phone PhycusSHFCClientScopeClaims01 profile roles web-origins\",\"iss\":\"http://localhost:9080/auth/realms/CIBMTR-BioInformatics-Realm\",\"response_type\":\"code\",\"redirect_uri\":\"http://localhost:8080/phycusApp/login/oauth2/code/oidc\",\"state\":\"z0xkHCwRPFtacImxfk73FWMNmcosWAKkEJYkB2crN90=\",\"nonce\":\"5I780qAuDFK5jjIgienNbrT1XSeqqb7-MCDpbA0GJ2E\"}}', 'local', 'local'),
('71698e35-ff14-448e-a313-ba47a4329927', '1eabef67-6473-4ba8-b07c-14bdbae4aaed', '1', 1585086505, '{\"authMethod\":\"openid-connect\",\"redirectUri\":\"http://172.17.0.1:8080/phycusApp/login/oauth2/code/oidc\",\"notes\":{\"scope\":\"openid address email microprofile-jwt offline_access phone PhycusSHFCClientScopeClaims01 profile roles web-origins\",\"iss\":\"http://localhost:9080/auth/realms/CIBMTR-BioInformatics-Realm\",\"response_type\":\"code\",\"redirect_uri\":\"http://172.17.0.1:8080/phycusApp/login/oauth2/code/oidc\",\"state\":\"-ySOlYiSMG51hFf0PtvrdIAeXXHJDOsg5aFBpjUfp5w=\",\"nonce\":\"O4ldbCV2esf8JOXRQCfkzhTDPuE0iVy5EY7NcQv6qEY\"}}', 'local', 'local'),
('73195a83-5593-4052-a47e-dc3c03ee31d0', '1eabef67-6473-4ba8-b07c-14bdbae4aaed', '1', 1585084950, '{\"authMethod\":\"openid-connect\",\"redirectUri\":\"http://172.17.0.1:8080/phycusApp/login/oauth2/code/oidc\",\"notes\":{\"scope\":\"openid address email microprofile-jwt offline_access phone PhycusSHFCClientScopeClaims01 profile roles web-origins\",\"iss\":\"http://localhost:9080/auth/realms/CIBMTR-BioInformatics-Realm\",\"response_type\":\"code\",\"redirect_uri\":\"http://172.17.0.1:8080/phycusApp/login/oauth2/code/oidc\",\"state\":\"aMpwtfpZ9KbS5M4whm1gyCFbjWdYB9dw5ntKBGyUI7M=\",\"nonce\":\"dag_pM-pz_hPkH08YJKBu_Nsg79vUtqdMY52fWMH-RM\"}}', 'local', 'local'),
('76277c4e-c122-4b83-b146-5fa07ce45f02', '1eabef67-6473-4ba8-b07c-14bdbae4aaed', '1', 1585087553, '{\"authMethod\":\"openid-connect\",\"redirectUri\":\"http://172.17.0.1:8080/phycusApp/login/oauth2/code/oidc\",\"notes\":{\"scope\":\"openid address email microprofile-jwt offline_access phone PhycusSHFCClientScopeClaims01 profile roles web-origins\",\"iss\":\"http://localhost:9080/auth/realms/CIBMTR-BioInformatics-Realm\",\"response_type\":\"code\",\"redirect_uri\":\"http://172.17.0.1:8080/phycusApp/login/oauth2/code/oidc\",\"state\":\"xut7E6DFDECidbfgczcZDjxul08IFAc1V1Xvxxa3fMg=\",\"nonce\":\"jOPneuSRTDIgDCmgoCrDUDAQJtwojnsIFKmd8gGGwBo\"}}', 'local', 'local'),
('7c0a4324-208a-4b34-8cc4-8584870761f4', '1eabef67-6473-4ba8-b07c-14bdbae4aaed', '1', 1585087157, '{\"authMethod\":\"openid-connect\",\"redirectUri\":\"http://172.17.0.1:8080/phycusApp/login/oauth2/code/oidc\",\"notes\":{\"scope\":\"openid address email microprofile-jwt offline_access phone PhycusSHFCClientScopeClaims01 profile roles web-origins\",\"iss\":\"http://localhost:9080/auth/realms/CIBMTR-BioInformatics-Realm\",\"response_type\":\"code\",\"redirect_uri\":\"http://172.17.0.1:8080/phycusApp/login/oauth2/code/oidc\",\"state\":\"0iO5Q2eqIyYbkPXKSTbEdKQLmVLdrXgo5bPjUcEx6ts=\",\"nonce\":\"QZN_o1mxv3suSnypOtyLEZJ76Q0V8RIWzwP7FQwNCGk\"}}', 'local', 'local'),
('7cb8acc3-1102-4418-87f3-a5ace6c19724', '1eabef67-6473-4ba8-b07c-14bdbae4aaed', '1', 1584995019, '{\"authMethod\":\"openid-connect\",\"redirectUri\":\"http://localhost:8080/login/oauth2/code/oidc\",\"notes\":{\"scope\":\"openid address email microprofile-jwt offline_access phone PhycusSHFCClientScopeClaims01 profile roles web-origins\",\"iss\":\"http://localhost:9080/auth/realms/CIBMTR-BioInformatics-Realm\",\"response_type\":\"code\",\"redirect_uri\":\"http://localhost:8080/login/oauth2/code/oidc\",\"state\":\"lWWUFQIcMKJ5bkCKtJsNyzAJ6zh5HwwLw07whrXpSic=\",\"nonce\":\"uR5o64hXXarjKUN-XLxyysPEUDzSYf81NpzwImqL4hk\"}}', 'local', 'local'),
('874da1bc-d669-4ac2-b453-495ed3ca52b8', '1eabef67-6473-4ba8-b07c-14bdbae4aaed', '1', 1584995563, '{\"authMethod\":\"openid-connect\",\"redirectUri\":\"http://localhost:8080/login/oauth2/code/oidc\",\"notes\":{\"scope\":\"openid address email microprofile-jwt offline_access phone PhycusSHFCClientScopeClaims01 profile roles web-origins\",\"iss\":\"http://localhost:9080/auth/realms/CIBMTR-BioInformatics-Realm\",\"response_type\":\"code\",\"redirect_uri\":\"http://localhost:8080/login/oauth2/code/oidc\",\"state\":\"lbVt4ok9oYzIQYAF8Z4qjHH1HBBaCFR3B7SfvNjscj0=\",\"nonce\":\"xEHFMpExWADHpHbSjHa2V1eM7unEmNtQL1lhqTmeStY\"}}', 'local', 'local'),
('8d1b4374-6bb8-4cbc-9fc7-e0c8dbf27973', '1eabef67-6473-4ba8-b07c-14bdbae4aaed', '1', 1584997468, '{\"authMethod\":\"openid-connect\",\"redirectUri\":\"http://localhost:8080/phycusApp/login/oauth2/code/oidc\",\"notes\":{\"scope\":\"openid address email microprofile-jwt offline_access phone PhycusSHFCClientScopeClaims01 profile roles web-origins\",\"iss\":\"http://localhost:9080/auth/realms/CIBMTR-BioInformatics-Realm\",\"response_type\":\"code\",\"redirect_uri\":\"http://localhost:8080/phycusApp/login/oauth2/code/oidc\",\"state\":\"6cev2yml2LOMe12oe3eqdFAU_cEK3TNUC3yhqN9pg2g=\",\"nonce\":\"GGZhhxjrbXEVlRFuEvLeswCKSlclV0fe9tF8hX6IGOk\"}}', 'local', 'local'),
('c501765a-cd82-4d54-8130-e9d529ed970c', '1eabef67-6473-4ba8-b07c-14bdbae4aaed', '1', 1585089591, '{\"authMethod\":\"openid-connect\",\"redirectUri\":\"http://172.17.0.1:8080/phycusApp/login/oauth2/code/oidc\",\"notes\":{\"scope\":\"openid address email microprofile-jwt offline_access phone PhycusSHFCClientScopeClaims01 profile roles web-origins\",\"iss\":\"http://localhost:9080/auth/realms/CIBMTR-BioInformatics-Realm\",\"response_type\":\"code\",\"redirect_uri\":\"http://172.17.0.1:8080/phycusApp/login/oauth2/code/oidc\",\"state\":\"TFRQGaV5T4jZGhZEYRZ6mcpQCn7C4D_-qvj_iCLGLj4=\",\"nonce\":\"MHMrIaoeIel9tBi5QkaHhjmBQj5XT7YKPzvgSfyeDes\"}}', 'local', 'local'),
('d010eb8f-ee55-4971-abc6-908f5e75526e', '1eabef67-6473-4ba8-b07c-14bdbae4aaed', '1', 1585078987, '{\"authMethod\":\"openid-connect\",\"redirectUri\":\"http://172.17.0.1:8080/phycusApp/login/oauth2/code/oidc\",\"notes\":{\"scope\":\"openid address email microprofile-jwt offline_access phone PhycusSHFCClientScopeClaims01 profile roles web-origins\",\"iss\":\"http://localhost:9080/auth/realms/CIBMTR-BioInformatics-Realm\",\"response_type\":\"code\",\"redirect_uri\":\"http://172.17.0.1:8080/phycusApp/login/oauth2/code/oidc\",\"state\":\"nrkPDrqRkBea-3BqmtFIIIBs-r5cArHsZPtzCtDTALs=\",\"nonce\":\"fDCW8NdtaCS2AD8qXgZjddWqG4Pmv4VeyamI8Gb6zks\"}}', 'local', 'local'),
('d1e14e9b-ba0c-45a0-af1e-a425a400681e', '1eabef67-6473-4ba8-b07c-14bdbae4aaed', '1', 1585008742, '{\"authMethod\":\"openid-connect\",\"redirectUri\":\"http://localhost:8080/phycusApp/login/oauth2/code/oidc\",\"notes\":{\"scope\":\"openid address email microprofile-jwt offline_access phone PhycusSHFCClientScopeClaims01 profile roles web-origins\",\"iss\":\"http://localhost:9080/auth/realms/CIBMTR-BioInformatics-Realm\",\"response_type\":\"code\",\"redirect_uri\":\"http://localhost:8080/phycusApp/login/oauth2/code/oidc\",\"state\":\"R-CkQlaiNYypR-FOEe_xrcBS6kdtslAZup38Pe6DH_4=\",\"nonce\":\"VI8hc6j1UoHmSqK4XAAyYLepAcHIXUeQ25ZH4uXRbfI\"}}', 'local', 'local'),
('d940acbc-dbe3-41b7-b925-1377d94178c9', '1eabef67-6473-4ba8-b07c-14bdbae4aaed', '1', 1585077764, '{\"authMethod\":\"openid-connect\",\"redirectUri\":\"http://172.17.0.1:8080/phycusApp/login/oauth2/code/oidc\",\"notes\":{\"scope\":\"openid address email microprofile-jwt offline_access phone PhycusSHFCClientScopeClaims01 profile roles web-origins\",\"iss\":\"http://localhost:9080/auth/realms/CIBMTR-BioInformatics-Realm\",\"response_type\":\"code\",\"redirect_uri\":\"http://172.17.0.1:8080/phycusApp/login/oauth2/code/oidc\",\"state\":\"2A7QaAiw6V91bl_GSYtaI1Ky3y2FdnkbS2Gc5QmiLkM=\",\"nonce\":\"bxbZKDS6fD__vpvxmFRJZnFsq4MRcwOZ-NLsBFgifgk\"}}', 'local', 'local'),
('f13dfe28-c671-47f4-a46b-c6f0af9a1ce6', '1eabef67-6473-4ba8-b07c-14bdbae4aaed', '1', 1585081221, '{\"authMethod\":\"openid-connect\",\"redirectUri\":\"http://172.17.0.1:8080/phycusApp/login/oauth2/code/oidc\",\"notes\":{\"scope\":\"openid address email microprofile-jwt offline_access phone PhycusSHFCClientScopeClaims01 profile roles web-origins\",\"iss\":\"http://localhost:9080/auth/realms/CIBMTR-BioInformatics-Realm\",\"response_type\":\"code\",\"redirect_uri\":\"http://172.17.0.1:8080/phycusApp/login/oauth2/code/oidc\",\"state\":\"_RmUvkSpaLUzSH5cUp7C0QnaDRELXiu_igqMlzr0lEc=\",\"nonce\":\"VTCZpk0HlTBF82vCRp5D7lzTDJhRVPNXn_tegesCw_c\"}}', 'local', 'local'),
('f3c319c0-d68d-45b8-a7bc-2517c6b68e71', '1eabef67-6473-4ba8-b07c-14bdbae4aaed', '1', 1585086111, '{\"authMethod\":\"openid-connect\",\"redirectUri\":\"http://172.17.0.1:8080/phycusApp/login/oauth2/code/oidc\",\"notes\":{\"scope\":\"openid address email microprofile-jwt offline_access phone PhycusSHFCClientScopeClaims01 profile roles web-origins\",\"iss\":\"http://localhost:9080/auth/realms/CIBMTR-BioInformatics-Realm\",\"response_type\":\"code\",\"redirect_uri\":\"http://172.17.0.1:8080/phycusApp/login/oauth2/code/oidc\",\"state\":\"Ltm8O7FTfzyWLgoEE7nt23d7anhBkVFsHEjBm5_b_78=\",\"nonce\":\"qTDrUcBLa_toEfPp9GD8BMhAajLGuQguMvX9lpsJhuE\"}}', 'local', 'local');

-- --------------------------------------------------------

--
-- Estrutura da tabela `offline_user_session`
--

DROP TABLE IF EXISTS `offline_user_session`;
CREATE TABLE IF NOT EXISTS `offline_user_session` (
  `USER_SESSION_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `CREATED_ON` int NOT NULL,
  `OFFLINE_FLAG` varchar(4) NOT NULL,
  `DATA` longtext,
  `LAST_SESSION_REFRESH` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`USER_SESSION_ID`,`OFFLINE_FLAG`),
  KEY `IDX_OFFLINE_USS_CREATEDON` (`CREATED_ON`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `offline_user_session`
--

INSERT INTO `offline_user_session` (`USER_SESSION_ID`, `USER_ID`, `REALM_ID`, `CREATED_ON`, `OFFLINE_FLAG`, `DATA`, `LAST_SESSION_REFRESH`) VALUES
('0200c7a9-c637-4524-825a-d2ee22197df6', '688171b4-638a-43df-87c4-c5e85751346f', 'cibmtr-bioinformatics-realm', 1585062949, '1', '{\"ipAddress\":\"172.25.0.1\",\"authMethod\":\"openid-connect\",\"rememberMe\":false,\"started\":0,\"notes\":{\"KC_DEVICE_NOTE\":\"eyJpcEFkZHJlc3MiOiIxNzIuMjUuMC4xIiwib3MiOiJMaW51eCIsIm9zVmVyc2lvbiI6IlVua25vd24iLCJicm93c2VyIjoiQ2hyb21lLzgwLjAuMzk4NyIsImRldmljZSI6Ik90aGVyIiwibGFzdEFjY2VzcyI6MCwibW9iaWxlIjpmYWxzZX0=\",\"AUTH_TIME\":\"1585062949\"},\"state\":\"LOGGED_IN\"}', 1585063382),
('1e495e8c-d347-4392-bdce-2d2816a64291', '688171b4-638a-43df-87c4-c5e85751346f', 'cibmtr-bioinformatics-realm', 1585079866, '1', '{\"ipAddress\":\"172.25.0.1\",\"authMethod\":\"openid-connect\",\"rememberMe\":false,\"started\":0,\"notes\":{\"KC_DEVICE_NOTE\":\"eyJpcEFkZHJlc3MiOiIxNzIuMjUuMC4xIiwib3MiOiJMaW51eCIsIm9zVmVyc2lvbiI6IlVua25vd24iLCJicm93c2VyIjoiQ2hyb21lLzgwLjAuMzk4NyIsImRldmljZSI6Ik90aGVyIiwibGFzdEFjY2VzcyI6MCwibW9iaWxlIjpmYWxzZX0=\",\"AUTH_TIME\":\"1585079866\"},\"state\":\"LOGGED_IN\"}', 1585079859),
('293185d3-65ad-4f7b-b0a7-f2e5156fa08c', 'b3c1bfae-0a77-48a2-8dba-7b6559b8959f', 'cibmtr-bioinformatics-realm', 1585086919, '1', '{\"ipAddress\":\"172.25.0.1\",\"authMethod\":\"openid-connect\",\"rememberMe\":false,\"started\":0,\"notes\":{\"KC_DEVICE_NOTE\":\"eyJpcEFkZHJlc3MiOiIxNzIuMjUuMC4xIiwib3MiOiJMaW51eCIsIm9zVmVyc2lvbiI6IlVua25vd24iLCJicm93c2VyIjoiQ2hyb21lLzgwLjAuMzk4NyIsImRldmljZSI6Ik90aGVyIiwibGFzdEFjY2VzcyI6MCwibW9iaWxlIjpmYWxzZX0=\",\"AUTH_TIME\":\"1585086919\"},\"state\":\"LOGGED_IN\"}', 1585087060),
('2a029388-f29a-449e-8376-5b3050777727', 'c96b54e0-8164-4004-aec8-025f7af0838c', 'cibmtr-bioinformatics-realm', 1585069091, '1', '{\"ipAddress\":\"172.25.0.1\",\"authMethod\":\"openid-connect\",\"rememberMe\":false,\"started\":0,\"notes\":{\"KC_DEVICE_NOTE\":\"eyJpcEFkZHJlc3MiOiIxNzIuMjUuMC4xIiwib3MiOiJMaW51eCIsIm9zVmVyc2lvbiI6IlVua25vd24iLCJicm93c2VyIjoiQ2hyb21lLzgwLjAuMzk4NyIsImRldmljZSI6Ik90aGVyIiwibGFzdEFjY2VzcyI6MCwibW9iaWxlIjpmYWxzZX0=\",\"AUTH_TIME\":\"1585069091\"},\"state\":\"LOGGED_IN\"}', 1585069059),
('34015ca0-9c6d-4882-9d26-4b805f50395f', '688171b4-638a-43df-87c4-c5e85751346f', 'cibmtr-bioinformatics-realm', 1585064547, '1', '{\"ipAddress\":\"172.25.0.1\",\"authMethod\":\"openid-connect\",\"rememberMe\":false,\"started\":0,\"notes\":{\"KC_DEVICE_NOTE\":\"eyJpcEFkZHJlc3MiOiIxNzIuMjUuMC4xIiwib3MiOiJMaW51eCIsIm9zVmVyc2lvbiI6IlVua25vd24iLCJicm93c2VyIjoiQ2hyb21lLzgwLjAuMzk4NyIsImRldmljZSI6Ik90aGVyIiwibGFzdEFjY2VzcyI6MCwibW9iaWxlIjpmYWxzZX0=\",\"AUTH_TIME\":\"1585064547\"},\"state\":\"LOGGED_IN\"}', 1585064499),
('390ddfd3-f63a-4020-9388-28de4cbe50e6', 'b3c1bfae-0a77-48a2-8dba-7b6559b8959f', 'cibmtr-bioinformatics-realm', 1585007169, '1', '{\"ipAddress\":\"172.25.0.1\",\"authMethod\":\"openid-connect\",\"rememberMe\":false,\"started\":0,\"notes\":{\"KC_DEVICE_NOTE\":\"eyJpcEFkZHJlc3MiOiIxNzIuMjUuMC4xIiwib3MiOiJMaW51eCIsIm9zVmVyc2lvbiI6IlVua25vd24iLCJicm93c2VyIjoiQ2hyb21lLzgwLjAuMzk4NyIsImRldmljZSI6Ik90aGVyIiwibGFzdEFjY2VzcyI6MCwibW9iaWxlIjpmYWxzZX0=\",\"AUTH_TIME\":\"1585007169\"},\"state\":\"LOGGED_IN\"}', 1585007158),
('3a44ee6a-ab54-444a-99a0-6dc847edbaaa', 'b3c1bfae-0a77-48a2-8dba-7b6559b8959f', 'cibmtr-bioinformatics-realm', 1585088765, '1', '{\"ipAddress\":\"172.25.0.1\",\"authMethod\":\"openid-connect\",\"rememberMe\":false,\"started\":0,\"notes\":{\"KC_DEVICE_NOTE\":\"eyJpcEFkZHJlc3MiOiIxNzIuMjUuMC4xIiwib3MiOiJMaW51eCIsIm9zVmVyc2lvbiI6IlVua25vd24iLCJicm93c2VyIjoiQ2hyb21lLzgwLjAuMzk4NyIsImRldmljZSI6Ik90aGVyIiwibGFzdEFjY2VzcyI6MCwibW9iaWxlIjpmYWxzZX0=\",\"AUTH_TIME\":\"1585088752\"},\"state\":\"LOGGED_IN\"}', 1585088740),
('4639c4c1-568c-4929-b789-7ae809e7490a', 'b3c1bfae-0a77-48a2-8dba-7b6559b8959f', 'cibmtr-bioinformatics-realm', 1585089121, '1', '{\"ipAddress\":\"172.25.0.1\",\"authMethod\":\"openid-connect\",\"rememberMe\":false,\"started\":0,\"notes\":{\"KC_DEVICE_NOTE\":\"eyJpcEFkZHJlc3MiOiIxNzIuMjUuMC4xIiwib3MiOiJMaW51eCIsIm9zVmVyc2lvbiI6IlVua25vd24iLCJicm93c2VyIjoiQ2hyb21lLzgwLjAuMzk4NyIsImRldmljZSI6Ik90aGVyIiwibGFzdEFjY2VzcyI6MCwibW9iaWxlIjpmYWxzZX0=\",\"AUTH_TIME\":\"1585089121\"},\"state\":\"LOGGED_IN\"}', 1585089460),
('5fa4353e-df74-40bd-9a13-24398fe6a050', '688171b4-638a-43df-87c4-c5e85751346f', 'cibmtr-bioinformatics-realm', 1585070265, '1', '{\"ipAddress\":\"172.25.0.1\",\"authMethod\":\"openid-connect\",\"rememberMe\":false,\"started\":0,\"notes\":{\"KC_DEVICE_NOTE\":\"eyJpcEFkZHJlc3MiOiIxNzIuMjUuMC4xIiwib3MiOiJMaW51eCIsIm9zVmVyc2lvbiI6IlVua25vd24iLCJicm93c2VyIjoiQ2hyb21lLzgwLjAuMzk4NyIsImRldmljZSI6Ik90aGVyIiwibGFzdEFjY2VzcyI6MCwibW9iaWxlIjpmYWxzZX0=\",\"AUTH_TIME\":\"1585070265\"},\"state\":\"LOGGED_IN\"}', 1585070259),
('62a49c30-5974-4a53-9bbd-dcd8249009bc', '688171b4-638a-43df-87c4-c5e85751346f', 'cibmtr-bioinformatics-realm', 1584999117, '1', '{\"ipAddress\":\"172.25.0.1\",\"authMethod\":\"openid-connect\",\"rememberMe\":false,\"started\":0,\"notes\":{\"KC_DEVICE_NOTE\":\"eyJpcEFkZHJlc3MiOiIxNzIuMjUuMC4xIiwib3MiOiJMaW51eCIsIm9zVmVyc2lvbiI6IlVua25vd24iLCJicm93c2VyIjoiQ2hyb21lLzgwLjAuMzk4NyIsImRldmljZSI6Ik90aGVyIiwibGFzdEFjY2VzcyI6MCwibW9iaWxlIjpmYWxzZX0=\",\"AUTH_TIME\":\"1584999117\"},\"state\":\"LOGGED_IN\"}', 1584999178),
('71698e35-ff14-448e-a313-ba47a4329927', 'b3c1bfae-0a77-48a2-8dba-7b6559b8959f', 'cibmtr-bioinformatics-realm', 1585086505, '1', '{\"ipAddress\":\"172.25.0.1\",\"authMethod\":\"openid-connect\",\"rememberMe\":false,\"started\":0,\"notes\":{\"KC_DEVICE_NOTE\":\"eyJpcEFkZHJlc3MiOiIxNzIuMjUuMC4xIiwib3MiOiJMaW51eCIsIm9zVmVyc2lvbiI6IlVua25vd24iLCJicm93c2VyIjoiQ2hyb21lLzgwLjAuMzk4NyIsImRldmljZSI6Ik90aGVyIiwibGFzdEFjY2VzcyI6MCwibW9iaWxlIjpmYWxzZX0=\",\"AUTH_TIME\":\"1585086505\"},\"state\":\"LOGGED_IN\"}', 1585086520),
('73195a83-5593-4052-a47e-dc3c03ee31d0', '688171b4-638a-43df-87c4-c5e85751346f', 'cibmtr-bioinformatics-realm', 1585084950, '1', '{\"ipAddress\":\"172.25.0.1\",\"authMethod\":\"openid-connect\",\"rememberMe\":false,\"started\":0,\"notes\":{\"KC_DEVICE_NOTE\":\"eyJpcEFkZHJlc3MiOiIxNzIuMjUuMC4xIiwib3MiOiJMaW51eCIsIm9zVmVyc2lvbiI6IlVua25vd24iLCJicm93c2VyIjoiQ2hyb21lLzgwLjAuMzk4NyIsImRldmljZSI6Ik90aGVyIiwibGFzdEFjY2VzcyI6MCwibW9iaWxlIjpmYWxzZX0=\",\"AUTH_TIME\":\"1585084950\"},\"state\":\"LOGGED_IN\"}', 1585084900),
('76277c4e-c122-4b83-b146-5fa07ce45f02', 'b3c1bfae-0a77-48a2-8dba-7b6559b8959f', 'cibmtr-bioinformatics-realm', 1585087553, '1', '{\"ipAddress\":\"172.25.0.1\",\"authMethod\":\"openid-connect\",\"rememberMe\":false,\"started\":0,\"notes\":{\"KC_DEVICE_NOTE\":\"eyJpcEFkZHJlc3MiOiIxNzIuMjUuMC4xIiwib3MiOiJMaW51eCIsIm9zVmVyc2lvbiI6IlVua25vd24iLCJicm93c2VyIjoiQ2hyb21lLzgwLjAuMzk4NyIsImRldmljZSI6Ik90aGVyIiwibGFzdEFjY2VzcyI6MCwibW9iaWxlIjpmYWxzZX0=\",\"AUTH_TIME\":\"1585087553\"},\"state\":\"LOGGED_IN\"}', 1585087540),
('7c0a4324-208a-4b34-8cc4-8584870761f4', 'b3c1bfae-0a77-48a2-8dba-7b6559b8959f', 'cibmtr-bioinformatics-realm', 1585087157, '1', '{\"ipAddress\":\"172.25.0.1\",\"authMethod\":\"openid-connect\",\"rememberMe\":false,\"started\":0,\"notes\":{\"KC_DEVICE_NOTE\":\"eyJpcEFkZHJlc3MiOiIxNzIuMjUuMC4xIiwib3MiOiJMaW51eCIsIm9zVmVyc2lvbiI6IlVua25vd24iLCJicm93c2VyIjoiQ2hyb21lLzgwLjAuMzk4NyIsImRldmljZSI6Ik90aGVyIiwibGFzdEFjY2VzcyI6MCwibW9iaWxlIjpmYWxzZX0=\",\"AUTH_TIME\":\"1585087157\"},\"state\":\"LOGGED_IN\"}', 1585087300),
('7cb8acc3-1102-4418-87f3-a5ace6c19724', 'c96b54e0-8164-4004-aec8-025f7af0838c', 'cibmtr-bioinformatics-realm', 1584995019, '1', '{\"ipAddress\":\"172.25.0.1\",\"authMethod\":\"openid-connect\",\"rememberMe\":false,\"started\":0,\"notes\":{\"KC_DEVICE_NOTE\":\"eyJpcEFkZHJlc3MiOiIxNzIuMjUuMC4xIiwib3MiOiJMaW51eCIsIm9zVmVyc2lvbiI6IlVua25vd24iLCJicm93c2VyIjoiQ2hyb21lLzgwLjAuMzk4NyIsImRldmljZSI6Ik90aGVyIiwibGFzdEFjY2VzcyI6MCwibW9iaWxlIjpmYWxzZX0=\",\"AUTH_TIME\":\"1584995019\"},\"state\":\"LOGGED_IN\"}', 1584995277),
('874da1bc-d669-4ac2-b453-495ed3ca52b8', '4c973896-5761-41fc-8217-07c5d13a004b', 'cibmtr-bioinformatics-realm', 1584995563, '1', '{\"ipAddress\":\"172.25.0.1\",\"authMethod\":\"openid-connect\",\"rememberMe\":false,\"started\":0,\"notes\":{\"KC_DEVICE_NOTE\":\"eyJpcEFkZHJlc3MiOiIxNzIuMjUuMC4xIiwib3MiOiJMaW51eCIsIm9zVmVyc2lvbiI6IlVua25vd24iLCJicm93c2VyIjoiQ2hyb21lLzgwLjAuMzk4NyIsImRldmljZSI6Ik90aGVyIiwibGFzdEFjY2VzcyI6MCwibW9iaWxlIjpmYWxzZX0=\",\"AUTH_TIME\":\"1584995563\"},\"state\":\"LOGGED_IN\"}', 1584995517),
('8d1b4374-6bb8-4cbc-9fc7-e0c8dbf27973', 'c96b54e0-8164-4004-aec8-025f7af0838c', 'cibmtr-bioinformatics-realm', 1584997468, '1', '{\"ipAddress\":\"172.25.0.1\",\"authMethod\":\"openid-connect\",\"rememberMe\":false,\"started\":0,\"notes\":{\"KC_DEVICE_NOTE\":\"eyJpcEFkZHJlc3MiOiIxNzIuMjUuMC4xIiwib3MiOiJMaW51eCIsIm9zVmVyc2lvbiI6IlVua25vd24iLCJicm93c2VyIjoiQ2hyb21lLzgwLjAuMzk4NyIsImRldmljZSI6Ik90aGVyIiwibGFzdEFjY2VzcyI6MCwibW9iaWxlIjpmYWxzZX0=\",\"AUTH_TIME\":\"1584997468\"},\"state\":\"LOGGED_IN\"}', 1584998698),
('c501765a-cd82-4d54-8130-e9d529ed970c', 'b3c1bfae-0a77-48a2-8dba-7b6559b8959f', 'cibmtr-bioinformatics-realm', 1585089591, '1', '{\"ipAddress\":\"172.25.0.1\",\"authMethod\":\"openid-connect\",\"rememberMe\":false,\"started\":0,\"notes\":{\"KC_DEVICE_NOTE\":\"eyJpcEFkZHJlc3MiOiIxNzIuMjUuMC4xIiwib3MiOiJMaW51eCIsIm9zVmVyc2lvbiI6IlVua25vd24iLCJicm93c2VyIjoiQ2hyb21lLzgwLjAuMzk4NyIsImRldmljZSI6Ik90aGVyIiwibGFzdEFjY2VzcyI6MCwibW9iaWxlIjpmYWxzZX0=\",\"AUTH_TIME\":\"1585089591\"},\"state\":\"LOGGED_IN\"}', 1585089580),
('d010eb8f-ee55-4971-abc6-908f5e75526e', '688171b4-638a-43df-87c4-c5e85751346f', 'cibmtr-bioinformatics-realm', 1585078987, '1', '{\"ipAddress\":\"172.25.0.1\",\"authMethod\":\"openid-connect\",\"rememberMe\":false,\"started\":0,\"notes\":{\"KC_DEVICE_NOTE\":\"eyJpcEFkZHJlc3MiOiIxNzIuMjUuMC4xIiwib3MiOiJMaW51eCIsIm9zVmVyc2lvbiI6IlVua25vd24iLCJicm93c2VyIjoiQ2hyb21lLzgwLjAuMzk4NyIsImRldmljZSI6Ik90aGVyIiwibGFzdEFjY2VzcyI6MCwibW9iaWxlIjpmYWxzZX0=\",\"AUTH_TIME\":\"1585078987\"},\"state\":\"LOGGED_IN\"}', 1585078959),
('d1e14e9b-ba0c-45a0-af1e-a425a400681e', '688171b4-638a-43df-87c4-c5e85751346f', 'cibmtr-bioinformatics-realm', 1585008743, '1', '{\"ipAddress\":\"172.25.0.1\",\"authMethod\":\"openid-connect\",\"rememberMe\":false,\"started\":0,\"notes\":{\"KC_DEVICE_NOTE\":\"eyJpcEFkZHJlc3MiOiIxNzIuMjUuMC4xIiwib3MiOiJMaW51eCIsIm9zVmVyc2lvbiI6IlVua25vd24iLCJicm93c2VyIjoiQ2hyb21lLzgwLjAuMzk4NyIsImRldmljZSI6Ik90aGVyIiwibGFzdEFjY2VzcyI6MCwibW9iaWxlIjpmYWxzZX0=\",\"AUTH_TIME\":\"1585008742\"},\"state\":\"LOGGED_IN\"}', 1585009498),
('d940acbc-dbe3-41b7-b925-1377d94178c9', '688171b4-638a-43df-87c4-c5e85751346f', 'cibmtr-bioinformatics-realm', 1585077764, '1', '{\"ipAddress\":\"172.25.0.1\",\"authMethod\":\"openid-connect\",\"rememberMe\":false,\"started\":0,\"notes\":{\"KC_DEVICE_NOTE\":\"eyJpcEFkZHJlc3MiOiIxNzIuMjUuMC4xIiwib3MiOiJMaW51eCIsIm9zVmVyc2lvbiI6IlVua25vd24iLCJicm93c2VyIjoiQ2hyb21lLzgwLjAuMzk4NyIsImRldmljZSI6Ik90aGVyIiwibGFzdEFjY2VzcyI6MCwibW9iaWxlIjpmYWxzZX0=\",\"AUTH_TIME\":\"1585077764\"},\"state\":\"LOGGED_IN\"}', 1585077759),
('f13dfe28-c671-47f4-a46b-c6f0af9a1ce6', '688171b4-638a-43df-87c4-c5e85751346f', 'cibmtr-bioinformatics-realm', 1585081221, '1', '{\"ipAddress\":\"172.25.0.1\",\"authMethod\":\"openid-connect\",\"rememberMe\":false,\"started\":0,\"notes\":{\"KC_DEVICE_NOTE\":\"eyJpcEFkZHJlc3MiOiIxNzIuMjUuMC4xIiwib3MiOiJMaW51eCIsIm9zVmVyc2lvbiI6IlVua25vd24iLCJicm93c2VyIjoiQ2hyb21lLzgwLjAuMzk4NyIsImRldmljZSI6Ik90aGVyIiwibGFzdEFjY2VzcyI6MCwibW9iaWxlIjpmYWxzZX0=\",\"AUTH_TIME\":\"1585081221\"},\"state\":\"LOGGED_IN\"}', 1585084300),
('f3c319c0-d68d-45b8-a7bc-2517c6b68e71', 'b3c1bfae-0a77-48a2-8dba-7b6559b8959f', 'cibmtr-bioinformatics-realm', 1585086111, '1', '{\"ipAddress\":\"172.25.0.1\",\"authMethod\":\"openid-connect\",\"rememberMe\":false,\"started\":0,\"notes\":{\"KC_DEVICE_NOTE\":\"eyJpcEFkZHJlc3MiOiIxNzIuMjUuMC4xIiwib3MiOiJMaW51eCIsIm9zVmVyc2lvbiI6IlVua25vd24iLCJicm93c2VyIjoiQ2hyb21lLzgwLjAuMzk4NyIsImRldmljZSI6Ik90aGVyIiwibGFzdEFjY2VzcyI6MCwibW9iaWxlIjpmYWxzZX0=\",\"AUTH_TIME\":\"1585086111\"},\"state\":\"LOGGED_IN\"}', 1585086340);

-- --------------------------------------------------------

--
-- Estrutura da tabela `policy_config`
--

DROP TABLE IF EXISTS `policy_config`;
CREATE TABLE IF NOT EXISTS `policy_config` (
  `POLICY_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` longtext,
  PRIMARY KEY (`POLICY_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `policy_config`
--

INSERT INTO `policy_config` (`POLICY_ID`, `NAME`, `VALUE`) VALUES
('4b5c72cc-b8b8-4bfc-95ac-61815669f985', 'defaultResourceType', 'urn:internal:resources:default'),
('ad943211-dd2c-4784-92a3-7ad1c524169b', 'code', '// by default, grants any permission associated with this policy\n$evaluation.grant();\n'),
('d50a94d5-1756-434d-b110-4d53eece2e6d', 'defaultResourceType', 'urn:PhycusSHFCApp:resources:default'),
('ff09b194-0615-4cfd-9851-74adf540dabd', 'code', '// by default, grants any permission associated with this policy\n$evaluation.grant();\n');

-- --------------------------------------------------------

--
-- Estrutura da tabela `protocol_mapper`
--

DROP TABLE IF EXISTS `protocol_mapper`;
CREATE TABLE IF NOT EXISTS `protocol_mapper` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `PROTOCOL` varchar(255) NOT NULL,
  `PROTOCOL_MAPPER_NAME` varchar(255) NOT NULL,
  `CLIENT_ID` varchar(36) DEFAULT NULL,
  `CLIENT_SCOPE_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_PROTOCOL_MAPPER_CLIENT` (`CLIENT_ID`),
  KEY `IDX_CLSCOPE_PROTMAP` (`CLIENT_SCOPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `protocol_mapper`
--

INSERT INTO `protocol_mapper` (`ID`, `NAME`, `PROTOCOL`, `PROTOCOL_MAPPER_NAME`, `CLIENT_ID`, `CLIENT_SCOPE_ID`) VALUES
('013df1b5-9a5b-44f2-a0b6-5bf6d448556b', 'audience resolve', 'openid-connect', 'oidc-audience-resolve-mapper', '7b6ab455-242e-42aa-96d8-9c9e2b74da9d', NULL),
('09836b63-f171-4bf4-8d56-2e255286cf89', 'phone number verified', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '386b2097-465b-4135-a057-62709870909e'),
('0edb6930-0754-40f8-89a4-d92197c7ebe5', 'profile', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '38793860-edb1-452f-b2e0-e5ad2041cb70'),
('13158f91-ecf3-4fc4-b5ce-26d57a307d56', 'locale', 'openid-connect', 'oidc-usermodel-attribute-mapper', 'ab9a50dd-ef39-46cf-add0-af8ce9a00e61', NULL),
('134b3451-cf2d-4ead-8fce-bf24b32f014c', 'allowed web origins', 'openid-connect', 'oidc-allowed-origins-mapper', NULL, '84fdcb72-668b-408e-aaea-110d594afe5e'),
('14631b9c-83eb-48ab-a224-29f047015e52', 'username', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, 'd5de6a8a-8894-4e72-b6ef-f9bf3a7a6541'),
('19551b04-fc0c-44c4-b2bf-966da87ba3c3', 'given name', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, 'd5de6a8a-8894-4e72-b6ef-f9bf3a7a6541'),
('1ac09ef6-ab67-4379-b15a-5e54e50783be', 'groups', 'openid-connect', 'oidc-usermodel-realm-role-mapper', NULL, 'a72d436e-111b-445b-804a-967d249f6455'),
('1b1a1f44-66df-4670-badb-46a3d361ec7c', 'Client Host', 'openid-connect', 'oidc-usersessionmodel-note-mapper', '98ae8603-4547-4218-8fb9-ebc550a0e10b', NULL),
('1d522df5-9e2f-4c99-8fb6-4cbbb15ddc6e', 'audience resolve', 'openid-connect', 'oidc-audience-resolve-mapper', '3deba736-cf6f-44b8-8022-31f82347cc96', NULL),
('20b9eed0-fc6b-4c18-8ebc-87ea685a931e', 'website', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '38793860-edb1-452f-b2e0-e5ad2041cb70'),
('219532f1-3c5c-4b30-a018-ae99adb6fc87', 'birthdate', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'd5de6a8a-8894-4e72-b6ef-f9bf3a7a6541'),
('2412ad07-0d21-4fe2-9ec1-256f43a6cd10', 'groups', 'openid-connect', 'oidc-usermodel-realm-role-mapper', NULL, 'a749b2db-a1ac-4e58-9fd3-1142e96b0445'),
('26e5a3cc-095a-46b2-b56a-a5223e8f3789', 'picture', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '38793860-edb1-452f-b2e0-e5ad2041cb70'),
('2ccf435c-c255-4715-8dcd-15091f97c5a5', 'picture', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'd5de6a8a-8894-4e72-b6ef-f9bf3a7a6541'),
('2e7a64f5-dd48-45f7-8623-c5ba976b0eb2', 'birthdate', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '38793860-edb1-452f-b2e0-e5ad2041cb70'),
('30763567-fd72-4d9b-bf3a-454c38cfd901', 'address', 'openid-connect', 'oidc-address-mapper', NULL, '8dee153c-4e64-435f-8a7c-cd9de0eb653d'),
('3a1a19e1-bf24-4125-8c86-74b71050274b', 'locale', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '38793860-edb1-452f-b2e0-e5ad2041cb70'),
('3e1f0d91-a210-4dd7-af78-3b8d8cc2e244', 'Client ID', 'openid-connect', 'oidc-usersessionmodel-note-mapper', '1eabef67-6473-4ba8-b07c-14bdbae4aaed', NULL),
('408dc6b2-dc52-4ccf-814a-6639c95a7541', 'gender', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '38793860-edb1-452f-b2e0-e5ad2041cb70'),
('46513189-074c-4ba5-bfa7-29bae63faaaf', 'Client IP Address', 'openid-connect', 'oidc-usersessionmodel-note-mapper', '98ae8603-4547-4218-8fb9-ebc550a0e10b', NULL),
('48e1a9a5-f6de-4966-a948-d5b485fd2b46', 'updated at', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '38793860-edb1-452f-b2e0-e5ad2041cb70'),
('4e57380d-0cf4-416e-93d4-33f27a6b794e', 'phone number', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '386b2097-465b-4135-a057-62709870909e'),
('5a33d5e4-e124-412e-be4d-b6b28b41382a', 'family name', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, 'd5de6a8a-8894-4e72-b6ef-f9bf3a7a6541'),
('646e3a98-5f0c-4192-91f0-9719c295b278', 'langKey', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '3880d5d9-fced-4446-97fe-0434f2bb76ea'),
('65061407-001a-4820-87a6-7169d19558a1', 'nickname', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '38793860-edb1-452f-b2e0-e5ad2041cb70'),
('68f16c75-9a89-4e13-8b6b-12476f0e49fd', 'zoneinfo', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '38793860-edb1-452f-b2e0-e5ad2041cb70'),
('74840763-9b35-4c9a-8789-4008fedc26c2', 'phone number verified', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '0d3b55db-e68b-4c83-91d4-7370a6810a24'),
('76f898bc-70e4-4e0a-a259-ae4cb58260f9', 'email verified', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '39e1693b-a924-4fbb-b98c-520869771f83'),
('7b885963-e651-4b5d-94c7-4aa4aede723b', 'family name', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '38793860-edb1-452f-b2e0-e5ad2041cb70'),
('7cbb4477-af0c-4394-a754-b72a1b4638e0', 'role list', 'saml', 'saml-role-list-mapper', NULL, '391f1641-cb22-41a3-a0ed-752d9264aaf5'),
('90b1a715-e12e-4af8-89f6-82a370d57d1a', 'audience resolve', 'openid-connect', 'oidc-audience-resolve-mapper', NULL, '021d9ac1-9650-401c-b2a2-efa2f3e6b70c'),
('9271d821-b803-406d-8574-2f5a2693f065', 'realm roles', 'openid-connect', 'oidc-usermodel-realm-role-mapper', NULL, '021d9ac1-9650-401c-b2a2-efa2f3e6b70c'),
('974887a2-e14a-4afd-84fc-a848009079ae', 'Client ID', 'openid-connect', 'oidc-usersessionmodel-note-mapper', '98ae8603-4547-4218-8fb9-ebc550a0e10b', NULL),
('9a9feffe-7e4f-427a-ab14-053bd29b7ba3', 'username', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '38793860-edb1-452f-b2e0-e5ad2041cb70'),
('a91fbca6-9a49-4f64-a49a-608cc736608f', 'middle name', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '38793860-edb1-452f-b2e0-e5ad2041cb70'),
('a9d81dbc-06f1-491c-a4f9-4f2a70a696dd', 'client roles', 'openid-connect', 'oidc-usermodel-client-role-mapper', NULL, 'e3279721-a5de-46c7-b463-8d076a1631ae'),
('abfaa4cd-4bc1-4223-be5d-c56c641369f2', 'locale', 'openid-connect', 'oidc-usermodel-attribute-mapper', '0aa176c1-8d28-4a8b-8e97-7e4b49a289ff', NULL),
('ad47f393-3e6f-4516-9c20-5fd2e3b2b91f', 'given name', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '38793860-edb1-452f-b2e0-e5ad2041cb70'),
('b19404f1-5139-4505-9278-139cc8d41ba5', 'email verified', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, 'bd76f66d-85f6-44a6-ad5a-133b3f32016a'),
('b46b8e5e-5fea-441e-94a5-159ae7434211', 'realmRolesViaPhycusSHFCClientScopeClaims', 'openid-connect', 'oidc-usermodel-realm-role-mapper', NULL, '3880d5d9-fced-4446-97fe-0434f2bb76ea'),
('b60646cc-1344-47b1-86ad-d8b71e837edc', 'realm roles', 'openid-connect', 'oidc-usermodel-realm-role-mapper', NULL, 'e3279721-a5de-46c7-b463-8d076a1631ae'),
('b9a92105-8ca5-45d1-8a99-626255ac174f', 'address', 'openid-connect', 'oidc-address-mapper', NULL, '1dc1e050-891a-4f5b-ac9d-5ea0c2e3c05e'),
('bbbd7dc1-63d0-468f-9463-4772833ef2fa', 'client roles', 'openid-connect', 'oidc-usermodel-client-role-mapper', NULL, '021d9ac1-9650-401c-b2a2-efa2f3e6b70c'),
('bbc582f4-4749-42b8-9c65-71f4edfd3979', 'phone number', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '0d3b55db-e68b-4c83-91d4-7370a6810a24'),
('c4122959-6738-4883-b50a-acd0033a477a', 'profile', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'd5de6a8a-8894-4e72-b6ef-f9bf3a7a6541'),
('c422b63f-e809-41c2-854c-e801e8e25485', 'gender', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'd5de6a8a-8894-4e72-b6ef-f9bf3a7a6541'),
('c443f4cd-1174-49a7-a2b3-65d5ccde5efa', 'nickname', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'd5de6a8a-8894-4e72-b6ef-f9bf3a7a6541'),
('cedd1f1b-951a-4332-9fa1-2edf1a266283', 'middle name', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'd5de6a8a-8894-4e72-b6ef-f9bf3a7a6541'),
('d0933863-01a2-4c0f-83d0-7a6f25169cc0', 'clientRolesViaPhycusSHFCClientScopeClaims', 'openid-connect', 'oidc-usermodel-client-role-mapper', NULL, '3880d5d9-fced-4446-97fe-0434f2bb76ea'),
('d2a2e9a8-b105-4a8d-83bf-b9668ae0c1ce', 'audience resolve', 'openid-connect', 'oidc-audience-resolve-mapper', NULL, 'e3279721-a5de-46c7-b463-8d076a1631ae'),
('d34872aa-4054-41b6-a3fd-59ff8e743a5c', 'email', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, 'bd76f66d-85f6-44a6-ad5a-133b3f32016a'),
('d7db1b88-2c3c-419a-91cf-19ad13355a56', 'zoneinfo', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'd5de6a8a-8894-4e72-b6ef-f9bf3a7a6541'),
('db225b69-f493-47e7-bd59-2b5d0f9c5473', 'full name', 'openid-connect', 'oidc-full-name-mapper', NULL, '38793860-edb1-452f-b2e0-e5ad2041cb70'),
('dc1097e0-226d-4915-9004-4b229a95a80b', 'role list', 'saml', 'saml-role-list-mapper', NULL, '1c9c1b4c-ccb9-4e8f-82b7-5b3a4ac06229'),
('dec0c468-3c11-429b-844e-dfd632b20ba7', 'upn', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, 'a72d436e-111b-445b-804a-967d249f6455'),
('dfd19868-5c87-4a51-80e0-2a82dfabb16c', 'updated at', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'd5de6a8a-8894-4e72-b6ef-f9bf3a7a6541'),
('e348c7f8-e835-4539-a80b-b588510a82a9', 'email', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '39e1693b-a924-4fbb-b98c-520869771f83'),
('e7c536ca-1711-4ed5-9f21-20a25435f475', 'login', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '3880d5d9-fced-4446-97fe-0434f2bb76ea'),
('eb305ae4-1a75-4b4b-a803-b340f6e2cbf4', 'upn', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, 'a749b2db-a1ac-4e58-9fd3-1142e96b0445'),
('ecb34ff7-d27d-4696-b536-0512044b21a9', 'website', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'd5de6a8a-8894-4e72-b6ef-f9bf3a7a6541'),
('f36243d4-ab37-46b4-bdb8-c5d2cede1af9', 'allowed web origins', 'openid-connect', 'oidc-allowed-origins-mapper', NULL, '55178e4f-7c18-4d0d-b010-f9e4079d5d48'),
('f3cf3c8b-891a-48a1-97b3-1d10d55ddecd', 'locale', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, 'd5de6a8a-8894-4e72-b6ef-f9bf3a7a6541'),
('f4ae04c6-c23b-4ab7-991f-29f5337c2d20', 'Client Host', 'openid-connect', 'oidc-usersessionmodel-note-mapper', '1eabef67-6473-4ba8-b07c-14bdbae4aaed', NULL),
('f837ca4e-ad4b-4695-a199-ccc7800facfa', 'Client IP Address', 'openid-connect', 'oidc-usersessionmodel-note-mapper', '1eabef67-6473-4ba8-b07c-14bdbae4aaed', NULL),
('fa3b86c8-abaf-4261-b48d-41cd3cf2dc6a', 'full name', 'openid-connect', 'oidc-full-name-mapper', NULL, 'd5de6a8a-8894-4e72-b6ef-f9bf3a7a6541');

-- --------------------------------------------------------

--
-- Estrutura da tabela `protocol_mapper_config`
--

DROP TABLE IF EXISTS `protocol_mapper_config`;
CREATE TABLE IF NOT EXISTS `protocol_mapper_config` (
  `PROTOCOL_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`PROTOCOL_MAPPER_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `protocol_mapper_config`
--

INSERT INTO `protocol_mapper_config` (`PROTOCOL_MAPPER_ID`, `VALUE`, `NAME`) VALUES
('09836b63-f171-4bf4-8d56-2e255286cf89', 'true', 'access.token.claim'),
('09836b63-f171-4bf4-8d56-2e255286cf89', 'phone_number_verified', 'claim.name'),
('09836b63-f171-4bf4-8d56-2e255286cf89', 'true', 'id.token.claim'),
('09836b63-f171-4bf4-8d56-2e255286cf89', 'boolean', 'jsonType.label'),
('09836b63-f171-4bf4-8d56-2e255286cf89', 'phoneNumberVerified', 'user.attribute'),
('09836b63-f171-4bf4-8d56-2e255286cf89', 'true', 'userinfo.token.claim'),
('0edb6930-0754-40f8-89a4-d92197c7ebe5', 'true', 'access.token.claim'),
('0edb6930-0754-40f8-89a4-d92197c7ebe5', 'profile', 'claim.name'),
('0edb6930-0754-40f8-89a4-d92197c7ebe5', 'true', 'id.token.claim'),
('0edb6930-0754-40f8-89a4-d92197c7ebe5', 'String', 'jsonType.label'),
('0edb6930-0754-40f8-89a4-d92197c7ebe5', 'profile', 'user.attribute'),
('0edb6930-0754-40f8-89a4-d92197c7ebe5', 'true', 'userinfo.token.claim'),
('13158f91-ecf3-4fc4-b5ce-26d57a307d56', 'true', 'access.token.claim'),
('13158f91-ecf3-4fc4-b5ce-26d57a307d56', 'locale', 'claim.name'),
('13158f91-ecf3-4fc4-b5ce-26d57a307d56', 'true', 'id.token.claim'),
('13158f91-ecf3-4fc4-b5ce-26d57a307d56', 'String', 'jsonType.label'),
('13158f91-ecf3-4fc4-b5ce-26d57a307d56', 'locale', 'user.attribute'),
('13158f91-ecf3-4fc4-b5ce-26d57a307d56', 'true', 'userinfo.token.claim'),
('14631b9c-83eb-48ab-a224-29f047015e52', 'true', 'access.token.claim'),
('14631b9c-83eb-48ab-a224-29f047015e52', 'preferred_username', 'claim.name'),
('14631b9c-83eb-48ab-a224-29f047015e52', 'true', 'id.token.claim'),
('14631b9c-83eb-48ab-a224-29f047015e52', 'String', 'jsonType.label'),
('14631b9c-83eb-48ab-a224-29f047015e52', 'username', 'user.attribute'),
('14631b9c-83eb-48ab-a224-29f047015e52', 'true', 'userinfo.token.claim'),
('19551b04-fc0c-44c4-b2bf-966da87ba3c3', 'true', 'access.token.claim'),
('19551b04-fc0c-44c4-b2bf-966da87ba3c3', 'given_name', 'claim.name'),
('19551b04-fc0c-44c4-b2bf-966da87ba3c3', 'true', 'id.token.claim'),
('19551b04-fc0c-44c4-b2bf-966da87ba3c3', 'String', 'jsonType.label'),
('19551b04-fc0c-44c4-b2bf-966da87ba3c3', 'firstName', 'user.attribute'),
('19551b04-fc0c-44c4-b2bf-966da87ba3c3', 'true', 'userinfo.token.claim'),
('1ac09ef6-ab67-4379-b15a-5e54e50783be', 'true', 'access.token.claim'),
('1ac09ef6-ab67-4379-b15a-5e54e50783be', 'groups', 'claim.name'),
('1ac09ef6-ab67-4379-b15a-5e54e50783be', 'true', 'id.token.claim'),
('1ac09ef6-ab67-4379-b15a-5e54e50783be', 'String', 'jsonType.label'),
('1ac09ef6-ab67-4379-b15a-5e54e50783be', 'true', 'multivalued'),
('1ac09ef6-ab67-4379-b15a-5e54e50783be', 'foo', 'user.attribute'),
('1ac09ef6-ab67-4379-b15a-5e54e50783be', 'true', 'userinfo.token.claim'),
('1b1a1f44-66df-4670-badb-46a3d361ec7c', 'true', 'access.token.claim'),
('1b1a1f44-66df-4670-badb-46a3d361ec7c', 'clientHost', 'claim.name'),
('1b1a1f44-66df-4670-badb-46a3d361ec7c', 'true', 'id.token.claim'),
('1b1a1f44-66df-4670-badb-46a3d361ec7c', 'String', 'jsonType.label'),
('1b1a1f44-66df-4670-badb-46a3d361ec7c', 'clientHost', 'user.session.note'),
('1b1a1f44-66df-4670-badb-46a3d361ec7c', 'true', 'userinfo.token.claim'),
('20b9eed0-fc6b-4c18-8ebc-87ea685a931e', 'true', 'access.token.claim'),
('20b9eed0-fc6b-4c18-8ebc-87ea685a931e', 'website', 'claim.name'),
('20b9eed0-fc6b-4c18-8ebc-87ea685a931e', 'true', 'id.token.claim'),
('20b9eed0-fc6b-4c18-8ebc-87ea685a931e', 'String', 'jsonType.label'),
('20b9eed0-fc6b-4c18-8ebc-87ea685a931e', 'website', 'user.attribute'),
('20b9eed0-fc6b-4c18-8ebc-87ea685a931e', 'true', 'userinfo.token.claim'),
('219532f1-3c5c-4b30-a018-ae99adb6fc87', 'true', 'access.token.claim'),
('219532f1-3c5c-4b30-a018-ae99adb6fc87', 'birthdate', 'claim.name'),
('219532f1-3c5c-4b30-a018-ae99adb6fc87', 'true', 'id.token.claim'),
('219532f1-3c5c-4b30-a018-ae99adb6fc87', 'String', 'jsonType.label'),
('219532f1-3c5c-4b30-a018-ae99adb6fc87', 'birthdate', 'user.attribute'),
('219532f1-3c5c-4b30-a018-ae99adb6fc87', 'true', 'userinfo.token.claim'),
('2412ad07-0d21-4fe2-9ec1-256f43a6cd10', 'true', 'access.token.claim'),
('2412ad07-0d21-4fe2-9ec1-256f43a6cd10', 'groups', 'claim.name'),
('2412ad07-0d21-4fe2-9ec1-256f43a6cd10', 'true', 'id.token.claim'),
('2412ad07-0d21-4fe2-9ec1-256f43a6cd10', 'String', 'jsonType.label'),
('2412ad07-0d21-4fe2-9ec1-256f43a6cd10', 'true', 'multivalued'),
('2412ad07-0d21-4fe2-9ec1-256f43a6cd10', 'foo', 'user.attribute'),
('26e5a3cc-095a-46b2-b56a-a5223e8f3789', 'true', 'access.token.claim'),
('26e5a3cc-095a-46b2-b56a-a5223e8f3789', 'picture', 'claim.name'),
('26e5a3cc-095a-46b2-b56a-a5223e8f3789', 'true', 'id.token.claim'),
('26e5a3cc-095a-46b2-b56a-a5223e8f3789', 'String', 'jsonType.label'),
('26e5a3cc-095a-46b2-b56a-a5223e8f3789', 'picture', 'user.attribute'),
('26e5a3cc-095a-46b2-b56a-a5223e8f3789', 'true', 'userinfo.token.claim'),
('2ccf435c-c255-4715-8dcd-15091f97c5a5', 'true', 'access.token.claim'),
('2ccf435c-c255-4715-8dcd-15091f97c5a5', 'picture', 'claim.name'),
('2ccf435c-c255-4715-8dcd-15091f97c5a5', 'true', 'id.token.claim'),
('2ccf435c-c255-4715-8dcd-15091f97c5a5', 'String', 'jsonType.label'),
('2ccf435c-c255-4715-8dcd-15091f97c5a5', 'picture', 'user.attribute'),
('2ccf435c-c255-4715-8dcd-15091f97c5a5', 'true', 'userinfo.token.claim'),
('2e7a64f5-dd48-45f7-8623-c5ba976b0eb2', 'true', 'access.token.claim'),
('2e7a64f5-dd48-45f7-8623-c5ba976b0eb2', 'birthdate', 'claim.name'),
('2e7a64f5-dd48-45f7-8623-c5ba976b0eb2', 'true', 'id.token.claim'),
('2e7a64f5-dd48-45f7-8623-c5ba976b0eb2', 'String', 'jsonType.label'),
('2e7a64f5-dd48-45f7-8623-c5ba976b0eb2', 'birthdate', 'user.attribute'),
('2e7a64f5-dd48-45f7-8623-c5ba976b0eb2', 'true', 'userinfo.token.claim'),
('30763567-fd72-4d9b-bf3a-454c38cfd901', 'true', 'access.token.claim'),
('30763567-fd72-4d9b-bf3a-454c38cfd901', 'true', 'id.token.claim'),
('30763567-fd72-4d9b-bf3a-454c38cfd901', 'country', 'user.attribute.country'),
('30763567-fd72-4d9b-bf3a-454c38cfd901', 'formatted', 'user.attribute.formatted'),
('30763567-fd72-4d9b-bf3a-454c38cfd901', 'locality', 'user.attribute.locality'),
('30763567-fd72-4d9b-bf3a-454c38cfd901', 'postal_code', 'user.attribute.postal_code'),
('30763567-fd72-4d9b-bf3a-454c38cfd901', 'region', 'user.attribute.region'),
('30763567-fd72-4d9b-bf3a-454c38cfd901', 'street', 'user.attribute.street'),
('30763567-fd72-4d9b-bf3a-454c38cfd901', 'true', 'userinfo.token.claim'),
('3a1a19e1-bf24-4125-8c86-74b71050274b', 'true', 'access.token.claim'),
('3a1a19e1-bf24-4125-8c86-74b71050274b', 'locale', 'claim.name'),
('3a1a19e1-bf24-4125-8c86-74b71050274b', 'true', 'id.token.claim'),
('3a1a19e1-bf24-4125-8c86-74b71050274b', 'String', 'jsonType.label'),
('3a1a19e1-bf24-4125-8c86-74b71050274b', 'locale', 'user.attribute'),
('3a1a19e1-bf24-4125-8c86-74b71050274b', 'true', 'userinfo.token.claim'),
('3e1f0d91-a210-4dd7-af78-3b8d8cc2e244', 'true', 'access.token.claim'),
('3e1f0d91-a210-4dd7-af78-3b8d8cc2e244', 'clientId', 'claim.name'),
('3e1f0d91-a210-4dd7-af78-3b8d8cc2e244', 'true', 'id.token.claim'),
('3e1f0d91-a210-4dd7-af78-3b8d8cc2e244', 'String', 'jsonType.label'),
('3e1f0d91-a210-4dd7-af78-3b8d8cc2e244', 'clientId', 'user.session.note'),
('408dc6b2-dc52-4ccf-814a-6639c95a7541', 'true', 'access.token.claim'),
('408dc6b2-dc52-4ccf-814a-6639c95a7541', 'gender', 'claim.name'),
('408dc6b2-dc52-4ccf-814a-6639c95a7541', 'true', 'id.token.claim'),
('408dc6b2-dc52-4ccf-814a-6639c95a7541', 'String', 'jsonType.label'),
('408dc6b2-dc52-4ccf-814a-6639c95a7541', 'gender', 'user.attribute'),
('408dc6b2-dc52-4ccf-814a-6639c95a7541', 'true', 'userinfo.token.claim'),
('46513189-074c-4ba5-bfa7-29bae63faaaf', 'true', 'access.token.claim'),
('46513189-074c-4ba5-bfa7-29bae63faaaf', 'clientAddress', 'claim.name'),
('46513189-074c-4ba5-bfa7-29bae63faaaf', 'true', 'id.token.claim'),
('46513189-074c-4ba5-bfa7-29bae63faaaf', 'String', 'jsonType.label'),
('46513189-074c-4ba5-bfa7-29bae63faaaf', 'clientAddress', 'user.session.note'),
('46513189-074c-4ba5-bfa7-29bae63faaaf', 'true', 'userinfo.token.claim'),
('48e1a9a5-f6de-4966-a948-d5b485fd2b46', 'true', 'access.token.claim'),
('48e1a9a5-f6de-4966-a948-d5b485fd2b46', 'updated_at', 'claim.name'),
('48e1a9a5-f6de-4966-a948-d5b485fd2b46', 'true', 'id.token.claim'),
('48e1a9a5-f6de-4966-a948-d5b485fd2b46', 'String', 'jsonType.label'),
('48e1a9a5-f6de-4966-a948-d5b485fd2b46', 'updatedAt', 'user.attribute'),
('48e1a9a5-f6de-4966-a948-d5b485fd2b46', 'true', 'userinfo.token.claim'),
('4e57380d-0cf4-416e-93d4-33f27a6b794e', 'true', 'access.token.claim'),
('4e57380d-0cf4-416e-93d4-33f27a6b794e', 'phone_number', 'claim.name'),
('4e57380d-0cf4-416e-93d4-33f27a6b794e', 'true', 'id.token.claim'),
('4e57380d-0cf4-416e-93d4-33f27a6b794e', 'String', 'jsonType.label'),
('4e57380d-0cf4-416e-93d4-33f27a6b794e', 'phoneNumber', 'user.attribute'),
('4e57380d-0cf4-416e-93d4-33f27a6b794e', 'true', 'userinfo.token.claim'),
('5a33d5e4-e124-412e-be4d-b6b28b41382a', 'true', 'access.token.claim'),
('5a33d5e4-e124-412e-be4d-b6b28b41382a', 'family_name', 'claim.name'),
('5a33d5e4-e124-412e-be4d-b6b28b41382a', 'true', 'id.token.claim'),
('5a33d5e4-e124-412e-be4d-b6b28b41382a', 'String', 'jsonType.label'),
('5a33d5e4-e124-412e-be4d-b6b28b41382a', 'lastName', 'user.attribute'),
('5a33d5e4-e124-412e-be4d-b6b28b41382a', 'true', 'userinfo.token.claim'),
('646e3a98-5f0c-4192-91f0-9719c295b278', 'langKey', 'claim.name'),
('646e3a98-5f0c-4192-91f0-9719c295b278', 'String', 'jsonType.label'),
('646e3a98-5f0c-4192-91f0-9719c295b278', 'langKey', 'user.attribute'),
('646e3a98-5f0c-4192-91f0-9719c295b278', 'true', 'userinfo.token.claim'),
('65061407-001a-4820-87a6-7169d19558a1', 'true', 'access.token.claim'),
('65061407-001a-4820-87a6-7169d19558a1', 'nickname', 'claim.name'),
('65061407-001a-4820-87a6-7169d19558a1', 'true', 'id.token.claim'),
('65061407-001a-4820-87a6-7169d19558a1', 'String', 'jsonType.label'),
('65061407-001a-4820-87a6-7169d19558a1', 'nickname', 'user.attribute'),
('65061407-001a-4820-87a6-7169d19558a1', 'true', 'userinfo.token.claim'),
('68f16c75-9a89-4e13-8b6b-12476f0e49fd', 'true', 'access.token.claim'),
('68f16c75-9a89-4e13-8b6b-12476f0e49fd', 'zoneinfo', 'claim.name'),
('68f16c75-9a89-4e13-8b6b-12476f0e49fd', 'true', 'id.token.claim'),
('68f16c75-9a89-4e13-8b6b-12476f0e49fd', 'String', 'jsonType.label'),
('68f16c75-9a89-4e13-8b6b-12476f0e49fd', 'zoneinfo', 'user.attribute'),
('68f16c75-9a89-4e13-8b6b-12476f0e49fd', 'true', 'userinfo.token.claim'),
('74840763-9b35-4c9a-8789-4008fedc26c2', 'true', 'access.token.claim'),
('74840763-9b35-4c9a-8789-4008fedc26c2', 'phone_number_verified', 'claim.name'),
('74840763-9b35-4c9a-8789-4008fedc26c2', 'true', 'id.token.claim'),
('74840763-9b35-4c9a-8789-4008fedc26c2', 'boolean', 'jsonType.label'),
('74840763-9b35-4c9a-8789-4008fedc26c2', 'phoneNumberVerified', 'user.attribute'),
('74840763-9b35-4c9a-8789-4008fedc26c2', 'true', 'userinfo.token.claim'),
('76f898bc-70e4-4e0a-a259-ae4cb58260f9', 'true', 'access.token.claim'),
('76f898bc-70e4-4e0a-a259-ae4cb58260f9', 'email_verified', 'claim.name'),
('76f898bc-70e4-4e0a-a259-ae4cb58260f9', 'true', 'id.token.claim'),
('76f898bc-70e4-4e0a-a259-ae4cb58260f9', 'boolean', 'jsonType.label'),
('76f898bc-70e4-4e0a-a259-ae4cb58260f9', 'emailVerified', 'user.attribute'),
('76f898bc-70e4-4e0a-a259-ae4cb58260f9', 'true', 'userinfo.token.claim'),
('7b885963-e651-4b5d-94c7-4aa4aede723b', 'true', 'access.token.claim'),
('7b885963-e651-4b5d-94c7-4aa4aede723b', 'family_name', 'claim.name'),
('7b885963-e651-4b5d-94c7-4aa4aede723b', 'true', 'id.token.claim'),
('7b885963-e651-4b5d-94c7-4aa4aede723b', 'String', 'jsonType.label'),
('7b885963-e651-4b5d-94c7-4aa4aede723b', 'lastName', 'user.attribute'),
('7b885963-e651-4b5d-94c7-4aa4aede723b', 'true', 'userinfo.token.claim'),
('7cbb4477-af0c-4394-a754-b72a1b4638e0', 'Role', 'attribute.name'),
('7cbb4477-af0c-4394-a754-b72a1b4638e0', 'Basic', 'attribute.nameformat'),
('7cbb4477-af0c-4394-a754-b72a1b4638e0', 'false', 'single'),
('9271d821-b803-406d-8574-2f5a2693f065', 'true', 'access.token.claim'),
('9271d821-b803-406d-8574-2f5a2693f065', 'realm_access.roles', 'claim.name'),
('9271d821-b803-406d-8574-2f5a2693f065', 'String', 'jsonType.label'),
('9271d821-b803-406d-8574-2f5a2693f065', 'true', 'multivalued'),
('9271d821-b803-406d-8574-2f5a2693f065', 'foo', 'user.attribute'),
('974887a2-e14a-4afd-84fc-a848009079ae', 'true', 'access.token.claim'),
('974887a2-e14a-4afd-84fc-a848009079ae', 'clientId', 'claim.name'),
('974887a2-e14a-4afd-84fc-a848009079ae', 'true', 'id.token.claim'),
('974887a2-e14a-4afd-84fc-a848009079ae', 'String', 'jsonType.label'),
('974887a2-e14a-4afd-84fc-a848009079ae', 'clientId', 'user.session.note'),
('974887a2-e14a-4afd-84fc-a848009079ae', 'true', 'userinfo.token.claim'),
('9a9feffe-7e4f-427a-ab14-053bd29b7ba3', 'true', 'access.token.claim'),
('9a9feffe-7e4f-427a-ab14-053bd29b7ba3', 'preferred_username', 'claim.name'),
('9a9feffe-7e4f-427a-ab14-053bd29b7ba3', 'true', 'id.token.claim'),
('9a9feffe-7e4f-427a-ab14-053bd29b7ba3', 'String', 'jsonType.label'),
('9a9feffe-7e4f-427a-ab14-053bd29b7ba3', 'username', 'user.attribute'),
('9a9feffe-7e4f-427a-ab14-053bd29b7ba3', 'true', 'userinfo.token.claim'),
('a91fbca6-9a49-4f64-a49a-608cc736608f', 'true', 'access.token.claim'),
('a91fbca6-9a49-4f64-a49a-608cc736608f', 'middle_name', 'claim.name'),
('a91fbca6-9a49-4f64-a49a-608cc736608f', 'true', 'id.token.claim'),
('a91fbca6-9a49-4f64-a49a-608cc736608f', 'String', 'jsonType.label'),
('a91fbca6-9a49-4f64-a49a-608cc736608f', 'middleName', 'user.attribute'),
('a91fbca6-9a49-4f64-a49a-608cc736608f', 'true', 'userinfo.token.claim'),
('a9d81dbc-06f1-491c-a4f9-4f2a70a696dd', 'true', 'access.token.claim'),
('a9d81dbc-06f1-491c-a4f9-4f2a70a696dd', 'resource_access.${client_id}.roles', 'claim.name'),
('a9d81dbc-06f1-491c-a4f9-4f2a70a696dd', 'String', 'jsonType.label'),
('a9d81dbc-06f1-491c-a4f9-4f2a70a696dd', 'true', 'multivalued'),
('a9d81dbc-06f1-491c-a4f9-4f2a70a696dd', 'foo', 'user.attribute'),
('abfaa4cd-4bc1-4223-be5d-c56c641369f2', 'true', 'access.token.claim'),
('abfaa4cd-4bc1-4223-be5d-c56c641369f2', 'locale', 'claim.name'),
('abfaa4cd-4bc1-4223-be5d-c56c641369f2', 'true', 'id.token.claim'),
('abfaa4cd-4bc1-4223-be5d-c56c641369f2', 'String', 'jsonType.label'),
('abfaa4cd-4bc1-4223-be5d-c56c641369f2', 'locale', 'user.attribute'),
('abfaa4cd-4bc1-4223-be5d-c56c641369f2', 'true', 'userinfo.token.claim'),
('ad47f393-3e6f-4516-9c20-5fd2e3b2b91f', 'true', 'access.token.claim'),
('ad47f393-3e6f-4516-9c20-5fd2e3b2b91f', 'given_name', 'claim.name'),
('ad47f393-3e6f-4516-9c20-5fd2e3b2b91f', 'true', 'id.token.claim'),
('ad47f393-3e6f-4516-9c20-5fd2e3b2b91f', 'String', 'jsonType.label'),
('ad47f393-3e6f-4516-9c20-5fd2e3b2b91f', 'firstName', 'user.attribute'),
('ad47f393-3e6f-4516-9c20-5fd2e3b2b91f', 'true', 'userinfo.token.claim'),
('b19404f1-5139-4505-9278-139cc8d41ba5', 'true', 'access.token.claim'),
('b19404f1-5139-4505-9278-139cc8d41ba5', 'email_verified', 'claim.name'),
('b19404f1-5139-4505-9278-139cc8d41ba5', 'true', 'id.token.claim'),
('b19404f1-5139-4505-9278-139cc8d41ba5', 'boolean', 'jsonType.label'),
('b19404f1-5139-4505-9278-139cc8d41ba5', 'emailVerified', 'user.attribute'),
('b19404f1-5139-4505-9278-139cc8d41ba5', 'true', 'userinfo.token.claim'),
('b46b8e5e-5fea-441e-94a5-159ae7434211', 'true', 'access.token.claim'),
('b46b8e5e-5fea-441e-94a5-159ae7434211', 'realmRolesViaPhycusSHFCClientScopeClaims', 'claim.name'),
('b46b8e5e-5fea-441e-94a5-159ae7434211', 'false', 'id.token.claim'),
('b46b8e5e-5fea-441e-94a5-159ae7434211', 'String', 'jsonType.label'),
('b46b8e5e-5fea-441e-94a5-159ae7434211', 'true', 'multivalued'),
('b46b8e5e-5fea-441e-94a5-159ae7434211', 'true', 'userinfo.token.claim'),
('b60646cc-1344-47b1-86ad-d8b71e837edc', 'true', 'access.token.claim'),
('b60646cc-1344-47b1-86ad-d8b71e837edc', 'realm_access.roles', 'claim.name'),
('b60646cc-1344-47b1-86ad-d8b71e837edc', 'String', 'jsonType.label'),
('b60646cc-1344-47b1-86ad-d8b71e837edc', 'true', 'multivalued'),
('b60646cc-1344-47b1-86ad-d8b71e837edc', 'foo', 'user.attribute'),
('b9a92105-8ca5-45d1-8a99-626255ac174f', 'true', 'access.token.claim'),
('b9a92105-8ca5-45d1-8a99-626255ac174f', 'true', 'id.token.claim'),
('b9a92105-8ca5-45d1-8a99-626255ac174f', 'country', 'user.attribute.country'),
('b9a92105-8ca5-45d1-8a99-626255ac174f', 'formatted', 'user.attribute.formatted'),
('b9a92105-8ca5-45d1-8a99-626255ac174f', 'locality', 'user.attribute.locality'),
('b9a92105-8ca5-45d1-8a99-626255ac174f', 'postal_code', 'user.attribute.postal_code'),
('b9a92105-8ca5-45d1-8a99-626255ac174f', 'region', 'user.attribute.region'),
('b9a92105-8ca5-45d1-8a99-626255ac174f', 'street', 'user.attribute.street'),
('b9a92105-8ca5-45d1-8a99-626255ac174f', 'true', 'userinfo.token.claim'),
('bbbd7dc1-63d0-468f-9463-4772833ef2fa', 'true', 'access.token.claim'),
('bbbd7dc1-63d0-468f-9463-4772833ef2fa', 'resource_access.${client_id}.roles', 'claim.name'),
('bbbd7dc1-63d0-468f-9463-4772833ef2fa', 'String', 'jsonType.label'),
('bbbd7dc1-63d0-468f-9463-4772833ef2fa', 'true', 'multivalued'),
('bbbd7dc1-63d0-468f-9463-4772833ef2fa', 'foo', 'user.attribute'),
('bbc582f4-4749-42b8-9c65-71f4edfd3979', 'true', 'access.token.claim'),
('bbc582f4-4749-42b8-9c65-71f4edfd3979', 'phone_number', 'claim.name'),
('bbc582f4-4749-42b8-9c65-71f4edfd3979', 'true', 'id.token.claim'),
('bbc582f4-4749-42b8-9c65-71f4edfd3979', 'String', 'jsonType.label'),
('bbc582f4-4749-42b8-9c65-71f4edfd3979', 'phoneNumber', 'user.attribute'),
('bbc582f4-4749-42b8-9c65-71f4edfd3979', 'true', 'userinfo.token.claim'),
('c4122959-6738-4883-b50a-acd0033a477a', 'true', 'access.token.claim'),
('c4122959-6738-4883-b50a-acd0033a477a', 'profile', 'claim.name'),
('c4122959-6738-4883-b50a-acd0033a477a', 'true', 'id.token.claim'),
('c4122959-6738-4883-b50a-acd0033a477a', 'String', 'jsonType.label'),
('c4122959-6738-4883-b50a-acd0033a477a', 'profile', 'user.attribute'),
('c4122959-6738-4883-b50a-acd0033a477a', 'true', 'userinfo.token.claim'),
('c422b63f-e809-41c2-854c-e801e8e25485', 'true', 'access.token.claim'),
('c422b63f-e809-41c2-854c-e801e8e25485', 'gender', 'claim.name'),
('c422b63f-e809-41c2-854c-e801e8e25485', 'true', 'id.token.claim'),
('c422b63f-e809-41c2-854c-e801e8e25485', 'String', 'jsonType.label'),
('c422b63f-e809-41c2-854c-e801e8e25485', 'gender', 'user.attribute'),
('c422b63f-e809-41c2-854c-e801e8e25485', 'true', 'userinfo.token.claim'),
('c443f4cd-1174-49a7-a2b3-65d5ccde5efa', 'true', 'access.token.claim'),
('c443f4cd-1174-49a7-a2b3-65d5ccde5efa', 'nickname', 'claim.name'),
('c443f4cd-1174-49a7-a2b3-65d5ccde5efa', 'true', 'id.token.claim'),
('c443f4cd-1174-49a7-a2b3-65d5ccde5efa', 'String', 'jsonType.label'),
('c443f4cd-1174-49a7-a2b3-65d5ccde5efa', 'nickname', 'user.attribute'),
('c443f4cd-1174-49a7-a2b3-65d5ccde5efa', 'true', 'userinfo.token.claim'),
('cedd1f1b-951a-4332-9fa1-2edf1a266283', 'true', 'access.token.claim'),
('cedd1f1b-951a-4332-9fa1-2edf1a266283', 'middle_name', 'claim.name'),
('cedd1f1b-951a-4332-9fa1-2edf1a266283', 'true', 'id.token.claim'),
('cedd1f1b-951a-4332-9fa1-2edf1a266283', 'String', 'jsonType.label'),
('cedd1f1b-951a-4332-9fa1-2edf1a266283', 'middleName', 'user.attribute'),
('cedd1f1b-951a-4332-9fa1-2edf1a266283', 'true', 'userinfo.token.claim'),
('d0933863-01a2-4c0f-83d0-7a6f25169cc0', 'true', 'access.token.claim'),
('d0933863-01a2-4c0f-83d0-7a6f25169cc0', 'clientRolesViaPhycusSHFCClientScopeClaims', 'claim.name'),
('d0933863-01a2-4c0f-83d0-7a6f25169cc0', 'false', 'id.token.claim'),
('d0933863-01a2-4c0f-83d0-7a6f25169cc0', 'String', 'jsonType.label'),
('d0933863-01a2-4c0f-83d0-7a6f25169cc0', 'true', 'multivalued'),
('d0933863-01a2-4c0f-83d0-7a6f25169cc0', 'true', 'userinfo.token.claim'),
('d0933863-01a2-4c0f-83d0-7a6f25169cc0', 'PhycusSHFCApp', 'usermodel.clientRoleMapping.clientId'),
('d34872aa-4054-41b6-a3fd-59ff8e743a5c', 'true', 'access.token.claim'),
('d34872aa-4054-41b6-a3fd-59ff8e743a5c', 'email', 'claim.name'),
('d34872aa-4054-41b6-a3fd-59ff8e743a5c', 'true', 'id.token.claim'),
('d34872aa-4054-41b6-a3fd-59ff8e743a5c', 'String', 'jsonType.label'),
('d34872aa-4054-41b6-a3fd-59ff8e743a5c', 'email', 'user.attribute'),
('d34872aa-4054-41b6-a3fd-59ff8e743a5c', 'true', 'userinfo.token.claim'),
('d7db1b88-2c3c-419a-91cf-19ad13355a56', 'true', 'access.token.claim'),
('d7db1b88-2c3c-419a-91cf-19ad13355a56', 'zoneinfo', 'claim.name'),
('d7db1b88-2c3c-419a-91cf-19ad13355a56', 'true', 'id.token.claim'),
('d7db1b88-2c3c-419a-91cf-19ad13355a56', 'String', 'jsonType.label'),
('d7db1b88-2c3c-419a-91cf-19ad13355a56', 'zoneinfo', 'user.attribute'),
('d7db1b88-2c3c-419a-91cf-19ad13355a56', 'true', 'userinfo.token.claim'),
('db225b69-f493-47e7-bd59-2b5d0f9c5473', 'true', 'access.token.claim'),
('db225b69-f493-47e7-bd59-2b5d0f9c5473', 'true', 'id.token.claim'),
('db225b69-f493-47e7-bd59-2b5d0f9c5473', 'true', 'userinfo.token.claim'),
('dc1097e0-226d-4915-9004-4b229a95a80b', 'Role', 'attribute.name'),
('dc1097e0-226d-4915-9004-4b229a95a80b', 'Basic', 'attribute.nameformat'),
('dc1097e0-226d-4915-9004-4b229a95a80b', 'false', 'single'),
('dec0c468-3c11-429b-844e-dfd632b20ba7', 'true', 'access.token.claim'),
('dec0c468-3c11-429b-844e-dfd632b20ba7', 'upn', 'claim.name'),
('dec0c468-3c11-429b-844e-dfd632b20ba7', 'true', 'id.token.claim'),
('dec0c468-3c11-429b-844e-dfd632b20ba7', 'String', 'jsonType.label'),
('dec0c468-3c11-429b-844e-dfd632b20ba7', 'username', 'user.attribute'),
('dec0c468-3c11-429b-844e-dfd632b20ba7', 'true', 'userinfo.token.claim'),
('dfd19868-5c87-4a51-80e0-2a82dfabb16c', 'true', 'access.token.claim'),
('dfd19868-5c87-4a51-80e0-2a82dfabb16c', 'updated_at', 'claim.name'),
('dfd19868-5c87-4a51-80e0-2a82dfabb16c', 'true', 'id.token.claim'),
('dfd19868-5c87-4a51-80e0-2a82dfabb16c', 'String', 'jsonType.label'),
('dfd19868-5c87-4a51-80e0-2a82dfabb16c', 'updatedAt', 'user.attribute'),
('dfd19868-5c87-4a51-80e0-2a82dfabb16c', 'true', 'userinfo.token.claim'),
('e348c7f8-e835-4539-a80b-b588510a82a9', 'true', 'access.token.claim'),
('e348c7f8-e835-4539-a80b-b588510a82a9', 'email', 'claim.name'),
('e348c7f8-e835-4539-a80b-b588510a82a9', 'true', 'id.token.claim'),
('e348c7f8-e835-4539-a80b-b588510a82a9', 'String', 'jsonType.label'),
('e348c7f8-e835-4539-a80b-b588510a82a9', 'email', 'user.attribute'),
('e348c7f8-e835-4539-a80b-b588510a82a9', 'true', 'userinfo.token.claim'),
('e7c536ca-1711-4ed5-9f21-20a25435f475', 'login', 'claim.name'),
('e7c536ca-1711-4ed5-9f21-20a25435f475', 'String', 'jsonType.label'),
('e7c536ca-1711-4ed5-9f21-20a25435f475', 'preferred_username', 'user.attribute'),
('e7c536ca-1711-4ed5-9f21-20a25435f475', 'true', 'userinfo.token.claim'),
('eb305ae4-1a75-4b4b-a803-b340f6e2cbf4', 'true', 'access.token.claim'),
('eb305ae4-1a75-4b4b-a803-b340f6e2cbf4', 'upn', 'claim.name'),
('eb305ae4-1a75-4b4b-a803-b340f6e2cbf4', 'true', 'id.token.claim'),
('eb305ae4-1a75-4b4b-a803-b340f6e2cbf4', 'String', 'jsonType.label'),
('eb305ae4-1a75-4b4b-a803-b340f6e2cbf4', 'username', 'user.attribute'),
('eb305ae4-1a75-4b4b-a803-b340f6e2cbf4', 'true', 'userinfo.token.claim'),
('ecb34ff7-d27d-4696-b536-0512044b21a9', 'true', 'access.token.claim'),
('ecb34ff7-d27d-4696-b536-0512044b21a9', 'website', 'claim.name'),
('ecb34ff7-d27d-4696-b536-0512044b21a9', 'true', 'id.token.claim'),
('ecb34ff7-d27d-4696-b536-0512044b21a9', 'String', 'jsonType.label'),
('ecb34ff7-d27d-4696-b536-0512044b21a9', 'website', 'user.attribute'),
('ecb34ff7-d27d-4696-b536-0512044b21a9', 'true', 'userinfo.token.claim'),
('f3cf3c8b-891a-48a1-97b3-1d10d55ddecd', 'true', 'access.token.claim'),
('f3cf3c8b-891a-48a1-97b3-1d10d55ddecd', 'locale', 'claim.name'),
('f3cf3c8b-891a-48a1-97b3-1d10d55ddecd', 'true', 'id.token.claim'),
('f3cf3c8b-891a-48a1-97b3-1d10d55ddecd', 'String', 'jsonType.label'),
('f3cf3c8b-891a-48a1-97b3-1d10d55ddecd', 'locale', 'user.attribute'),
('f3cf3c8b-891a-48a1-97b3-1d10d55ddecd', 'true', 'userinfo.token.claim'),
('f4ae04c6-c23b-4ab7-991f-29f5337c2d20', 'true', 'access.token.claim'),
('f4ae04c6-c23b-4ab7-991f-29f5337c2d20', 'clientHost', 'claim.name'),
('f4ae04c6-c23b-4ab7-991f-29f5337c2d20', 'true', 'id.token.claim'),
('f4ae04c6-c23b-4ab7-991f-29f5337c2d20', 'String', 'jsonType.label'),
('f4ae04c6-c23b-4ab7-991f-29f5337c2d20', 'clientHost', 'user.session.note'),
('f837ca4e-ad4b-4695-a199-ccc7800facfa', 'true', 'access.token.claim'),
('f837ca4e-ad4b-4695-a199-ccc7800facfa', 'clientAddress', 'claim.name'),
('f837ca4e-ad4b-4695-a199-ccc7800facfa', 'true', 'id.token.claim'),
('f837ca4e-ad4b-4695-a199-ccc7800facfa', 'String', 'jsonType.label'),
('f837ca4e-ad4b-4695-a199-ccc7800facfa', 'clientAddress', 'user.session.note'),
('fa3b86c8-abaf-4261-b48d-41cd3cf2dc6a', 'true', 'access.token.claim'),
('fa3b86c8-abaf-4261-b48d-41cd3cf2dc6a', 'true', 'id.token.claim'),
('fa3b86c8-abaf-4261-b48d-41cd3cf2dc6a', 'true', 'userinfo.token.claim');

-- --------------------------------------------------------

--
-- Estrutura da tabela `realm`
--

DROP TABLE IF EXISTS `realm`;
CREATE TABLE IF NOT EXISTS `realm` (
  `ID` varchar(36) NOT NULL,
  `ACCESS_CODE_LIFESPAN` int DEFAULT NULL,
  `USER_ACTION_LIFESPAN` int DEFAULT NULL,
  `ACCESS_TOKEN_LIFESPAN` int DEFAULT NULL,
  `ACCOUNT_THEME` varchar(255) DEFAULT NULL,
  `ADMIN_THEME` varchar(255) DEFAULT NULL,
  `EMAIL_THEME` varchar(255) DEFAULT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EVENTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EVENTS_EXPIRATION` bigint DEFAULT NULL,
  `LOGIN_THEME` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int DEFAULT NULL,
  `PASSWORD_POLICY` text,
  `REGISTRATION_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `REMEMBER_ME` bit(1) NOT NULL DEFAULT b'0',
  `RESET_PASSWORD_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `SOCIAL` bit(1) NOT NULL DEFAULT b'0',
  `SSL_REQUIRED` varchar(255) DEFAULT NULL,
  `SSO_IDLE_TIMEOUT` int DEFAULT NULL,
  `SSO_MAX_LIFESPAN` int DEFAULT NULL,
  `UPDATE_PROFILE_ON_SOC_LOGIN` bit(1) NOT NULL DEFAULT b'0',
  `VERIFY_EMAIL` bit(1) NOT NULL DEFAULT b'0',
  `MASTER_ADMIN_CLIENT` varchar(36) DEFAULT NULL,
  `LOGIN_LIFESPAN` int DEFAULT NULL,
  `INTERNATIONALIZATION_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DEFAULT_LOCALE` varchar(255) DEFAULT NULL,
  `REG_EMAIL_AS_USERNAME` bit(1) NOT NULL DEFAULT b'0',
  `ADMIN_EVENTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `ADMIN_EVENTS_DETAILS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EDIT_USERNAME_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `OTP_POLICY_COUNTER` int DEFAULT '0',
  `OTP_POLICY_WINDOW` int DEFAULT '1',
  `OTP_POLICY_PERIOD` int DEFAULT '30',
  `OTP_POLICY_DIGITS` int DEFAULT '6',
  `OTP_POLICY_ALG` varchar(36) DEFAULT 'HmacSHA1',
  `OTP_POLICY_TYPE` varchar(36) DEFAULT 'totp',
  `BROWSER_FLOW` varchar(36) DEFAULT NULL,
  `REGISTRATION_FLOW` varchar(36) DEFAULT NULL,
  `DIRECT_GRANT_FLOW` varchar(36) DEFAULT NULL,
  `RESET_CREDENTIALS_FLOW` varchar(36) DEFAULT NULL,
  `CLIENT_AUTH_FLOW` varchar(36) DEFAULT NULL,
  `OFFLINE_SESSION_IDLE_TIMEOUT` int DEFAULT '0',
  `REVOKE_REFRESH_TOKEN` bit(1) NOT NULL DEFAULT b'0',
  `ACCESS_TOKEN_LIFE_IMPLICIT` int DEFAULT '0',
  `LOGIN_WITH_EMAIL_ALLOWED` bit(1) NOT NULL DEFAULT b'1',
  `DUPLICATE_EMAILS_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `DOCKER_AUTH_FLOW` varchar(36) DEFAULT NULL,
  `REFRESH_TOKEN_MAX_REUSE` int DEFAULT '0',
  `ALLOW_USER_MANAGED_ACCESS` bit(1) NOT NULL DEFAULT b'0',
  `SSO_MAX_LIFESPAN_REMEMBER_ME` int NOT NULL,
  `SSO_IDLE_TIMEOUT_REMEMBER_ME` int NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_ORVSDMLA56612EAEFIQ6WL5OI` (`NAME`),
  KEY `IDX_REALM_MASTER_ADM_CLI` (`MASTER_ADMIN_CLIENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `realm`
--

INSERT INTO `realm` (`ID`, `ACCESS_CODE_LIFESPAN`, `USER_ACTION_LIFESPAN`, `ACCESS_TOKEN_LIFESPAN`, `ACCOUNT_THEME`, `ADMIN_THEME`, `EMAIL_THEME`, `ENABLED`, `EVENTS_ENABLED`, `EVENTS_EXPIRATION`, `LOGIN_THEME`, `NAME`, `NOT_BEFORE`, `PASSWORD_POLICY`, `REGISTRATION_ALLOWED`, `REMEMBER_ME`, `RESET_PASSWORD_ALLOWED`, `SOCIAL`, `SSL_REQUIRED`, `SSO_IDLE_TIMEOUT`, `SSO_MAX_LIFESPAN`, `UPDATE_PROFILE_ON_SOC_LOGIN`, `VERIFY_EMAIL`, `MASTER_ADMIN_CLIENT`, `LOGIN_LIFESPAN`, `INTERNATIONALIZATION_ENABLED`, `DEFAULT_LOCALE`, `REG_EMAIL_AS_USERNAME`, `ADMIN_EVENTS_ENABLED`, `ADMIN_EVENTS_DETAILS_ENABLED`, `EDIT_USERNAME_ALLOWED`, `OTP_POLICY_COUNTER`, `OTP_POLICY_WINDOW`, `OTP_POLICY_PERIOD`, `OTP_POLICY_DIGITS`, `OTP_POLICY_ALG`, `OTP_POLICY_TYPE`, `BROWSER_FLOW`, `REGISTRATION_FLOW`, `DIRECT_GRANT_FLOW`, `RESET_CREDENTIALS_FLOW`, `CLIENT_AUTH_FLOW`, `OFFLINE_SESSION_IDLE_TIMEOUT`, `REVOKE_REFRESH_TOKEN`, `ACCESS_TOKEN_LIFE_IMPLICIT`, `LOGIN_WITH_EMAIL_ALLOWED`, `DUPLICATE_EMAILS_ALLOWED`, `DOCKER_AUTH_FLOW`, `REFRESH_TOKEN_MAX_REUSE`, `ALLOW_USER_MANAGED_ACCESS`, `SSO_MAX_LIFESPAN_REMEMBER_ME`, `SSO_IDLE_TIMEOUT_REMEMBER_ME`) VALUES
('cibmtr-bioinformatics-realm', 60, 300, 300, NULL, NULL, NULL, b'1', b'0', 0, NULL, 'CIBMTR-BioInformatics-Realm', 1585089550, NULL, b'1', b'1', b'1', b'0', 'NONE', 1800, 36000, b'0', b'1', '1cdadc8e-1773-47bc-9c01-875f84ea25ec', 1800, b'0', NULL, b'1', b'0', b'0', b'1', 0, 1, 30, 6, 'HmacSHA1', 'totp', '03019b44-fb0a-42bb-ab7f-b109f9118d62', '4c6da64c-81dd-4680-afc5-744c93cd8286', '4792c881-7800-47a7-9264-c2f50d602ee9', '9fcbb697-dadf-4079-9b02-f489c7394182', 'b2104493-52a1-4627-869b-a65b057b8147', 2592000, b'0', 900, b'1', b'0', 'e77f88e4-c597-4e89-8db8-7cba747d9601', 0, b'1', 0, 0),
('master', 60, 300, 60, NULL, NULL, NULL, b'1', b'0', 0, NULL, 'master', 0, NULL, b'0', b'0', b'0', b'0', 'EXTERNAL', 1800, 36000, b'0', b'0', 'f1cbf82e-a285-4a15-a172-ff97732a2648', 1800, b'0', NULL, b'0', b'0', b'0', b'0', 0, 1, 30, 6, 'HmacSHA1', 'totp', 'd6f21945-0811-4745-9491-4d06f6891f04', '15ffed78-3316-425a-9649-11107e54c743', '084f926f-6967-4bcb-b80e-31207678cf2c', '02dbcfec-7c6a-4a98-81df-8839f710c4a8', 'c486d764-c8c6-416e-98cf-45a19bb6746d', 2592000, b'0', 900, b'1', b'0', '09a729e8-7ede-4d69-822c-59ea50e9c4eb', 0, b'0', 0, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `realm_attribute`
--

DROP TABLE IF EXISTS `realm_attribute`;
CREATE TABLE IF NOT EXISTS `realm_attribute` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`NAME`,`REALM_ID`),
  KEY `IDX_REALM_ATTR_REALM` (`REALM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `realm_attribute`
--

INSERT INTO `realm_attribute` (`NAME`, `VALUE`, `REALM_ID`) VALUES
('_browser_header.contentSecurityPolicy', 'frame-src \'self\'; frame-ancestors \'self\'; object-src \'none\';', 'cibmtr-bioinformatics-realm'),
('_browser_header.contentSecurityPolicy', 'frame-src \'self\'; frame-ancestors \'self\'; object-src \'none\';', 'master'),
('_browser_header.contentSecurityPolicyReportOnly', '', 'cibmtr-bioinformatics-realm'),
('_browser_header.contentSecurityPolicyReportOnly', '', 'master'),
('_browser_header.strictTransportSecurity', 'max-age=31536000; includeSubDomains', 'cibmtr-bioinformatics-realm'),
('_browser_header.strictTransportSecurity', 'max-age=31536000; includeSubDomains', 'master'),
('_browser_header.xContentTypeOptions', 'nosniff', 'cibmtr-bioinformatics-realm'),
('_browser_header.xContentTypeOptions', 'nosniff', 'master'),
('_browser_header.xFrameOptions', 'SAMEORIGIN', 'cibmtr-bioinformatics-realm'),
('_browser_header.xFrameOptions', 'SAMEORIGIN', 'master'),
('_browser_header.xRobotsTag', 'none', 'cibmtr-bioinformatics-realm'),
('_browser_header.xRobotsTag', 'none', 'master'),
('_browser_header.xXSSProtection', '1; mode=block', 'cibmtr-bioinformatics-realm'),
('_browser_header.xXSSProtection', '1; mode=block', 'master'),
('actionTokenGeneratedByAdminLifespan', '43200', 'cibmtr-bioinformatics-realm'),
('actionTokenGeneratedByAdminLifespan', '43200', 'master'),
('actionTokenGeneratedByUserLifespan', '300', 'cibmtr-bioinformatics-realm'),
('actionTokenGeneratedByUserLifespan', '300', 'master'),
('bruteForceProtected', 'false', 'cibmtr-bioinformatics-realm'),
('bruteForceProtected', 'false', 'master'),
('defaultSignatureAlgorithm', NULL, 'cibmtr-bioinformatics-realm'),
('displayName', 'CIBMTR / NMDP BioInformatics Realm', 'cibmtr-bioinformatics-realm'),
('displayName', 'CIBMTR BioInformatics - Access Management :: KeyCloak', 'master'),
('displayNameHtml', 'CIBMTR / NMDP BioInformatics Realm', 'cibmtr-bioinformatics-realm'),
('displayNameHtml', '<div class=\"kc-logo-text\"><span>Keycloak</span></div>', 'master'),
('failureFactor', '30', 'cibmtr-bioinformatics-realm'),
('failureFactor', '30', 'master'),
('maxDeltaTimeSeconds', '43200', 'cibmtr-bioinformatics-realm'),
('maxDeltaTimeSeconds', '43200', 'master'),
('maxFailureWaitSeconds', '900', 'cibmtr-bioinformatics-realm'),
('maxFailureWaitSeconds', '900', 'master'),
('minimumQuickLoginWaitSeconds', '60', 'cibmtr-bioinformatics-realm'),
('minimumQuickLoginWaitSeconds', '60', 'master'),
('offlineSessionMaxLifespan', '5184000', 'cibmtr-bioinformatics-realm'),
('offlineSessionMaxLifespan', '5184000', 'master'),
('offlineSessionMaxLifespanEnabled', 'false', 'cibmtr-bioinformatics-realm'),
('offlineSessionMaxLifespanEnabled', 'false', 'master'),
('permanentLockout', 'false', 'cibmtr-bioinformatics-realm'),
('permanentLockout', 'false', 'master'),
('quickLoginCheckMilliSeconds', '1000', 'cibmtr-bioinformatics-realm'),
('quickLoginCheckMilliSeconds', '1000', 'master'),
('waitIncrementSeconds', '60', 'cibmtr-bioinformatics-realm'),
('waitIncrementSeconds', '60', 'master'),
('webAuthnPolicyAttestationConveyancePreference', 'not specified', 'cibmtr-bioinformatics-realm'),
('webAuthnPolicyAttestationConveyancePreference', 'not specified', 'master'),
('webAuthnPolicyAttestationConveyancePreferencePasswordless', 'not specified', 'cibmtr-bioinformatics-realm'),
('webAuthnPolicyAttestationConveyancePreferencePasswordless', 'not specified', 'master'),
('webAuthnPolicyAuthenticatorAttachment', 'not specified', 'cibmtr-bioinformatics-realm'),
('webAuthnPolicyAuthenticatorAttachment', 'not specified', 'master'),
('webAuthnPolicyAuthenticatorAttachmentPasswordless', 'not specified', 'cibmtr-bioinformatics-realm'),
('webAuthnPolicyAuthenticatorAttachmentPasswordless', 'not specified', 'master'),
('webAuthnPolicyAvoidSameAuthenticatorRegister', 'false', 'cibmtr-bioinformatics-realm'),
('webAuthnPolicyAvoidSameAuthenticatorRegister', 'false', 'master'),
('webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless', 'false', 'cibmtr-bioinformatics-realm'),
('webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless', 'false', 'master'),
('webAuthnPolicyCreateTimeout', '0', 'cibmtr-bioinformatics-realm'),
('webAuthnPolicyCreateTimeout', '0', 'master'),
('webAuthnPolicyCreateTimeoutPasswordless', '0', 'cibmtr-bioinformatics-realm'),
('webAuthnPolicyCreateTimeoutPasswordless', '0', 'master'),
('webAuthnPolicyRequireResidentKey', 'not specified', 'cibmtr-bioinformatics-realm'),
('webAuthnPolicyRequireResidentKey', 'not specified', 'master'),
('webAuthnPolicyRequireResidentKeyPasswordless', 'not specified', 'cibmtr-bioinformatics-realm'),
('webAuthnPolicyRequireResidentKeyPasswordless', 'not specified', 'master'),
('webAuthnPolicyRpEntityName', 'keycloak', 'cibmtr-bioinformatics-realm'),
('webAuthnPolicyRpEntityName', 'keycloak', 'master'),
('webAuthnPolicyRpEntityNamePasswordless', 'keycloak', 'cibmtr-bioinformatics-realm'),
('webAuthnPolicyRpEntityNamePasswordless', 'keycloak', 'master'),
('webAuthnPolicyRpId', '', 'cibmtr-bioinformatics-realm'),
('webAuthnPolicyRpId', '', 'master'),
('webAuthnPolicyRpIdPasswordless', '', 'cibmtr-bioinformatics-realm'),
('webAuthnPolicyRpIdPasswordless', '', 'master'),
('webAuthnPolicySignatureAlgorithms', 'ES256', 'cibmtr-bioinformatics-realm'),
('webAuthnPolicySignatureAlgorithms', 'ES256', 'master'),
('webAuthnPolicySignatureAlgorithmsPasswordless', 'ES256', 'cibmtr-bioinformatics-realm'),
('webAuthnPolicySignatureAlgorithmsPasswordless', 'ES256', 'master'),
('webAuthnPolicyUserVerificationRequirement', 'not specified', 'cibmtr-bioinformatics-realm'),
('webAuthnPolicyUserVerificationRequirement', 'not specified', 'master'),
('webAuthnPolicyUserVerificationRequirementPasswordless', 'not specified', 'cibmtr-bioinformatics-realm'),
('webAuthnPolicyUserVerificationRequirementPasswordless', 'not specified', 'master');

-- --------------------------------------------------------

--
-- Estrutura da tabela `realm_default_groups`
--

DROP TABLE IF EXISTS `realm_default_groups`;
CREATE TABLE IF NOT EXISTS `realm_default_groups` (
  `REALM_ID` varchar(36) NOT NULL,
  `GROUP_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`GROUP_ID`),
  UNIQUE KEY `CON_GROUP_ID_DEF_GROUPS` (`GROUP_ID`),
  KEY `IDX_REALM_DEF_GRP_REALM` (`REALM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `realm_default_roles`
--

DROP TABLE IF EXISTS `realm_default_roles`;
CREATE TABLE IF NOT EXISTS `realm_default_roles` (
  `REALM_ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`ROLE_ID`),
  UNIQUE KEY `UK_H4WPD7W4HSOOLNI3H0SW7BTJE` (`ROLE_ID`),
  KEY `IDX_REALM_DEF_ROLES_REALM` (`REALM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `realm_default_roles`
--

INSERT INTO `realm_default_roles` (`REALM_ID`, `ROLE_ID`) VALUES
('master', '33c455ac-906c-47c4-8bc1-135014aa8efc'),
('cibmtr-bioinformatics-realm', '62880c1c-3e64-48fa-902f-fa8354347ab8'),
('cibmtr-bioinformatics-realm', '932ca70d-a311-42f9-9042-431cef835b9e'),
('cibmtr-bioinformatics-realm', '96c0124c-0f00-4769-8cd3-f7dfd74a0af3'),
('master', 'a91bfa14-c447-4159-9de1-64a51fbf2227');

-- --------------------------------------------------------

--
-- Estrutura da tabela `realm_enabled_event_types`
--

DROP TABLE IF EXISTS `realm_enabled_event_types`;
CREATE TABLE IF NOT EXISTS `realm_enabled_event_types` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_EVT_TYPES_REALM` (`REALM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `realm_events_listeners`
--

DROP TABLE IF EXISTS `realm_events_listeners`;
CREATE TABLE IF NOT EXISTS `realm_events_listeners` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_EVT_LIST_REALM` (`REALM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `realm_events_listeners`
--

INSERT INTO `realm_events_listeners` (`REALM_ID`, `VALUE`) VALUES
('cibmtr-bioinformatics-realm', 'jboss-logging'),
('master', 'jboss-logging');

-- --------------------------------------------------------

--
-- Estrutura da tabela `realm_required_credential`
--

DROP TABLE IF EXISTS `realm_required_credential`;
CREATE TABLE IF NOT EXISTS `realm_required_credential` (
  `TYPE` varchar(255) NOT NULL,
  `FORM_LABEL` varchar(255) DEFAULT NULL,
  `INPUT` bit(1) NOT NULL DEFAULT b'0',
  `SECRET` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `realm_required_credential`
--

INSERT INTO `realm_required_credential` (`TYPE`, `FORM_LABEL`, `INPUT`, `SECRET`, `REALM_ID`) VALUES
('password', 'password', b'1', b'1', 'cibmtr-bioinformatics-realm'),
('password', 'password', b'1', b'1', 'master');

-- --------------------------------------------------------

--
-- Estrutura da tabela `realm_smtp_config`
--

DROP TABLE IF EXISTS `realm_smtp_config`;
CREATE TABLE IF NOT EXISTS `realm_smtp_config` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `realm_smtp_config`
--

INSERT INTO `realm_smtp_config` (`REALM_ID`, `VALUE`, `NAME`) VALUES
('cibmtr-bioinformatics-realm', '', 'auth'),
('cibmtr-bioinformatics-realm', 'phycus-keycloak-sender@phycusapp.com', 'from'),
('cibmtr-bioinformatics-realm', 'PhyCuS-KeyCloak Sender', 'fromDisplayName'),
('cibmtr-bioinformatics-realm', 'app-infra-mailserver', 'host'),
('cibmtr-bioinformatics-realm', '25', 'port'),
('cibmtr-bioinformatics-realm', 'phycus-keycloak-reply@phycusapp.com', 'replyTo'),
('cibmtr-bioinformatics-realm', 'PhyCuS-KeyCloak Reply', 'replyToDisplayName'),
('cibmtr-bioinformatics-realm', '', 'ssl'),
('cibmtr-bioinformatics-realm', '', 'starttls');

-- --------------------------------------------------------

--
-- Estrutura da tabela `realm_supported_locales`
--

DROP TABLE IF EXISTS `realm_supported_locales`;
CREATE TABLE IF NOT EXISTS `realm_supported_locales` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_SUPP_LOCAL_REALM` (`REALM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `redirect_uris`
--

DROP TABLE IF EXISTS `redirect_uris`;
CREATE TABLE IF NOT EXISTS `redirect_uris` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`VALUE`),
  KEY `IDX_REDIR_URI_CLIENT` (`CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `redirect_uris`
--

INSERT INTO `redirect_uris` (`CLIENT_ID`, `VALUE`) VALUES
('0aa176c1-8d28-4a8b-8e97-7e4b49a289ff', '/admin/CIBMTR-BioInformatics-Realm/console/*'),
('1eabef67-6473-4ba8-b07c-14bdbae4aaed', 'dev.localhost.ionic:*'),
('1eabef67-6473-4ba8-b07c-14bdbae4aaed', 'http://172.17.0.1:8080/phycusApp/*'),
('1eabef67-6473-4ba8-b07c-14bdbae4aaed', 'https://172.17.0.1:443/phycusApp/*'),
('3deba736-cf6f-44b8-8022-31f82347cc96', '/realms/master/account/*'),
('7b6ab455-242e-42aa-96d8-9c9e2b74da9d', '/realms/cibmtr-bioinformatics-realm/account/*'),
('ab9a50dd-ef39-46cf-add0-af8ce9a00e61', '/admin/master/console/*'),
('e07da50b-cddc-4524-b630-436a5a6ba8ab', '/realms/CIBMTR-BioInformatics-Realm/account/*'),
('f7123f46-5de8-4c40-8cff-5c52b3e26a84', '/realms/master/account/*');

-- --------------------------------------------------------

--
-- Estrutura da tabela `required_action_config`
--

DROP TABLE IF EXISTS `required_action_config`;
CREATE TABLE IF NOT EXISTS `required_action_config` (
  `REQUIRED_ACTION_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`REQUIRED_ACTION_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `required_action_provider`
--

DROP TABLE IF EXISTS `required_action_provider`;
CREATE TABLE IF NOT EXISTS `required_action_provider` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DEFAULT_ACTION` bit(1) NOT NULL DEFAULT b'0',
  `PROVIDER_ID` varchar(255) DEFAULT NULL,
  `PRIORITY` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_REQ_ACT_PROV_REALM` (`REALM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `required_action_provider`
--

INSERT INTO `required_action_provider` (`ID`, `ALIAS`, `NAME`, `REALM_ID`, `ENABLED`, `DEFAULT_ACTION`, `PROVIDER_ID`, `PRIORITY`) VALUES
('010129ab-92b6-4ca6-be5b-dd4c2d8de094', 'update_user_locale', 'Update User Locale', 'master', b'1', b'0', 'update_user_locale', 1000),
('11df53d6-db4b-431b-b98b-597b2b2a1683', 'UPDATE_PROFILE', 'Update Profile', 'cibmtr-bioinformatics-realm', b'1', b'0', 'UPDATE_PROFILE', 40),
('48580ad7-0872-4219-9fc7-f58f779618ef', 'VERIFY_EMAIL', 'Verify Email', 'cibmtr-bioinformatics-realm', b'1', b'0', 'VERIFY_EMAIL', 50),
('56ade86d-cf97-4480-bcfe-1b6a663ed81b', 'VERIFY_EMAIL', 'Verify Email', 'master', b'1', b'0', 'VERIFY_EMAIL', 50),
('5df55ff2-cabb-4ee7-beaa-42a772f0591e', 'update_user_locale', 'Update User Locale', 'cibmtr-bioinformatics-realm', b'1', b'0', 'update_user_locale', 1000),
('868f0c75-ad4b-4596-b6ad-33d0332fc819', 'CONFIGURE_TOTP', 'Configure OTP', 'cibmtr-bioinformatics-realm', b'1', b'0', 'CONFIGURE_TOTP', 10),
('b0258c22-732b-4dcc-a34a-55bf8c29d5ee', 'UPDATE_PROFILE', 'Update Profile', 'master', b'1', b'0', 'UPDATE_PROFILE', 40),
('b14d365d-53c5-42bb-8fa9-87bc4feda55a', 'terms_and_conditions', 'Terms and Conditions', 'cibmtr-bioinformatics-realm', b'0', b'0', 'terms_and_conditions', 20),
('d36253b3-a135-4627-ad58-ed1294f09475', 'terms_and_conditions', 'Terms and Conditions', 'master', b'0', b'0', 'terms_and_conditions', 20),
('d4cb9a35-3abc-45bd-8661-f4aa70cbeccb', 'UPDATE_PASSWORD', 'Update Password', 'cibmtr-bioinformatics-realm', b'1', b'0', 'UPDATE_PASSWORD', 30),
('e3369e51-3969-466f-83d4-c0ac2856505d', 'CONFIGURE_TOTP', 'Configure OTP', 'master', b'1', b'0', 'CONFIGURE_TOTP', 10),
('f640cfed-177b-4ecc-b349-66810d8b6ce8', 'UPDATE_PASSWORD', 'Update Password', 'master', b'1', b'0', 'UPDATE_PASSWORD', 30);

-- --------------------------------------------------------

--
-- Estrutura da tabela `resource_attribute`
--

DROP TABLE IF EXISTS `resource_attribute`;
CREATE TABLE IF NOT EXISTS `resource_attribute` (
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `RESOURCE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_5HRM2VLF9QL5FU022KQEPOVBR` (`RESOURCE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `resource_policy`
--

DROP TABLE IF EXISTS `resource_policy`;
CREATE TABLE IF NOT EXISTS `resource_policy` (
  `RESOURCE_ID` varchar(36) NOT NULL,
  `POLICY_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`POLICY_ID`),
  KEY `IDX_RES_POLICY_POLICY` (`POLICY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `resource_scope`
--

DROP TABLE IF EXISTS `resource_scope`;
CREATE TABLE IF NOT EXISTS `resource_scope` (
  `RESOURCE_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`SCOPE_ID`),
  KEY `IDX_RES_SCOPE_SCOPE` (`SCOPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `resource_server`
--

DROP TABLE IF EXISTS `resource_server`;
CREATE TABLE IF NOT EXISTS `resource_server` (
  `ID` varchar(36) NOT NULL,
  `ALLOW_RS_REMOTE_MGMT` bit(1) NOT NULL DEFAULT b'0',
  `POLICY_ENFORCE_MODE` varchar(15) NOT NULL,
  `DECISION_STRATEGY` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `resource_server`
--

INSERT INTO `resource_server` (`ID`, `ALLOW_RS_REMOTE_MGMT`, `POLICY_ENFORCE_MODE`, `DECISION_STRATEGY`) VALUES
('1eabef67-6473-4ba8-b07c-14bdbae4aaed', b'1', '2', 1),
('98ae8603-4547-4218-8fb9-ebc550a0e10b', b'0', '0', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `resource_server_perm_ticket`
--

DROP TABLE IF EXISTS `resource_server_perm_ticket`;
CREATE TABLE IF NOT EXISTS `resource_server_perm_ticket` (
  `ID` varchar(36) NOT NULL,
  `OWNER` varchar(255) DEFAULT NULL,
  `REQUESTER` varchar(255) DEFAULT NULL,
  `CREATED_TIMESTAMP` bigint NOT NULL,
  `GRANTED_TIMESTAMP` bigint DEFAULT NULL,
  `RESOURCE_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) NOT NULL,
  `POLICY_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSR6T700S9V50BU18WS5PMT` (`OWNER`,`REQUESTER`,`RESOURCE_SERVER_ID`,`RESOURCE_ID`,`SCOPE_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG82SSPMT` (`RESOURCE_SERVER_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG83SSPMT` (`RESOURCE_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG84SSPMT` (`SCOPE_ID`),
  KEY `FK_FRSRPO2128CX4WNKOG82SSRFY` (`POLICY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `resource_server_policy`
--

DROP TABLE IF EXISTS `resource_server_policy`;
CREATE TABLE IF NOT EXISTS `resource_server_policy` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `TYPE` varchar(255) NOT NULL,
  `DECISION_STRATEGY` varchar(20) DEFAULT NULL,
  `LOGIC` varchar(20) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
  `OWNER` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSRPT700S9V50BU18WS5HA6` (`NAME`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SERV_POL_RES_SERV` (`RESOURCE_SERVER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `resource_server_policy`
--

INSERT INTO `resource_server_policy` (`ID`, `NAME`, `DESCRIPTION`, `TYPE`, `DECISION_STRATEGY`, `LOGIC`, `RESOURCE_SERVER_ID`, `OWNER`) VALUES
('4b5c72cc-b8b8-4bfc-95ac-61815669f985', 'Default Permission', 'A permission that applies to the default resource type', 'resource', '1', '0', '98ae8603-4547-4218-8fb9-ebc550a0e10b', NULL),
('ad943211-dd2c-4784-92a3-7ad1c524169b', 'Default Policy', 'A policy that grants access only for users within this realm', 'js', '0', '0', '1eabef67-6473-4ba8-b07c-14bdbae4aaed', NULL),
('d50a94d5-1756-434d-b110-4d53eece2e6d', 'Default Permission', 'A permission that applies to the default resource type', 'resource', '1', '0', '1eabef67-6473-4ba8-b07c-14bdbae4aaed', NULL),
('ff09b194-0615-4cfd-9851-74adf540dabd', 'Default Policy', 'A policy that grants access only for users within this realm', 'js', '0', '0', '98ae8603-4547-4218-8fb9-ebc550a0e10b', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `resource_server_resource`
--

DROP TABLE IF EXISTS `resource_server_resource`;
CREATE TABLE IF NOT EXISTS `resource_server_resource` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `ICON_URI` varchar(255) DEFAULT NULL,
  `OWNER` varchar(255) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
  `OWNER_MANAGED_ACCESS` bit(1) NOT NULL DEFAULT b'0',
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSR6T700S9V50BU18WS5HA6` (`NAME`,`OWNER`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SRV_RES_RES_SRV` (`RESOURCE_SERVER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `resource_server_resource`
--

INSERT INTO `resource_server_resource` (`ID`, `NAME`, `TYPE`, `ICON_URI`, `OWNER`, `RESOURCE_SERVER_ID`, `OWNER_MANAGED_ACCESS`, `DISPLAY_NAME`) VALUES
('8134fb27-1541-40b0-bcc2-b17676bdc0d7', 'Default Resource', 'urn:PhycusSHFCApp:resources:default', NULL, '1eabef67-6473-4ba8-b07c-14bdbae4aaed', '1eabef67-6473-4ba8-b07c-14bdbae4aaed', b'0', NULL),
('9e347a4d-ab6b-4075-9d24-23d20dfd30bc', 'Default Resource', 'urn:internal:resources:default', NULL, '98ae8603-4547-4218-8fb9-ebc550a0e10b', '98ae8603-4547-4218-8fb9-ebc550a0e10b', b'0', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `resource_server_scope`
--

DROP TABLE IF EXISTS `resource_server_scope`;
CREATE TABLE IF NOT EXISTS `resource_server_scope` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `ICON_URI` varchar(255) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSRST700S9V50BU18WS5HA6` (`NAME`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SRV_SCOPE_RES_SRV` (`RESOURCE_SERVER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `resource_uris`
--

DROP TABLE IF EXISTS `resource_uris`;
CREATE TABLE IF NOT EXISTS `resource_uris` (
  `RESOURCE_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`VALUE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `resource_uris`
--

INSERT INTO `resource_uris` (`RESOURCE_ID`, `VALUE`) VALUES
('8134fb27-1541-40b0-bcc2-b17676bdc0d7', '/*'),
('9e347a4d-ab6b-4075-9d24-23d20dfd30bc', '/*');

-- --------------------------------------------------------

--
-- Estrutura da tabela `role_attribute`
--

DROP TABLE IF EXISTS `role_attribute`;
CREATE TABLE IF NOT EXISTS `role_attribute` (
  `ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_ROLE_ATTRIBUTE` (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `scope_mapping`
--

DROP TABLE IF EXISTS `scope_mapping`;
CREATE TABLE IF NOT EXISTS `scope_mapping` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`ROLE_ID`),
  KEY `IDX_SCOPE_MAPPING_ROLE` (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `scope_mapping`
--

INSERT INTO `scope_mapping` (`CLIENT_ID`, `ROLE_ID`) VALUES
('7b6ab455-242e-42aa-96d8-9c9e2b74da9d', '21b65e52-b4e3-453e-b0f0-10a44a4a887d'),
('3deba736-cf6f-44b8-8022-31f82347cc96', 'b6e3d2e0-ba1a-4420-84d1-2cf72096fd38');

-- --------------------------------------------------------

--
-- Estrutura da tabela `scope_policy`
--

DROP TABLE IF EXISTS `scope_policy`;
CREATE TABLE IF NOT EXISTS `scope_policy` (
  `SCOPE_ID` varchar(36) NOT NULL,
  `POLICY_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`POLICY_ID`),
  KEY `IDX_SCOPE_POLICY_POLICY` (`POLICY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `username_login_failure`
--

DROP TABLE IF EXISTS `username_login_failure`;
CREATE TABLE IF NOT EXISTS `username_login_failure` (
  `REALM_ID` varchar(36) NOT NULL,
  `USERNAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `FAILED_LOGIN_NOT_BEFORE` int DEFAULT NULL,
  `LAST_FAILURE` bigint DEFAULT NULL,
  `LAST_IP_FAILURE` varchar(255) DEFAULT NULL,
  `NUM_FAILURES` int DEFAULT NULL,
  PRIMARY KEY (`REALM_ID`,`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `user_attribute`
--

DROP TABLE IF EXISTS `user_attribute`;
CREATE TABLE IF NOT EXISTS `user_attribute` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `USER_ID` varchar(36) NOT NULL,
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
  PRIMARY KEY (`ID`),
  KEY `IDX_USER_ATTRIBUTE` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `user_consent`
--

DROP TABLE IF EXISTS `user_consent`;
CREATE TABLE IF NOT EXISTS `user_consent` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(36) NOT NULL,
  `CREATED_DATE` bigint DEFAULT NULL,
  `LAST_UPDATED_DATE` bigint DEFAULT NULL,
  `CLIENT_STORAGE_PROVIDER` varchar(36) DEFAULT NULL,
  `EXTERNAL_CLIENT_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_JKUWUVD56ONTGSUHOGM8UEWRT` (`CLIENT_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`,`USER_ID`),
  KEY `IDX_USER_CONSENT` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `user_consent_client_scope`
--

DROP TABLE IF EXISTS `user_consent_client_scope`;
CREATE TABLE IF NOT EXISTS `user_consent_client_scope` (
  `USER_CONSENT_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`USER_CONSENT_ID`,`SCOPE_ID`),
  KEY `IDX_USCONSENT_CLSCOPE` (`USER_CONSENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `user_entity`
--

DROP TABLE IF EXISTS `user_entity`;
CREATE TABLE IF NOT EXISTS `user_entity` (
  `ID` varchar(36) NOT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `EMAIL_CONSTRAINT` varchar(255) DEFAULT NULL,
  `EMAIL_VERIFIED` bit(1) NOT NULL DEFAULT b'0',
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `FEDERATION_LINK` varchar(255) DEFAULT NULL,
  `FIRST_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `LAST_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `USERNAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CREATED_TIMESTAMP` bigint DEFAULT NULL,
  `SERVICE_ACCOUNT_CLIENT_LINK` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_DYKN684SL8UP1CRFEI6ECKHD7` (`REALM_ID`,`EMAIL_CONSTRAINT`),
  UNIQUE KEY `UK_RU8TT6T700S9V50BU18WS5HA6` (`REALM_ID`,`USERNAME`),
  KEY `IDX_USER_EMAIL` (`EMAIL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `user_entity`
--

INSERT INTO `user_entity` (`ID`, `EMAIL`, `EMAIL_CONSTRAINT`, `EMAIL_VERIFIED`, `ENABLED`, `FEDERATION_LINK`, `FIRST_NAME`, `LAST_NAME`, `REALM_ID`, `USERNAME`, `CREATED_TIMESTAMP`, `SERVICE_ACCOUNT_CLIENT_LINK`, `NOT_BEFORE`) VALUES
('1a038ff7-3be2-4d48-98c8-02dd11750cb0', 'ybolon@nmdp.org', 'ybolon@nmdp.org', b'1', b'1', NULL, 'Yung-Tsi', 'Bolon', 'master', 'yung-tsi.bolon', 1584890579139, NULL, 0),
('2286609b-e45f-49d0-a0de-3194d2e98d6d', 'pbashyal@nmdp.org', 'pbashyal@nmdp.org', b'1', b'1', NULL, 'Pradeep', 'Bashyal', 'master', 'pradeep.bashyal', 1584890661601, NULL, 0),
('4c973896-5761-41fc-8217-07c5d13a004b', 'admin.master@phycusapp.com', 'admin.master@phycusapp.com', b'1', b'1', NULL, 'Super Administrator', 'Master Realm', 'cibmtr-bioinformatics-realm', 'admin.master', 1505479415590, NULL, 1584995660),
('54384ff2-4758-49f5-be96-9a944eafa60f', NULL, 'd498297c-a386-492a-9c0b-af5e044ecaaa', b'0', b'1', NULL, NULL, NULL, 'master', 'admin', 1584832560448, NULL, 0),
('600c76dd-7e28-4067-83a8-8afd8acdadaa', 'reviewer.phycus@phycusapp.com', 'reviewer.phycus@phycusapp.com', b'1', b'1', NULL, 'Reviewer 01', 'Phycus App', 'cibmtr-bioinformatics-realm', 'reviewer.phycus', 1584887928142, NULL, 0),
('688171b4-638a-43df-87c4-c5e85751346f', 'user01.phycus@phycusapp.com', 'user01.phycus@phycusapp.com', b'1', b'1', NULL, 'Registered User 01', 'Phycus App', 'cibmtr-bioinformatics-realm', 'user01.phycus', 1584888389973, NULL, 1585079160),
('70bb6673-d928-4320-87b8-e7b8af6c5a27', 'ext-consumer-api.phycus@phycusapp.com', 'ext-consumer-api.phycus@phycusapp.com', b'1', b'1', NULL, 'External Consumer API', 'Phycus App', 'cibmtr-bioinformatics-realm', 'ext-consumer-api.phycus', 1584888734724, NULL, 0),
('8f57c0d4-2f03-4f33-b3b3-837ed2a147f1', 'scout23df@gmail.com', 'scout23df@gmail.com', b'1', b'1', NULL, 'Andre Luiz', 'Do Nascimento Sousa', 'master', 'andre.nascimento', 1584890439304, NULL, 0),
('a98e7feb-831d-4274-89ba-e5b161165109', NULL, '8e1e22bd-4684-4c59-9512-8dba2c70c824', b'0', b'1', NULL, NULL, NULL, 'cibmtr-bioinformatics-realm', 'service-account-phycusshfcapp', 1584889361885, '1eabef67-6473-4ba8-b07c-14bdbae4aaed', 0),
('b3c1bfae-0a77-48a2-8dba-7b6559b8959f', 'publisher.phycus@phycusapp.com', 'publisher.phycus@phycusapp.com', b'1', b'1', NULL, 'Publisher 01', 'Phycus App', 'cibmtr-bioinformatics-realm', 'publisher.phycus', 1584888054642, NULL, 1585008164),
('c4af4e2f-b432-4c3b-8405-cca86cd5b97b', 'sysadmin.phycus@phycusapp.com', 'sysadmin.phycus@phycusapp.com', b'1', b'1', NULL, 'System Administrator 01', 'Phycus App', 'cibmtr-bioinformatics-realm', 'sysadmin.phycus', 1505479373742, NULL, 0),
('c96b54e0-8164-4004-aec8-025f7af0838c', 'manager.phycus@phycusapp.com', 'manager.phycus@phycusapp.com', b'1', b'1', NULL, 'Manager 01', 'Phycus App', 'cibmtr-bioinformatics-realm', 'manager.phycus', 1584887727848, NULL, 1584998840),
('ed89871e-0db3-4277-8db0-eecec826ad4e', NULL, '9ae8683b-ac54-49d9-8275-8de9cc557612', b'0', b'1', NULL, NULL, NULL, 'cibmtr-bioinformatics-realm', 'service-account-internal', 1584832559671, '98ae8603-4547-4218-8fb9-ebc550a0e10b', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `user_federation_config`
--

DROP TABLE IF EXISTS `user_federation_config`;
CREATE TABLE IF NOT EXISTS `user_federation_config` (
  `USER_FEDERATION_PROVIDER_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`USER_FEDERATION_PROVIDER_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `user_federation_mapper`
--

DROP TABLE IF EXISTS `user_federation_mapper`;
CREATE TABLE IF NOT EXISTS `user_federation_mapper` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `FEDERATION_PROVIDER_ID` varchar(36) NOT NULL,
  `FEDERATION_MAPPER_TYPE` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USR_FED_MAP_FED_PRV` (`FEDERATION_PROVIDER_ID`),
  KEY `IDX_USR_FED_MAP_REALM` (`REALM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `user_federation_mapper_config`
--

DROP TABLE IF EXISTS `user_federation_mapper_config`;
CREATE TABLE IF NOT EXISTS `user_federation_mapper_config` (
  `USER_FEDERATION_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`USER_FEDERATION_MAPPER_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `user_federation_provider`
--

DROP TABLE IF EXISTS `user_federation_provider`;
CREATE TABLE IF NOT EXISTS `user_federation_provider` (
  `ID` varchar(36) NOT NULL,
  `CHANGED_SYNC_PERIOD` int DEFAULT NULL,
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  `FULL_SYNC_PERIOD` int DEFAULT NULL,
  `LAST_SYNC` int DEFAULT NULL,
  `PRIORITY` int DEFAULT NULL,
  `PROVIDER_NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USR_FED_PRV_REALM` (`REALM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `user_group_membership`
--

DROP TABLE IF EXISTS `user_group_membership`;
CREATE TABLE IF NOT EXISTS `user_group_membership` (
  `GROUP_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`GROUP_ID`,`USER_ID`),
  KEY `IDX_USER_GROUP_MAPPING` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `user_group_membership`
--

INSERT INTO `user_group_membership` (`GROUP_ID`, `USER_ID`) VALUES
('ab0947d8-3b91-42a0-81e7-953a3c207316', '4c973896-5761-41fc-8217-07c5d13a004b'),
('c4255caa-6cf7-40fb-8d5a-1b8799a438b8', '4c973896-5761-41fc-8217-07c5d13a004b'),
('a9d6a304-5647-460d-9cb8-9ef4429204aa', '600c76dd-7e28-4067-83a8-8afd8acdadaa'),
('ab0947d8-3b91-42a0-81e7-953a3c207316', '688171b4-638a-43df-87c4-c5e85751346f'),
('f5225541-75da-474a-85b5-206168064336', '70bb6673-d928-4320-87b8-e7b8af6c5a27'),
('f37ebe97-4ebe-4ab2-9582-1a4e61505a2d', 'b3c1bfae-0a77-48a2-8dba-7b6559b8959f'),
('c4255caa-6cf7-40fb-8d5a-1b8799a438b8', 'c4af4e2f-b432-4c3b-8405-cca86cd5b97b'),
('bc2923fc-c800-444f-aae3-63a3a55c2bfe', 'c96b54e0-8164-4004-aec8-025f7af0838c');

-- --------------------------------------------------------

--
-- Estrutura da tabela `user_required_action`
--

DROP TABLE IF EXISTS `user_required_action`;
CREATE TABLE IF NOT EXISTS `user_required_action` (
  `USER_ID` varchar(36) NOT NULL,
  `REQUIRED_ACTION` varchar(255) NOT NULL DEFAULT ' ',
  PRIMARY KEY (`REQUIRED_ACTION`,`USER_ID`),
  KEY `IDX_USER_REQACTIONS` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `user_role_mapping`
--

DROP TABLE IF EXISTS `user_role_mapping`;
CREATE TABLE IF NOT EXISTS `user_role_mapping` (
  `ROLE_ID` varchar(255) NOT NULL,
  `USER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ROLE_ID`,`USER_ID`),
  KEY `IDX_USER_ROLE_MAPPING` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `user_role_mapping`
--

INSERT INTO `user_role_mapping` (`ROLE_ID`, `USER_ID`) VALUES
('33c455ac-906c-47c4-8bc1-135014aa8efc', '1a038ff7-3be2-4d48-98c8-02dd11750cb0'),
('6e9c2f6c-209f-407f-b3ca-514fe7f823a8', '1a038ff7-3be2-4d48-98c8-02dd11750cb0'),
('a91bfa14-c447-4159-9de1-64a51fbf2227', '1a038ff7-3be2-4d48-98c8-02dd11750cb0'),
('aebcd69a-6a42-4790-9d80-6ad44be3f0e3', '1a038ff7-3be2-4d48-98c8-02dd11750cb0'),
('b6e3d2e0-ba1a-4420-84d1-2cf72096fd38', '1a038ff7-3be2-4d48-98c8-02dd11750cb0'),
('33c455ac-906c-47c4-8bc1-135014aa8efc', '2286609b-e45f-49d0-a0de-3194d2e98d6d'),
('6e9c2f6c-209f-407f-b3ca-514fe7f823a8', '2286609b-e45f-49d0-a0de-3194d2e98d6d'),
('a91bfa14-c447-4159-9de1-64a51fbf2227', '2286609b-e45f-49d0-a0de-3194d2e98d6d'),
('aebcd69a-6a42-4790-9d80-6ad44be3f0e3', '2286609b-e45f-49d0-a0de-3194d2e98d6d'),
('b6e3d2e0-ba1a-4420-84d1-2cf72096fd38', '2286609b-e45f-49d0-a0de-3194d2e98d6d'),
('21b65e52-b4e3-453e-b0f0-10a44a4a887d', '4c973896-5761-41fc-8217-07c5d13a004b'),
('354b3a09-47a6-4051-957c-c6a3ee28a190', '4c973896-5761-41fc-8217-07c5d13a004b'),
('932ca70d-a311-42f9-9042-431cef835b9e', '4c973896-5761-41fc-8217-07c5d13a004b'),
('96c0124c-0f00-4769-8cd3-f7dfd74a0af3', '4c973896-5761-41fc-8217-07c5d13a004b'),
('33c455ac-906c-47c4-8bc1-135014aa8efc', '54384ff2-4758-49f5-be96-9a944eafa60f'),
('6e9c2f6c-209f-407f-b3ca-514fe7f823a8', '54384ff2-4758-49f5-be96-9a944eafa60f'),
('a91bfa14-c447-4159-9de1-64a51fbf2227', '54384ff2-4758-49f5-be96-9a944eafa60f'),
('aebcd69a-6a42-4790-9d80-6ad44be3f0e3', '54384ff2-4758-49f5-be96-9a944eafa60f'),
('b6e3d2e0-ba1a-4420-84d1-2cf72096fd38', '54384ff2-4758-49f5-be96-9a944eafa60f'),
('21b65e52-b4e3-453e-b0f0-10a44a4a887d', '600c76dd-7e28-4067-83a8-8afd8acdadaa'),
('354b3a09-47a6-4051-957c-c6a3ee28a190', '600c76dd-7e28-4067-83a8-8afd8acdadaa'),
('62880c1c-3e64-48fa-902f-fa8354347ab8', '600c76dd-7e28-4067-83a8-8afd8acdadaa'),
('76a4f31d-7149-4d92-bfba-654c2cb6c754', '600c76dd-7e28-4067-83a8-8afd8acdadaa'),
('932ca70d-a311-42f9-9042-431cef835b9e', '600c76dd-7e28-4067-83a8-8afd8acdadaa'),
('96c0124c-0f00-4769-8cd3-f7dfd74a0af3', '600c76dd-7e28-4067-83a8-8afd8acdadaa'),
('21b65e52-b4e3-453e-b0f0-10a44a4a887d', '688171b4-638a-43df-87c4-c5e85751346f'),
('354b3a09-47a6-4051-957c-c6a3ee28a190', '688171b4-638a-43df-87c4-c5e85751346f'),
('5537c057-dd18-4349-871e-170ca3b0d8c1', '688171b4-638a-43df-87c4-c5e85751346f'),
('62880c1c-3e64-48fa-902f-fa8354347ab8', '688171b4-638a-43df-87c4-c5e85751346f'),
('932ca70d-a311-42f9-9042-431cef835b9e', '688171b4-638a-43df-87c4-c5e85751346f'),
('96c0124c-0f00-4769-8cd3-f7dfd74a0af3', '688171b4-638a-43df-87c4-c5e85751346f'),
('21b65e52-b4e3-453e-b0f0-10a44a4a887d', '70bb6673-d928-4320-87b8-e7b8af6c5a27'),
('354b3a09-47a6-4051-957c-c6a3ee28a190', '70bb6673-d928-4320-87b8-e7b8af6c5a27'),
('62880c1c-3e64-48fa-902f-fa8354347ab8', '70bb6673-d928-4320-87b8-e7b8af6c5a27'),
('8612f4fc-b1fd-43af-8ff8-193a62225bcf', '70bb6673-d928-4320-87b8-e7b8af6c5a27'),
('932ca70d-a311-42f9-9042-431cef835b9e', '70bb6673-d928-4320-87b8-e7b8af6c5a27'),
('96c0124c-0f00-4769-8cd3-f7dfd74a0af3', '70bb6673-d928-4320-87b8-e7b8af6c5a27'),
('33c455ac-906c-47c4-8bc1-135014aa8efc', '8f57c0d4-2f03-4f33-b3b3-837ed2a147f1'),
('6e9c2f6c-209f-407f-b3ca-514fe7f823a8', '8f57c0d4-2f03-4f33-b3b3-837ed2a147f1'),
('a91bfa14-c447-4159-9de1-64a51fbf2227', '8f57c0d4-2f03-4f33-b3b3-837ed2a147f1'),
('aebcd69a-6a42-4790-9d80-6ad44be3f0e3', '8f57c0d4-2f03-4f33-b3b3-837ed2a147f1'),
('b6e3d2e0-ba1a-4420-84d1-2cf72096fd38', '8f57c0d4-2f03-4f33-b3b3-837ed2a147f1'),
('21b65e52-b4e3-453e-b0f0-10a44a4a887d', 'a98e7feb-831d-4274-89ba-e5b161165109'),
('354b3a09-47a6-4051-957c-c6a3ee28a190', 'a98e7feb-831d-4274-89ba-e5b161165109'),
('62880c1c-3e64-48fa-902f-fa8354347ab8', 'a98e7feb-831d-4274-89ba-e5b161165109'),
('932ca70d-a311-42f9-9042-431cef835b9e', 'a98e7feb-831d-4274-89ba-e5b161165109'),
('96c0124c-0f00-4769-8cd3-f7dfd74a0af3', 'a98e7feb-831d-4274-89ba-e5b161165109'),
('caa9819c-d584-4d06-aeee-f0e6bcbc8f7c', 'a98e7feb-831d-4274-89ba-e5b161165109'),
('21a2bc5f-a976-435d-bee4-48b69da694e0', 'b3c1bfae-0a77-48a2-8dba-7b6559b8959f'),
('21b65e52-b4e3-453e-b0f0-10a44a4a887d', 'b3c1bfae-0a77-48a2-8dba-7b6559b8959f'),
('354b3a09-47a6-4051-957c-c6a3ee28a190', 'b3c1bfae-0a77-48a2-8dba-7b6559b8959f'),
('62880c1c-3e64-48fa-902f-fa8354347ab8', 'b3c1bfae-0a77-48a2-8dba-7b6559b8959f'),
('932ca70d-a311-42f9-9042-431cef835b9e', 'b3c1bfae-0a77-48a2-8dba-7b6559b8959f'),
('96c0124c-0f00-4769-8cd3-f7dfd74a0af3', 'b3c1bfae-0a77-48a2-8dba-7b6559b8959f'),
('0e81ebbb-f3d1-4fbd-bfef-72f9b987d6c3', 'c4af4e2f-b432-4c3b-8405-cca86cd5b97b'),
('21b65e52-b4e3-453e-b0f0-10a44a4a887d', 'c4af4e2f-b432-4c3b-8405-cca86cd5b97b'),
('354b3a09-47a6-4051-957c-c6a3ee28a190', 'c4af4e2f-b432-4c3b-8405-cca86cd5b97b'),
('6c47d98c-a723-4053-8e87-762c04a3c72f', 'c4af4e2f-b432-4c3b-8405-cca86cd5b97b'),
('932ca70d-a311-42f9-9042-431cef835b9e', 'c4af4e2f-b432-4c3b-8405-cca86cd5b97b'),
('96c0124c-0f00-4769-8cd3-f7dfd74a0af3', 'c4af4e2f-b432-4c3b-8405-cca86cd5b97b'),
('21b65e52-b4e3-453e-b0f0-10a44a4a887d', 'c96b54e0-8164-4004-aec8-025f7af0838c'),
('2de49c9d-f49d-4740-9efe-60300788a4e7', 'c96b54e0-8164-4004-aec8-025f7af0838c'),
('354b3a09-47a6-4051-957c-c6a3ee28a190', 'c96b54e0-8164-4004-aec8-025f7af0838c'),
('62880c1c-3e64-48fa-902f-fa8354347ab8', 'c96b54e0-8164-4004-aec8-025f7af0838c'),
('932ca70d-a311-42f9-9042-431cef835b9e', 'c96b54e0-8164-4004-aec8-025f7af0838c'),
('96c0124c-0f00-4769-8cd3-f7dfd74a0af3', 'c96b54e0-8164-4004-aec8-025f7af0838c'),
('21b65e52-b4e3-453e-b0f0-10a44a4a887d', 'ed89871e-0db3-4277-8db0-eecec826ad4e'),
('354b3a09-47a6-4051-957c-c6a3ee28a190', 'ed89871e-0db3-4277-8db0-eecec826ad4e'),
('6ceaaca5-30a4-444b-9078-723b7cc13591', 'ed89871e-0db3-4277-8db0-eecec826ad4e'),
('932ca70d-a311-42f9-9042-431cef835b9e', 'ed89871e-0db3-4277-8db0-eecec826ad4e'),
('96c0124c-0f00-4769-8cd3-f7dfd74a0af3', 'ed89871e-0db3-4277-8db0-eecec826ad4e');

-- --------------------------------------------------------

--
-- Estrutura da tabela `user_session`
--

DROP TABLE IF EXISTS `user_session`;
CREATE TABLE IF NOT EXISTS `user_session` (
  `ID` varchar(36) NOT NULL,
  `AUTH_METHOD` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `LAST_SESSION_REFRESH` int DEFAULT NULL,
  `LOGIN_USERNAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `REMEMBER_ME` bit(1) NOT NULL DEFAULT b'0',
  `STARTED` int DEFAULT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  `USER_SESSION_STATE` int DEFAULT NULL,
  `BROKER_SESSION_ID` varchar(255) DEFAULT NULL,
  `BROKER_USER_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `user_session_note`
--

DROP TABLE IF EXISTS `user_session_note`;
CREATE TABLE IF NOT EXISTS `user_session_note` (
  `USER_SESSION` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` text,
  PRIMARY KEY (`USER_SESSION`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `web_origins`
--

DROP TABLE IF EXISTS `web_origins`;
CREATE TABLE IF NOT EXISTS `web_origins` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`VALUE`),
  KEY `IDX_WEB_ORIG_CLIENT` (`CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `web_origins`
--

INSERT INTO `web_origins` (`CLIENT_ID`, `VALUE`) VALUES
('0aa176c1-8d28-4a8b-8e97-7e4b49a289ff', '+'),
('1eabef67-6473-4ba8-b07c-14bdbae4aaed', '*'),
('ab9a50dd-ef39-46cf-add0-af8ce9a00e61', '+');

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `associated_policy`
--
ALTER TABLE `associated_policy`
  ADD CONSTRAINT `FK_FRSR5S213XCX4WNKOG82SSRFY` FOREIGN KEY (`ASSOCIATED_POLICY_ID`) REFERENCES `resource_server_policy` (`ID`),
  ADD CONSTRAINT `FK_FRSRPAS14XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `resource_server_policy` (`ID`);

--
-- Limitadores para a tabela `authentication_execution`
--
ALTER TABLE `authentication_execution`
  ADD CONSTRAINT `FK_AUTH_EXEC_FLOW` FOREIGN KEY (`FLOW_ID`) REFERENCES `authentication_flow` (`ID`),
  ADD CONSTRAINT `FK_AUTH_EXEC_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`);

--
-- Limitadores para a tabela `authentication_flow`
--
ALTER TABLE `authentication_flow`
  ADD CONSTRAINT `FK_AUTH_FLOW_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`);

--
-- Limitadores para a tabela `authenticator_config`
--
ALTER TABLE `authenticator_config`
  ADD CONSTRAINT `FK_AUTH_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`);

--
-- Limitadores para a tabela `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `FK_P56CTINXXB9GSK57FO49F9TAC` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`);

--
-- Limitadores para a tabela `client_attributes`
--
ALTER TABLE `client_attributes`
  ADD CONSTRAINT `FK3C47C64BEACCA966` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`ID`);

--
-- Limitadores para a tabela `client_default_roles`
--
ALTER TABLE `client_default_roles`
  ADD CONSTRAINT `FK_8AELWNIBJI49AVXSRTUF6XJOW` FOREIGN KEY (`ROLE_ID`) REFERENCES `keycloak_role` (`ID`),
  ADD CONSTRAINT `FK_NUILTS7KLWQW2H8M2B5JOYTKY` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`ID`);

--
-- Limitadores para a tabela `client_initial_access`
--
ALTER TABLE `client_initial_access`
  ADD CONSTRAINT `FK_CLIENT_INIT_ACC_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`);

--
-- Limitadores para a tabela `client_node_registrations`
--
ALTER TABLE `client_node_registrations`
  ADD CONSTRAINT `FK4129723BA992F594` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`ID`);

--
-- Limitadores para a tabela `client_scope`
--
ALTER TABLE `client_scope`
  ADD CONSTRAINT `FK_REALM_CLI_SCOPE` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`);

--
-- Limitadores para a tabela `client_scope_attributes`
--
ALTER TABLE `client_scope_attributes`
  ADD CONSTRAINT `FK_CL_SCOPE_ATTR_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `client_scope` (`ID`);

--
-- Limitadores para a tabela `client_scope_client`
--
ALTER TABLE `client_scope_client`
  ADD CONSTRAINT `FK_C_CLI_SCOPE_CLIENT` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`ID`),
  ADD CONSTRAINT `FK_C_CLI_SCOPE_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `client_scope` (`ID`);

--
-- Limitadores para a tabela `client_scope_role_mapping`
--
ALTER TABLE `client_scope_role_mapping`
  ADD CONSTRAINT `FK_CL_SCOPE_RM_ROLE` FOREIGN KEY (`ROLE_ID`) REFERENCES `keycloak_role` (`ID`),
  ADD CONSTRAINT `FK_CL_SCOPE_RM_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `client_scope` (`ID`);

--
-- Limitadores para a tabela `client_session`
--
ALTER TABLE `client_session`
  ADD CONSTRAINT `FK_B4AO2VCVAT6UKAU74WBWTFQO1` FOREIGN KEY (`SESSION_ID`) REFERENCES `user_session` (`ID`);

--
-- Limitadores para a tabela `client_session_auth_status`
--
ALTER TABLE `client_session_auth_status`
  ADD CONSTRAINT `AUTH_STATUS_CONSTRAINT` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `client_session` (`ID`);

--
-- Limitadores para a tabela `client_session_note`
--
ALTER TABLE `client_session_note`
  ADD CONSTRAINT `FK5EDFB00FF51C2736` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `client_session` (`ID`);

--
-- Limitadores para a tabela `client_session_prot_mapper`
--
ALTER TABLE `client_session_prot_mapper`
  ADD CONSTRAINT `FK_33A8SGQW18I532811V7O2DK89` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `client_session` (`ID`);

--
-- Limitadores para a tabela `client_session_role`
--
ALTER TABLE `client_session_role`
  ADD CONSTRAINT `FK_11B7SGQW18I532811V7O2DV76` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `client_session` (`ID`);

--
-- Limitadores para a tabela `client_user_session_note`
--
ALTER TABLE `client_user_session_note`
  ADD CONSTRAINT `FK_CL_USR_SES_NOTE` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `client_session` (`ID`);

--
-- Limitadores para a tabela `component`
--
ALTER TABLE `component`
  ADD CONSTRAINT `FK_COMPONENT_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`);

--
-- Limitadores para a tabela `component_config`
--
ALTER TABLE `component_config`
  ADD CONSTRAINT `FK_COMPONENT_CONFIG` FOREIGN KEY (`COMPONENT_ID`) REFERENCES `component` (`ID`);

--
-- Limitadores para a tabela `composite_role`
--
ALTER TABLE `composite_role`
  ADD CONSTRAINT `FK_A63WVEKFTU8JO1PNJ81E7MCE2` FOREIGN KEY (`COMPOSITE`) REFERENCES `keycloak_role` (`ID`),
  ADD CONSTRAINT `FK_GR7THLLB9LU8Q4VQA4524JJY8` FOREIGN KEY (`CHILD_ROLE`) REFERENCES `keycloak_role` (`ID`);

--
-- Limitadores para a tabela `credential`
--
ALTER TABLE `credential`
  ADD CONSTRAINT `FK_PFYR0GLASQYL0DEI3KL69R6V0` FOREIGN KEY (`USER_ID`) REFERENCES `user_entity` (`ID`);

--
-- Limitadores para a tabela `default_client_scope`
--
ALTER TABLE `default_client_scope`
  ADD CONSTRAINT `FK_R_DEF_CLI_SCOPE_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`),
  ADD CONSTRAINT `FK_R_DEF_CLI_SCOPE_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `client_scope` (`ID`);

--
-- Limitadores para a tabela `federated_identity`
--
ALTER TABLE `federated_identity`
  ADD CONSTRAINT `FK404288B92EF007A6` FOREIGN KEY (`USER_ID`) REFERENCES `user_entity` (`ID`);

--
-- Limitadores para a tabela `group_attribute`
--
ALTER TABLE `group_attribute`
  ADD CONSTRAINT `FK_GROUP_ATTRIBUTE_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `keycloak_group` (`ID`);

--
-- Limitadores para a tabela `group_role_mapping`
--
ALTER TABLE `group_role_mapping`
  ADD CONSTRAINT `FK_GROUP_ROLE_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `keycloak_group` (`ID`),
  ADD CONSTRAINT `FK_GROUP_ROLE_ROLE` FOREIGN KEY (`ROLE_ID`) REFERENCES `keycloak_role` (`ID`);

--
-- Limitadores para a tabela `identity_provider`
--
ALTER TABLE `identity_provider`
  ADD CONSTRAINT `FK2B4EBC52AE5C3B34` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`);

--
-- Limitadores para a tabela `identity_provider_config`
--
ALTER TABLE `identity_provider_config`
  ADD CONSTRAINT `FKDC4897CF864C4E43` FOREIGN KEY (`IDENTITY_PROVIDER_ID`) REFERENCES `identity_provider` (`INTERNAL_ID`);

--
-- Limitadores para a tabela `identity_provider_mapper`
--
ALTER TABLE `identity_provider_mapper`
  ADD CONSTRAINT `FK_IDPM_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`);

--
-- Limitadores para a tabela `idp_mapper_config`
--
ALTER TABLE `idp_mapper_config`
  ADD CONSTRAINT `FK_IDPMCONFIG` FOREIGN KEY (`IDP_MAPPER_ID`) REFERENCES `identity_provider_mapper` (`ID`);

--
-- Limitadores para a tabela `keycloak_group`
--
ALTER TABLE `keycloak_group`
  ADD CONSTRAINT `FK_GROUP_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`);

--
-- Limitadores para a tabela `keycloak_role`
--
ALTER TABLE `keycloak_role`
  ADD CONSTRAINT `FK_6VYQFE4CN4WLQ8R6KT5VDSJ5C` FOREIGN KEY (`REALM`) REFERENCES `realm` (`ID`),
  ADD CONSTRAINT `FK_KJHO5LE2C0RAL09FL8CM9WFW9` FOREIGN KEY (`CLIENT`) REFERENCES `client` (`ID`);

--
-- Limitadores para a tabela `policy_config`
--
ALTER TABLE `policy_config`
  ADD CONSTRAINT `FKDC34197CF864C4E43` FOREIGN KEY (`POLICY_ID`) REFERENCES `resource_server_policy` (`ID`);

--
-- Limitadores para a tabela `protocol_mapper`
--
ALTER TABLE `protocol_mapper`
  ADD CONSTRAINT `FK_CLI_SCOPE_MAPPER` FOREIGN KEY (`CLIENT_SCOPE_ID`) REFERENCES `client_scope` (`ID`),
  ADD CONSTRAINT `FK_PCM_REALM` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`ID`);

--
-- Limitadores para a tabela `protocol_mapper_config`
--
ALTER TABLE `protocol_mapper_config`
  ADD CONSTRAINT `FK_PMCONFIG` FOREIGN KEY (`PROTOCOL_MAPPER_ID`) REFERENCES `protocol_mapper` (`ID`);

--
-- Limitadores para a tabela `realm`
--
ALTER TABLE `realm`
  ADD CONSTRAINT `FK_TRAF444KK6QRKMS7N56AIWQ5Y` FOREIGN KEY (`MASTER_ADMIN_CLIENT`) REFERENCES `client` (`ID`);

--
-- Limitadores para a tabela `realm_attribute`
--
ALTER TABLE `realm_attribute`
  ADD CONSTRAINT `FK_8SHXD6L3E9ATQUKACXGPFFPTW` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`);

--
-- Limitadores para a tabela `realm_default_groups`
--
ALTER TABLE `realm_default_groups`
  ADD CONSTRAINT `FK_DEF_GROUPS_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `keycloak_group` (`ID`),
  ADD CONSTRAINT `FK_DEF_GROUPS_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`);

--
-- Limitadores para a tabela `realm_default_roles`
--
ALTER TABLE `realm_default_roles`
  ADD CONSTRAINT `FK_EVUDB1PPW84OXFAX2DRS03ICC` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`),
  ADD CONSTRAINT `FK_H4WPD7W4HSOOLNI3H0SW7BTJE` FOREIGN KEY (`ROLE_ID`) REFERENCES `keycloak_role` (`ID`);

--
-- Limitadores para a tabela `realm_enabled_event_types`
--
ALTER TABLE `realm_enabled_event_types`
  ADD CONSTRAINT `FK_H846O4H0W8EPX5NWEDRF5Y69J` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`);

--
-- Limitadores para a tabela `realm_events_listeners`
--
ALTER TABLE `realm_events_listeners`
  ADD CONSTRAINT `FK_H846O4H0W8EPX5NXEV9F5Y69J` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`);

--
-- Limitadores para a tabela `realm_required_credential`
--
ALTER TABLE `realm_required_credential`
  ADD CONSTRAINT `FK_5HG65LYBEVAVKQFKI3KPONH9V` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`);

--
-- Limitadores para a tabela `realm_smtp_config`
--
ALTER TABLE `realm_smtp_config`
  ADD CONSTRAINT `FK_70EJ8XDXGXD0B9HH6180IRR0O` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`);

--
-- Limitadores para a tabela `realm_supported_locales`
--
ALTER TABLE `realm_supported_locales`
  ADD CONSTRAINT `FK_SUPPORTED_LOCALES_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`);

--
-- Limitadores para a tabela `redirect_uris`
--
ALTER TABLE `redirect_uris`
  ADD CONSTRAINT `FK_1BURS8PB4OUJ97H5WUPPAHV9F` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`ID`);

--
-- Limitadores para a tabela `required_action_provider`
--
ALTER TABLE `required_action_provider`
  ADD CONSTRAINT `FK_REQ_ACT_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`);

--
-- Limitadores para a tabela `resource_attribute`
--
ALTER TABLE `resource_attribute`
  ADD CONSTRAINT `FK_5HRM2VLF9QL5FU022KQEPOVBR` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `resource_server_resource` (`ID`);

--
-- Limitadores para a tabela `resource_policy`
--
ALTER TABLE `resource_policy`
  ADD CONSTRAINT `FK_FRSRPOS53XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `resource_server_resource` (`ID`),
  ADD CONSTRAINT `FK_FRSRPP213XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `resource_server_policy` (`ID`);

--
-- Limitadores para a tabela `resource_scope`
--
ALTER TABLE `resource_scope`
  ADD CONSTRAINT `FK_FRSRPOS13XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `resource_server_resource` (`ID`),
  ADD CONSTRAINT `FK_FRSRPS213XCX4WNKOG82SSRFY` FOREIGN KEY (`SCOPE_ID`) REFERENCES `resource_server_scope` (`ID`);

--
-- Limitadores para a tabela `resource_server_perm_ticket`
--
ALTER TABLE `resource_server_perm_ticket`
  ADD CONSTRAINT `FK_FRSRHO213XCX4WNKOG82SSPMT` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `resource_server` (`ID`),
  ADD CONSTRAINT `FK_FRSRHO213XCX4WNKOG83SSPMT` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `resource_server_resource` (`ID`),
  ADD CONSTRAINT `FK_FRSRHO213XCX4WNKOG84SSPMT` FOREIGN KEY (`SCOPE_ID`) REFERENCES `resource_server_scope` (`ID`),
  ADD CONSTRAINT `FK_FRSRPO2128CX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `resource_server_policy` (`ID`);

--
-- Limitadores para a tabela `resource_server_policy`
--
ALTER TABLE `resource_server_policy`
  ADD CONSTRAINT `FK_FRSRPO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `resource_server` (`ID`);

--
-- Limitadores para a tabela `resource_server_resource`
--
ALTER TABLE `resource_server_resource`
  ADD CONSTRAINT `FK_FRSRHO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `resource_server` (`ID`);

--
-- Limitadores para a tabela `resource_server_scope`
--
ALTER TABLE `resource_server_scope`
  ADD CONSTRAINT `FK_FRSRSO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `resource_server` (`ID`);

--
-- Limitadores para a tabela `resource_uris`
--
ALTER TABLE `resource_uris`
  ADD CONSTRAINT `FK_RESOURCE_SERVER_URIS` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `resource_server_resource` (`ID`);

--
-- Limitadores para a tabela `role_attribute`
--
ALTER TABLE `role_attribute`
  ADD CONSTRAINT `FK_ROLE_ATTRIBUTE_ID` FOREIGN KEY (`ROLE_ID`) REFERENCES `keycloak_role` (`ID`);

--
-- Limitadores para a tabela `scope_mapping`
--
ALTER TABLE `scope_mapping`
  ADD CONSTRAINT `FK_OUSE064PLMLR732LXJCN1Q5F1` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`ID`),
  ADD CONSTRAINT `FK_P3RH9GRKU11KQFRS4FLTT7RNQ` FOREIGN KEY (`ROLE_ID`) REFERENCES `keycloak_role` (`ID`);

--
-- Limitadores para a tabela `scope_policy`
--
ALTER TABLE `scope_policy`
  ADD CONSTRAINT `FK_FRSRASP13XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `resource_server_policy` (`ID`),
  ADD CONSTRAINT `FK_FRSRPASS3XCX4WNKOG82SSRFY` FOREIGN KEY (`SCOPE_ID`) REFERENCES `resource_server_scope` (`ID`);

--
-- Limitadores para a tabela `user_attribute`
--
ALTER TABLE `user_attribute`
  ADD CONSTRAINT `FK_5HRM2VLF9QL5FU043KQEPOVBR` FOREIGN KEY (`USER_ID`) REFERENCES `user_entity` (`ID`);

--
-- Limitadores para a tabela `user_consent`
--
ALTER TABLE `user_consent`
  ADD CONSTRAINT `FK_GRNTCSNT_USER` FOREIGN KEY (`USER_ID`) REFERENCES `user_entity` (`ID`);

--
-- Limitadores para a tabela `user_consent_client_scope`
--
ALTER TABLE `user_consent_client_scope`
  ADD CONSTRAINT `FK_GRNTCSNT_CLSC_USC` FOREIGN KEY (`USER_CONSENT_ID`) REFERENCES `user_consent` (`ID`);

--
-- Limitadores para a tabela `user_federation_config`
--
ALTER TABLE `user_federation_config`
  ADD CONSTRAINT `FK_T13HPU1J94R2EBPEKR39X5EU5` FOREIGN KEY (`USER_FEDERATION_PROVIDER_ID`) REFERENCES `user_federation_provider` (`ID`);

--
-- Limitadores para a tabela `user_federation_mapper`
--
ALTER TABLE `user_federation_mapper`
  ADD CONSTRAINT `FK_FEDMAPPERPM_FEDPRV` FOREIGN KEY (`FEDERATION_PROVIDER_ID`) REFERENCES `user_federation_provider` (`ID`),
  ADD CONSTRAINT `FK_FEDMAPPERPM_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`);

--
-- Limitadores para a tabela `user_federation_mapper_config`
--
ALTER TABLE `user_federation_mapper_config`
  ADD CONSTRAINT `FK_FEDMAPPER_CFG` FOREIGN KEY (`USER_FEDERATION_MAPPER_ID`) REFERENCES `user_federation_mapper` (`ID`);

--
-- Limitadores para a tabela `user_federation_provider`
--
ALTER TABLE `user_federation_provider`
  ADD CONSTRAINT `FK_1FJ32F6PTOLW2QY60CD8N01E8` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`);

--
-- Limitadores para a tabela `user_group_membership`
--
ALTER TABLE `user_group_membership`
  ADD CONSTRAINT `FK_USER_GROUP_USER` FOREIGN KEY (`USER_ID`) REFERENCES `user_entity` (`ID`);

--
-- Limitadores para a tabela `user_required_action`
--
ALTER TABLE `user_required_action`
  ADD CONSTRAINT `FK_6QJ3W1JW9CVAFHE19BWSIUVMD` FOREIGN KEY (`USER_ID`) REFERENCES `user_entity` (`ID`);

--
-- Limitadores para a tabela `user_role_mapping`
--
ALTER TABLE `user_role_mapping`
  ADD CONSTRAINT `FK_C4FQV34P1MBYLLOXANG7B1Q3L` FOREIGN KEY (`USER_ID`) REFERENCES `user_entity` (`ID`);

--
-- Limitadores para a tabela `user_session_note`
--
ALTER TABLE `user_session_note`
  ADD CONSTRAINT `FK5EDFB00FF51D3472` FOREIGN KEY (`USER_SESSION`) REFERENCES `user_session` (`ID`);

--
-- Limitadores para a tabela `web_origins`
--
ALTER TABLE `web_origins`
  ADD CONSTRAINT `FK_LOJPHO213XCX4WNKOG82SSRFY` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
