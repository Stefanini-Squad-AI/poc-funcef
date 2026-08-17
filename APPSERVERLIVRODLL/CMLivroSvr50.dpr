library CMLivroSvr50;

uses
  ComServ,
  CMLivroSvr50_TLB in 'CMLivroSvr50_TLB.pas',
  DmLivro in 'DmLivro.pas' {Livro: TRemoteDataModule} {Livro: CoClass},
  uCtrlApuracaoPIS in '..\CMLivroObj50\CtrlObjects\uCtrlApuracaoPIS.pas',
  uCtrlCiap in '..\CMLivroObj50\CtrlObjects\uCtrlCiap.pas',
  uCtrlConvICMS5795 in '..\CMLivroObj50\CtrlObjects\uCtrlConvICMS5795.pas',
  uCtrlEquipamentoECF in '..\CMLivroObj50\CtrlObjects\uCtrlEquipamentoECF.pas',
  uCtrlFSRF6895 in '..\CMLivroObj50\CtrlObjects\uCtrlFSRF6895.pas',
  uCtrlGeraCap in '..\CMLivroObj50\CtrlObjects\uCtrlGeraCap.pas',
  uCtrlGeraCapPis in '..\CMLivroObj50\CtrlObjects\uCtrlGeraCapPis.pas',
  uCtrlGeraCiap in '..\CMLivroObj50\CtrlObjects\uCtrlGeraCiap.pas',
  uCtrlGeraEntrada in '..\CMLivroObj50\CtrlObjects\uCtrlGeraEntrada.pas',
  uCtrlGeraEntradaPis in '..\CMLivroObj50\CtrlObjects\uCtrlGeraEntradaPis.pas',
  uCtrlGeraLivroISS in '..\CMLivroObj50\CtrlObjects\uCtrlGeraLivroISS.pas',
  uCtrlGeraLivroISSdoVHF in '..\CMLivroObj50\CtrlObjects\uCtrlGeraLivroISSdoVHF.pas',
  uCtrlGeraLivroPISdoVHF in '..\CMLivroObj50\CtrlObjects\uCtrlGeraLivroPISdoVHF.pas',
  uCtrlGeraPisSaidaVHL in '..\CMLivroObj50\CtrlObjects\uCtrlGeraPisSaidaVHL.pas',
  uCtrlGiam in '..\CMLivroObj50\CtrlObjects\uCtrlGiam.pas',
  uCtrlLivroICMS in '..\CMLivroObj50\CtrlObjects\uCtrlLivroICMS.pas',
  uCtrlMasterSaf in '..\CMLivroObj50\CtrlObjects\uCtrlMasterSaf.pas',
  uCtrlModeloNF in '..\CMLivroObj50\CtrlObjects\uCtrlModeloNF.pas',
  uCtrlModulo in '..\CMLivroObj50\CtrlObjects\uCtrlModulo.pas',
  uCtrlParamLivro in '..\CMLivroObj50\CtrlObjects\uCtrlParamLivro.pas',
  uCtrlSisif in '..\CMLivroObj50\CtrlObjects\uCtrlSisif.pas',
  uCtrlTerceiros in '..\CMLivroObj50\CtrlObjects\uCtrlTerceiros.pas',
  uCtrlTermolivro in '..\CMLivroObj50\CtrlObjects\uCtrlTermolivro.pas',
  uDbTermolivro in '..\CMLivroObj50\DbObjects\uDbTermolivro.pas',
  uDbCiap in '..\CMLivroObj50\DbObjects\uDbCiap.pas',
  uDbEquipamentoECF in '..\CMLivroObj50\DbObjects\uDbEquipamentoECF.pas',
  uDbModelonf in '..\CMLivroObj50\DbObjects\uDbModelonf.pas',
  uDbNflivro in '..\CMLivroObj50\DbObjects\uDbNflivro.pas',
  uDbNflivrodetalhe in '..\CMLivroObj50\DbObjects\uDbNflivrodetalhe.pas',
  uDbParamapuracao in '..\CMLivroObj50\DbObjects\uDbParamapuracao.pas',
  uDbParamlivro in '..\CMLivroObj50\DbObjects\uDbParamlivro.pas',
  uDbParamlivroxramo in '..\CMLivroObj50\DbObjects\uDbParamlivroxramo.pas',
  uDbApuracaopis in '..\CMLivroObj50\DbObjects\uDbApuracaopis.pas',
  uCtrlApuICMS in '..\LIVROFISCAL\Reports\Source\uCtrlApuICMS.pas';

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
Histórico de alterações efetuadas no módulo Aplicação servidora do Livro Fiscal
================================================================================
CM$VER      3.00.04     26/11/2002
--------------------------------------------------------------------------------
Correção no ImpostoXAlterador
================================================================================
CM$VER      3.00.03     11/09/2002
--------------------------------------------------------------------------------
Incluido o uso da bpl do Livro
================================================================================
CM$VER      3.00.02     28/08/2002
--------------------------------------------------------------------------------
* Acerto na geração da DIRF
================================================================================
CM$ALT}
























