library CMPadroesSrvr50;

//    Sistema.Versao := '4.00.08i';

uses
  ComServ,
  CMPadroesSrvr50_TLB in 'CMPadroesSrvr50_TLB.pas',
  DPadroesSrvr50 in 'DPadroesSrvr50.pas' {DtmPadroesSrvr50: TRemoteDataModule} {DtmPadroesSrvr50: CoClass};

exports
  DllGetClassObject,
  DllCanUnloadNow,
  DllRegisterServer,
  DllUnregisterServer;

{$R *.TLB}

{$R *.RES}

begin
end.
{CM$ALT
================================================================================
Histórico de alterações efetuadas no módulo CMPadroesSrvr50
================================================================================
CM$VER      4.00.06i    28/05/2002
--------------------------------------------------------------------------------
- Correção no método GetDataPacket
================================================================================
CM$VER      4.00.05i    28/05/2002
--------------------------------------------------------------------------------
Customização de procedimentos para implementação de contrle de progresso para
"processos bat" a serem executados pela aplicação cliente;
================================================================================
CM$VER      4.00.02i    07/05/2002
--------------------------------------------------------------------------------
- Implementação dos Métodos para Otimização da Classe de Negócio\ Tela do Cadastro de Fornecedor
- Implementação dos Métodos para Otimização da Classe de Negócio\ Tela do Cadastro de Cliente
- Implementação dos Métodos para Otimização da Classe de Negócio\ Tela do Cadastro de Banco
- Implementação dos Métodos para Otimização da Classe de Negócio\ Tela do Cadastro de Agência
================================================================================
CM$VER      4.00.01i    03/05/2002
--------------------------------------------------------------------------------
- Customizações gerais para o modelo "3 Camadas"
================================================================================
CM$VER      4.00.00i    23/04/2002
--------------------------------------------------------------------------------
Liberação da Versão da Aplicação Servidora
================================================================================
CM$ALT}
































