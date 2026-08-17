{
--------------------------------------------------------------------------------------------------
Rotina    : ProcessaBaixaAutomatica e ProcessaBaixaManual
Data      : 22.03.2007
Autor     : Marcus Oliveira
pendência : 24309
Descrição : Passar a observação para o historico de acordo com o parametro contabil
--------------------------------------------------------------------------------------------------
Rotina    : BaixaDocumentos
Data      : 08.02.2007
Autor     : David Ayrolla
pendência : 21696
Descrição : Envio de e-mail na regularização de lançamentos não identificados.
--------------------------------------------------------------------------------
Rotina    : Várias
Data      : 28/11/2006
Autor     : David Ayrolla
Descrição : Implementar chamadas ao Rad+
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
Rotina    : ProcessaBaixaAutomática
Data      : 26/09/2006
Pendência : 23041
Autor     : Andre Tavares
Descrição : Caso haja documentos no lote com parametrização contábil errada (exemplo),
informar seus números na mensagem de erro.
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
Rotina    : BaixaDocumento
Data      : 01/09/2006
Pendência : 23195
Autor     : Andre Tavares
Descrição : Utilizar o float do código de liquidação de baixa se o mesmo estiver preenchido.
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
Rotina    : TCtrlDocumento.LancaRateioContab
Data      : 21/08/2006
Pendência : 22528
Autor     : Andre Tavares
Descrição : Deve constar no histórico contábil o Nº do lote do documento se o mesmo se encontar em um lote
(isso só ocorre se o documento for CAP).
--------------------------------------------------------------------------------
}
{-------------------------------------------------------------------------------
Pendência: 23081
Data     : 17/08/2006
Autor    : Andre Tavares
Descrição: Fazer a baixa dos documentos com o portadorforma original dos documentos.
-------------------------------------------------------------------------------}

//------------------------------------------------------------------------------
//  Autor      : André Tavares
//  Rotina     : Diversas
//  Data       : 30/05/2006
//  Pendência  : 21102
//  Descrição  : Adaptação para fazer o lançamento no cfinan de acordo com o
//  portadorforma de retorno (vide sicob Cef CNAB 240 nota 42)
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
//  Autor      : André Tavares
//  Rotina     : BaixaDocumentos
//  Data       : 11/04/2006
//  Pendência  : 21647
//  Descrição  : Atualiza o campo emisbloc = 'N' na tabela documento no momento
//  da baixa para que seja possíveel fazer operações de lançamento de alteradores, bem como
//  alterações.
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
//  Autor      : André Tavares
//  Rotina     : ValidaDataBaixa
//  Data       : 31/01/2006
//  Pendência  : 21352
//  Descrição  : Permite que se baixe um documento antecipadamente (antecipação de receita).
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
//  Autor      : André Tavares
//  Rotina     : Diversas
//  Data       : 31/01/2006
//  Pendência  : 21352
//  Descrição  : No Cap não estava considerando o float nos lançamentos no Financeiro.
//------------------------------------------------------------------------------
{---------------------------------------------------------------------------------------------------
Rotina    : BaixaDocumento
Data      : 19/01/2005
Autor     : André Tavares
pendência : 21198
Descrição : Se parametrizado no Cfinan, colocar a databaixa da tabela recebpagto igual à data do lançmento não identicficado no financeiro.
{ --------------------------------------------------------------------------------------------------
{---------------------------------------------------------------------------------------------------
Rotina    : BaixaDocumento
Data      : 16/01/2006
Autor     : Rodolpho da Silva
pendência : 21257
Descrição : Passar o id dos relacionamentos aqui, pois na função
            CtrlFinanceiro.GravaRelacionados isso não é mais feito.
{ --------------------------------------------------------------------------------------------------
Rotina    : ProcessaBaixaManual
Data      : 21/12/2005
Autor     : Rodolpho da Silva
Pendência : 20932
Descrição : Contabilizar ou não o alterador conforme cadastro
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : AbreParametros
Data      : 13/12/2005
Autor     : Alex Pereira
Pendência :
Descrição : Criado método único para abertura dos parâmetros do sistema
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : Diversos
Data      : 23/08/2005
Autor     : Alex Pereira
Pendência :
Descrição : Retirado o objeto _LancaContab, que era instanciado e não utilizado.
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : BaixaDocumento
Data      : 08/06/2005
Autor     : Rodolpho da Silva
Pendência : 19038
Descrição : Passar a gravar a data da disponibilidade na baixa de documentos, vindo de todos os módulos
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : BaixaDocuemnto
Data      : 03/05/2005
Autor     : Rodolpho da Silva
Pendência : 17761
Descrição : Mudar status do documento não-identificado gerado no CFinan para "J" (Estorno).
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : DefineDatafloat
Data      : 25/04/2005
Autor     : andré tavares
Pendência : 18693
Descrição : acerto da função AjustaFloat da uctrlDocumento e extinção da função DefineDataFloat.
---------------------------------------------------------------------------------------------------}

{---------------------------------------------------------------------------------------------------
Rotina    : TCtrlDocumento.BaixaDocumento
Data      : 18/02/2005
Autor     : Rodolpho da Silva
Pendência : 18696
Descrição : Ao fazer o recebimento manual o sistema não estava considerando, o parametro considera FLOATS
            para fins de semana, qdo tem feriado subsequente ao fim de semana.          

{---------------------------------------------------------------------------------------------------
Rotina    : TCtrlDocumento.BaixaDocumento
Data      : 15/02/2005
Autor     : Rodolpho da Silva
Pendência : 18584
Descrição : Correção da variável _DataBaixa, pois não estava respeitando os parâmetros cadastrados
            na PARAMCAPCAR

{---------------------------------------------------------------------------------------------------
Rotina    : TCtrlDocumento.BaixaDocumento
Data      : 25/01/2005
Autor     : Fabio Fagundes
Pendência : 17666
Descrição : Gravação da Data de Disponibilidade na Documento qdo módulo de Investimento
            pela funçao Documento.UpdateDataDisponib
{ --------------------------------------------------------------------------------------------------

{ --------------------------------------------------------------------------------------------------
Rotina    : BaixaDocumento
Data      : 14/09/2004
Autor     : andré tavares
Pendência : 16954
Descrição : criação de parâmetro que permite que o float do CAR considere ou não somente os dias úteis.
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : BaixaDocumento
Data      : 24/08/2004
Autor     : Marchetti
Pendência : 14404
Descrição : Passado o parametro com o valor do CODLANCFINANC não identificado para ser gravado na
            tabela RECBTOPAGTO, pois sem esse campo preenchido o processo de exclusão de baixa não
            fazia os updates nas tabelas de forma correta
---------------------------------------------------------------------------------------------------}
{-------------------------------------------------------------------------------
Rotinas   : ProcessoRadLiberado
Data      : 05/07/2004 (Término)
Autor     : David Ayrolla
Pendência : 14646
Descrição : Criação de função que retorna se o documento foi liberado no RAD.
-------------------------------------------------------------------------------}
{---------------------------------------------------------------------------------------------------
Rotina    : ProcessaBaixaAutomatica
Data      : 24/06/2004
Autor     : André Tavares
Pendência : 16855
Descrição : Verifica se o lote já foi baixado antes de processar a baixa.
Isso evita que usuários concorrentes que tenham selecionado o mesmo lote processem a mesma baixa.
----------------------------------------------------------------------------------------------------}
{---------------------------------------------------------------------------------------------------
Rotina    : BaixaDocumento
Data      : 28/04/2004
Autor     : André Tavares
Pendência : 16170 e 3138
Descrição : Ajuste da pendência 3138 e resolução da pendência 16170
----------------------------------------------------------------------------------------------------}
{---------------------------------------------------------------------------------------------------
Rotina    : BaixaDocumento
Data      : 15/01/2004
Autor     : Fabio Fagundes
Pendência : 14177
Descrição : colocado o parâmetro bEstorno no método BaixaDocumento
----------------------------------------------------------------------------------------------------}
{---------------------------------------------------------------------------------------------------
Rotina    : ProcessaBaixaManual
Data      : 02/03/2004
Autor     : Marchetti
Pendência : 16107 e 16119
Descrição : Alteração das datas de lançamento para data de baixa para os documentos não identificados
----------------------------------------------------------------------------------------------------}
{---------------------------------------------------------------------------------------------------
Rotina    : BaixaDocumento
Data      : 15/01/2004
Autor     : Fabio Fagundes
Pendência :
Descrição : Passagem do parametro de Data de Disponibilidade para a função BaixaDocumento
----------------------------------------------------------------------------------------------------}
{---------------------------------------------------------------------------------------------------
Rotina    : BaixaDocumento e ProcessaBaixaManual
Data      : 10/07/2003
Autor     : André Pontes
Pendência : 14177
Descrição : criação do parâmetro bEstorno: Boolean = False, para que o lançamento no financeiro possa
            identificar um estorno, e alterar o histórico de acordo
----------------------------------------------------------------------------------------------------}
{---------------------------------------------------------------------------------------------------
Rotina    : Diversos
Data      : 07/10/2003
Autor     : Alex Pereira
Pendência : 14818
Descrição : Incorporados os fontes do Beraldo devido a erros no conceituais.
            Instruido por Rosane, exitiam problemas na troca do status do campo
            MOVIMFINANC.STATUSCONCILIA
----------------------------------------------------------------------------------------------------}
{---------------------------------------------------------------------------------------------------
Rotina    : BaixaDocumento e Constructor Create
Data      : 13/11/2003
Autor     : Alex Pereira
Pendência : 15631
Descrição : A Propriedade do CtrlFinanceiro.UsaPlanoPatro estava sendo atribuida como false,
            fazendo com que o rateiofinanc ficasse errado.
----------------------------------------------------------------------------------------------------}

unit uCtrlBaixaDocumentos;

interface

Uses SysUtils, Controls, Classes, DbClient, uCmControlObject, uCMTypes, Db, Forms,
     uCtrlDocumento, uCtrlFinanc, DCtrlDocCapCar, uCMSqlParams,
     uCtrlTalaoCheque, uCtrlImpostoRetido, fListaRetencoesMT, uCtrlPadroes,
     dBaseDados, usistema, uCtrlParamIntegra, uDiasUteis, uCtrlMensagens,

     uCtrlRad,
     uCtrlRADPlus;

Const
  QUEBRADELINHA = ( #13 + #10 );
  MSG_ERRO_BAIXALOTE = 'Não foi possível pagar o Lote nº %s, verifique. ';
  MSG_ERRO_VERIFICADATA = 'A data de baixa é menor que a data do lançamento ( %s ). Verifique. ';
  MSG_ERRO_BAIXAMANUAL = 'Não foi possível baixar o lote manual nº %s, verifique. ';




Type

 TEventoBaixa = procedure(vParam: array of Variant) of object;

 TEventoLogFinan = procedure(const sLog: string) of object; // evento para o log do financeiro - pendência 27101

  TCtrlBaixaDocumentos = Class(TCmControlObject)

  private

    //David Ayrolla - Implementar chamadas ao Rad+
    CtrlRad : TCtrlRAD;
    CtrlRadPlus : TCtrlRADPlus;

    _Documento: TCtrlDocumento;
    _Financeiro: TCtrlFinanc;
    _TalaoCheque: TCtrlCheque;
    _ImpostoBaixa: TCtrlImpostoRetido;
    _Padroes: TCtrlPadroes;

    _DtmCtrlDocCapCar: TDtmCtrlDocCapCar;

    //Variáveis obrigatórias para a execuçã do método BaixaDocumento
    _DataBaixa: TDateTime;
    _PlanoConta: Integer;
    _UsaPlanoPatro: Boolean;
    _IntegraContab: Boolean;
    _IdPessoa: Integer;
    _IdUsuarioInclusao: Integer;
    _IdEspAcesso: Integer;

    //Variáveis para controle de contabilização e lançamento no financeiro internas aos
    //processos de baixa
    _CodLancFinanc: Double;
    _PlanilhaBaixa: Integer;


    _LancaBaixaFloat: boolean;
    _CODLANCFINANCnIdent : Integer;

    _TotalBaixa: Double;
    _IdModulo: Integer;
    _RecPag, _DebCred: String;
    _rNumChqBordero: Double;

    _CdsParamCAP,  // Alex aberto apenas em AbreParametros
    _CdsLotes,
    _CdsDocumentos,
    _CdsFazRateioCapCar: TClientDataSet;

    _DataDiferido: TDateTime;
    FNumLancto: Integer;
    FObservacao: string; (* Gustavo - 24/04/2003 *)
    iRegCorr : Integer; //andré tavares - pendência 23195 - para saber o registro corrente dos documentos sendo baixados

    function getPorformaBaixa(const codPortForma: integer): boolean;

    procedure ValidaDataBaixa( iCodDocumento: LongInt; dDataPagto: TDateTime );

    procedure BaixaDocumento(sBDocumento: string;  Var bLancaFinanceiro: Boolean; iNumLote: Integer;
       SistemaLancto: TSistemaLancto; bContabilizaBaixaCheques, bBaixaLotes,
       bPartidaDobrada: Boolean; iNumBaixaRecXPagto: Integer; dDataDisp: TDateTime = 0;
       // André Pontes - 10/07/2003 - pendência 14177
       bEstorno: Boolean = False;
       const bUsaPortFormaRetorno: boolean = false; const iCodPortForma : integer = 0
      );
       // FIM André Pontes - 10/07/2003 - pendência 14177
    procedure SetDadosModulo(SistemaLancto: TSistemaLancto; rValorLanc: Double = 0);
    procedure SetNumLancto(const Value: Integer);

    // Alex 13/12/05
    procedure AbreParametros (const SistemaLancto: TSistemaLancto; const iIdPessoa: integer);
    procedure SetObservacao(const Value: string);

  protected
      procedure AfterInitialize; Override;

  public

    OnBaixa : TEventoBaixa;
    OnLogFinan: TEventoLogFinan;  // evento para o log do financeiro pendência 27101


    Constructor Create;  Override;
    Destructor  Destroy; Override;

    function GetEmptyCdsBaixa(bAddCodAlteradorBaixa: Boolean = false): OleVariant;

    //DAVID - Pendência 14646
    function ProcessoRadLiberado( CodDocumento : Longint ) : boolean;

    function ProcessaBaixaAutomatica( Const ovLotes: OleVariant;
        dDataBaixa: TDateTime; SistemaLancto: TSistemaLancto; bLancaBaixaFloat: Boolean;
        iIdUsuarioInclusao, iIdPessoa, IdEspAcesso, iPLanoContabil: Integer;
        bUsaPlanoPatro, bLancaContab, bPartidaDobrada: Boolean; sRecPag : String
        ): Boolean;

    function ProcessaBaixaManual(bControlaEmissaoCheque: Boolean;
                                 iCodPortForma: Integer;
                                 rNumChqBordero: Double;
                                 Const ovDocumentos: OleVariant;
                                 dDataBaixa: TDateTime;
                                 SistemaLancto: TSistemaLancto;
                                 bLancaBaixaFloat: Boolean;
                                 iIdUsuarioInclusao,
                                 iIdPessoa,
                                 IdEspAcesso,
                                 iPLanoContabil: Integer;
                                 bUsaPlanoPatro,
                                 bLancaContab,
                                 bPartidaDobrada: Boolean;
                                 bCalculaImposto: Boolean;
                                 iNumBaixaRecXPagto: Integer;
                                 iPlnCodigo: Integer = 0;
                                 iCodLancFinanc: Integer = -1;
                                 bLancaFinancBaixa: boolean = True;
                                 dDataDiferido: TDateTime = 0;
                                 CODLANCFINANCnIdent: integer = 0;
                                 dDataDisp: TDateTime = 0;
                                 const bEstorno: Boolean = False;
                                 const bUsaPortFormaRetorno: boolean = false;//andré tavares - pendência 21102 - 24/05/2006
                                 bLancHistContabLoteOrig: boolean = False; // Rodolpho da Silva - P: 22526 - 18/07/2006
                                 sBaixaObservacao: String = '';
                                 const iTotReg: integer = 0
                                ) : Boolean; (* Gustavo - 24/04/2003 *)

    function UpdateEmissBloq(const coddocumento: double): Boolean;

    //andré tavares - pendeência 21601 - 24/08/2006
    //verifica se existe relacionamento portadorConta X Plano relacionado a um portadorforma
    Function VerificaPortadorContaXPlano(const coddocumento: int64;
                                         const codportForma: integer): Boolean;

    property PlnCodigoBaixa      : Integer   read _PlanilhaBaixa;
    property CodLancFinancBaixa  : Double    read _CodLancFinanc;
    property NumLancto           : Integer   read FNumLancto      write SetNumLancto;
    //Marcus
    property Observacao          : string   read FObservacao write SetObservacao;

  end;




implementation

uses uDataBase, JclMath;

{ TCtrlBaixaDocumentos }

procedure TCtrlBaixaDocumentos.AfterInitialize;
begin
  inherited;
  _Documento.InitializeAs(Self);
  _Documento.OpenTransaction := false;

  _Financeiro.InitializeAs(Self);
  _Financeiro.OpenTransaction := false;

  _TalaoCheque.InitializeAs(Self);
  _TalaoCheque.OpenTransaction := false;

  _ImpostoBaixa.InitializeAs(Self);
  _ImpostoBaixa.OpenTransaction := false;

  _Padroes.InitializeAs(Self);
  _Padroes.OpenTransaction := false;

  //David Ayrolla - Implementar chamadas ao Rad+
  CtrlRAD.InitializeAs(Self);
  CtrlRAD.OpenTransaction := false;
  CtrlRADPlus.InitializeAs(Self);
  CtrlRADPlus.OpenTransaction := false;

end;




procedure TCtrlBaixaDocumentos.BaixaDocumento(sBdocumento: string; Var bLancaFinanceiro: Boolean; iNumLote: Integer;
  SistemaLancto: TSistemaLancto; bContabilizaBaixaCheques, bBaixaLotes, bPartidaDobrada: Boolean;
  iNumBaixaRecXPagto: Integer; dDataDisp: TDateTime = 0;
  // André Pontes - 10/07/2003 - pendência 14177
  bEstorno: Boolean = False;
  const bUsaPortFormaRetorno: boolean = false; const iCodPortForma : integer = 0
  );
  // FIM André Pontes - 10/07/2003 - pendência 14177
Var
   DataFloat, dDataBaixa : TDateTime;
   rValorlanc            : Double;
   iNumLancto, iDiasFloat: LongInt;
   sHistAdto,sContabaixa,
   sNumcheque, sHstAux   : String;
   Marca                 : TbookMark;
   bInsereLanc           : Boolean;
   iNumLoteManual        : Integer;
   iAuxLotes             : Integer;
   //Iferreira Pendencia 27308
   _CdsDocEstornado,
   _CdsRateioFinanc,
   _CdsLote              : TClientDataSet; // andre tavares - pendência 19170
   sSubContaNaoIdent     : Integer;
   //08/10/03 - Alex - Pend 14818 - incorporando fontes beraldo
   sCampoXouN            : String;
   CODLANCFINANCEstorno  : Double;
   //fim 08/10/03 - Alex - Pend 14818 - incorporando fontes beraldo

   // Rodolpho da Silva - P: 21257 - 16/01/2006
   fIdRelacionani: Double;

begin
   if ( assigned(self.OnLogFinan) ) and ( trim(_CdsParamCap.fieldByName('FLGGERALOGFINAN').asString) = 'S' ) then
     _Financeiro.onlLogFinan := self.OnLogFinan;  //evento para gravar o log do financeiro - pendência 27101

   sHstAux    := ''; // andre tavares - pendência 19170
   RvalorLanc := _CdsDocumentos.FieldByName('VALOR').AsFloat;

   // Rodolpho da Silva - P: 21257 - 16/01/2006
   fIdRelacionani := 0;


   // Se for um lançamento de adiantamento...
   if _CdsDocumentos.FieldByName('OPERACAO').AsString = '14' then
   Begin
     _Documento.Prepare( OpLanctoDocum, odlBaixaAdiantamento );

     // 25/06/2008 - 28197 André tavares - para consertar o erro "insufficient memory for this operation"
     _Cds.Close;

     // 08/10 - Alex - Pend 14818 - incorporando fontes beraldo
     _Cds.Data  := GetDataPacket( 'SELECT NUMLANCTO, HISTORICOCOMPL FROM LANCTODOCUM WHERE OPERACAO = 14 AND CODDOCUMENTO = ' + _CdsDocumentos.FieldByName('CODDOCUMENTO').AsString );
     iNumLancto := _Cds.fieldbyname('NUMLANCTO').AsInteger;
     // 08/10 - Alex - Pend 14818 - incorporando fontes beraldo
     sHistAdto  := _Cds.fieldbyname('HISTORICOCOMPL').AsString;
     _Cds.Close;

     bInsereLanc := false;
   end
   else
   begin
     _Documento.Prepare( OpLanctoDocum, odlBaixa );
     iNumLancto := 0;
     // 08/10 - Alex - Pend 14818 - incorporando fontes beraldo

     //Marcus P. 22240 06/10/06 Inicio
   if ( ((_CdsDocumentos.FieldByName('OPERACAO').AsString) = '2') or ((_CdsDocumentos.FieldByName('OPERACAO').AsString) = '3')) then
     sHistAdto  := sHistAdto + ' ' + observacao 
     else
       sHistAdto   := '';

     //Marcus P. 22240 06/10/06 Fim
     bInsereLanc := true;
   end;

   //cátia p:22474 01/06/2006
   _Documento.CodDocumento := _CdsDocumentos.FieldByName('CODDOCUMENTO').AsFloat;

   _Documento.PartidaDobrada := bPartidaDobrada;
   // Validação do debcre de acordo com o sistema de origem do lançamentos para lançamentos de baixa
   SetDadosModulo( SistemaLancto, rValorLanc );

   _Documento.IdEspAcesso   := _IdEspAcesso;
   _Documento.IdUsuario     := _IdUsuarioInclusao;
   _Documento.IdModulo      := _IdModulo;
   _Documento.UsaPlanoPatro := _UsaPlanoPatro;

   _Documento.UpdateDataDisponib(_CdsDocumentos.FieldByName('CODDOCUMENTO').AsInteger,dDataDisp);


   // 13/11/03 Alex Pend 15631 - Na criação do CFINAN pela baixa de um CAR não
   // estava gerando os rateiofinanc corretos.
   _Financeiro.UsaPlanoPatro := _UsaPlanoPatro;
   rValorLanc := Abs(rValorLanc);

   if bBaixaLotes then
   begin
      if Not _CdsDocumentos.FieldByName('NUMCHQBORDERO').IsNull  then
         sNumcheque := _CdsDocumentos.FieldByName('NUMCHQBORDERO').AsString
      else
         snumcheque := IntToStr(iNumLote);

      iNumLoteManual := 0;
      iAuxLotes      := inumlote
   end
   else
   begin
      snumcheque     := FloatToStr(_rNumChqBordero);
      iNumLoteManual := iNumLote;
      iAuxLotes := 0;
   end;


   // Efetivação do lançamento verificando parâmetros da portador forma
   If _LancaBaixaFloat Then
      iDiasFloat := _DtmCtrlDocCapCar.CdsPortForma.FieldByName('DMAIS').AsInteger
   Else
      iDiasFloat := 0;

   {* Clementino - 25/04/2003 *}
   sSubContaNaoIdent := 0;
   sContabaixa := '';

   If ( _DtmCtrlDocCapCar.CdsPortForma.FieldByName('FLGCONTABEMISCHQ').AsString = 'S' ) And
      ( Trim( _DtmCtrlDocCapCar.CdsPortForma.FieldByName('PLACONTACONTABCHQ').AsString ) <> '' ) And
      ( bContabilizaBaixaCheques ) Then
       sContabaixa := _DtmCtrlDocCapCar.CdsPortForma.FieldByName('PLACONTACONTABCHQ').AsString
   Else
   begin
       if ( _CODLANCFINANCnIdent > 0 ) then
       begin
         // 25/06/2008 - 28197 André tavares - para consertar o erro "insufficient memory for this operation"
         _Cds.Close;

         _Cds.Data := GetDataPacket('SELECT CONTALANCNAOIDENT, SUBCONTANAOIDENT FROM PARAMFINANC WHERE IDPESSOA = ' + IntToStr(_IdPessoa));
         If Not _Cds.IsEmpty Then
         Begin
            sContabaixa       := _Cds.FieldByName('CONTALANCNAOIDENT').AsString;
            sSubContaNaoIdent := _Cds.FieldByName('SUBCONTANAOIDENT').AsInteger;
            // 25/06/2008 - 28197 André tavares - para consertar o erro "insufficient memory for this operation"
            _Cds.Close;
         End
         Else
         Begin
            sContabaixa       := '';
            sSubContaNaoIdent := 0;
         End;
       end
   end;
   {* Clementino - 25/04/2003 *}
   _Documento.Lote.NumLote := iAuxLotes;




  //  Início - Rodolpho da Silva - P: 18584 - 14/02/2005
   dDataBaixa        := _DataBaixa;

   if (_CdsDocumentos.FindField('FLOATFORMAPAG') <> nil) and (_CdsDocumentos.FieldByName('FLOATFORMAPAG').asString <> '') and
      (_CdsDocumentos.FieldByName('FLOATFORMAPAG').AsInteger <> 0) then //andre tavares - 01/09/2006 - pendência 23195 - se este float estiver preenchido
     DataFloat := dDataBaixa + _CdsDocumentos.FieldByName('FLOATFORMAPAG').asInteger
   else
     DataFloat := dDataBaixa + _DtmCtrlDocCapCar.CdsPortForma.FieldByName('DMAIS').AsInteger;

   //início - andré tavares - pendência 23195 08/12/2006 - uma nova planilha será aberta se mudar a data
   if trunc(_CodLancFinanc) = 0 then
   begin
     _PlanilhaBaixa := 0;
   end;
   //fim - andré tavares - pendência 23195 08/12/2006 - uma nova planilha será aberta se mudar a data


   if (ParamIntegra.RecPag = 'R') then
   begin
       //  Verifica se o flg que indica  que o Float só pode cair em dias
       //úteis, está ativado e se estiver, ajusta a data do Float...
       if (_CdsParamCap.fieldByName('FLGFLOATDIAUTIL').asInteger = 1) then
          //início - André tavares - pendência 18693 -25/04/2005

       if (_CdsDocumentos.FindField('FLOATFORMAPAG') <> nil) and (_CdsDocumentos.FieldByName('FLOATFORMAPAG').asInteger > 0) then //andre tavares - 01/09/2006 - pendência 23195 - se este float estiver preenchido
         DataFloat := _Documento.AjustaDataFloat(dDataBaixa, _CdsDocumentos.FieldByName('FLOATFORMAPAG').asInteger, SistemaLancto)
       else
         DataFloat := _Documento.AjustaDataFloat(dDataBaixa, _DtmCtrlDocCapCar.CdsPortForma.FieldByName('DMAIS').AsInteger, SistemaLancto)

          //fim - André tavares - pendência 18693 -25/04/2005
   end
   //início - andre tavares - pendência 21352 - deve-se chamar a rotina ajuatadatafloat também para o CAR
   else begin
     if (_CdsDocumentos.FindField('FLOATFORMAPAG') <> nil) and (_CdsDocumentos.FieldByName('FLOATFORMAPAG').asInteger > 0) then //andre tavares - 01/09/2006 - pendência 23195 - se este float estiver preenchido
       DataFloat := _Documento.AjustaDataFloat(dDataBaixa, _CdsDocumentos.FieldByName('FLOATFORMAPAG').asInteger, SistemaLancto)
     else
       DataFloat := _Documento.AjustaDataFloat(dDataBaixa, _DtmCtrlDocCapCar.CdsPortForma.FieldByName('DMAIS').AsInteger, SistemaLancto)
   end;
   //fim - andre tavares - pendência 21352



   //  Se ativado o flg, considera a data da baixa semelhante à do Float
   if (_CdsParamCap.fieldByName('FLGLANCAFLOAT').AsString = 'S') then
      dDataBaixa := DataFloat;


   _Documento.Lanctodocum.SetValues(dDataBaixa,
                                    _CdsDocumentos.FieldByName('CODDOCUMENTO').AsInteger,
                                    iNumLancto,
                                    rValorLanc,
                                    0,
                                    rValorLanc,
                                    0,
                                    _PlanilhaBaixa,
                                    iNumLoteManual,
                                    _IdUsuarioInclusao,
                                    _IdPessoa,
                                    0,
                                    0,
                                    _CdsDocumentos.FieldByName('CODTIPDOC').AsInteger,
                                    0,
                                    0,
                                    '',
                                    sNumCheque,
                                    '',
                                    '',
                                    sHistAdto,
                                    '',
                                    '',
                                    '',
                                    _DebCred,
                                    _IdModulo,
                                    _PlanoConta,
                                    _UsaPlanoPatro,
                                    _IntegraContab,
                                    _DtmCtrlDocCapCar.CdsPortForma.FieldByName('CODPORTFORMA').AsInteger,
                                    0,
                                    sContabaixa,
                                    sSubContaNaoIdent);

   If bInsereLanc then
   begin
      if not _Documento.Insert then raise Exception.Create( _Documento.MessageInfo );
   end
   Else
      if not _Documento.Update then raise Exception.Create( _Documento.MessageInfo );

   fNumLancto     := _Documento.Lanctodocum.NumLancto;
   _PlanilhaBaixa := _Documento.PlnCodigo;

   //  Início do processo de gravação no financeiro
   // Se gravar no Financeiro
   If (_DtmCtrlDocCapCar.CdsPortForma.FieldByName('LancaFinanc').AsString = 'S') Then
   Begin
       // início - andre tavares - pendência 19170 -
       // para verificar se o documento está em um lote
       _CdsLote := TClientDataSet.Create(nil);
       try
         _CdsLote.Data := getDataPacket(' SELECT L.FLAGCANCEL, L.NUMLOTE FROM LOTEPAGTO L, LOTEXDOCUM LX '+
                                        ' WHERE  L.NUMLOTE = LX.NUMLOTE AND  LX.CODDOCUMENTO = '+ _CdsDocumentos.FieldByName('CODDOCUMENTO').AsString);

         if not _CdsLote.IsEmpty then
           sHstAux := 'Baixa do Lote Nº: '+ intToStr(iNumLote) //Este histórico é pro movimento financeiro
         else
           sHstAux := '';
       finally
         // 25/06/2008 - 28197 André tavares - para consertar o erro "insufficient memory for this operation"
         _CdsLote.Close;

         _CdsLote.Free;
       end;
       // fim - andre tavares - pendência 19170

       if bLancaFinanceiro then
       Begin
          Marca := _CdsDocumentos.GetBookMark;
          _CdsFazRateioCapCar.Data := _CdsDocumentos.Data;
          _CdsFazRateioCapCar.EmptyDataSet;

          if bUsaPortFormaRetorno then
          begin
            _CdsDocumentos.Filtered := false;
            _CdsDocumentos.Filter   := ' CODPORTFORMA = '+ intToStr(iCodPortForma);
            _CdsDocumentos.Filtered := true;
          end;

          _CdsDocumentos.First;
          While not _CdsDocumentos.eof do
          begin
            MoveFields(_CdsDocumentos, _CdsFazRateioCapCar, OpInserir, false);
            _CdsDocumentos.next;
          end;

          if bUsaPortFormaRetorno then
          begin
            _CdsDocumentos.Filtered := false;
          end;

          _CdsDocumentos.Gotobookmark(Marca); (* Gustavo Viegas - 24/04/2003 *)
          _CdsDocumentos.freebookmark(Marca); (* Gustavo Viegas - 24/04/2003 *)

          _CdsFazRateioCapCar.First;

          if ( _CdsDocumentos.FieldByName('OPERACAO').AsString = '14' ) then
              _Documento.UpdateStatusBaixaAdianto( _CdsDocumentos.FieldByName('CODDOCUMENTO').AsInteger, _PlanilhaBaixa,
              iNumLancto, dDataBaixa, SistemaLancto );


          // 08/10/03 - Alex - incorporando fontes beraldo
          sCampoXouN := 'N';
          if _CODLANCFINANCnIdent > 0 then
          begin
             sCampoXouN := 'X';
             // 19/02/2004 - Pendência 16119 - Gravação da data de conciliação

             //  Rodolpho da Silva - P: 17761 - 03/05/2005
             _Financeiro.MudaStatusConcilia('J', dDataBaixa, _CODLANCFINANCnIdent);
             // Fim Pendência 16119
          end;
          // fim 08/10/03 - Alex - incorporando fontes beraldo

          if ( _DataDiferido > 0 ) then (* Gustavo - 24/04/2003 *)
          begin
            // 08/10/03 - Alex - Pend 14818 - incorporando fontes beraldo
            if not _Financeiro.FazerRateioCAPCAR(_CdsFazRateioCapCar.Data,
                                                 sCampoXouN,
                                                 snumcheque,
                                                 _RecPag,
                                                 _DataDiferido,
                                                 iAuxLotes,
                                                 _DtmCtrlDocCapCar.CdsPortForma.FieldByName('CODPORTFORMA').AsFloat,
                                                 _CodLancFinanc,
                                                 _IdPessoa,
                                                 _IdModulo,
                                                 _IdUsuarioInclusao,
                                                 _PlanoConta,
                                                 bEstorno,
                                                 _IntegraContab,
                                                 dDataDisp,
                                                 dDataBaixa,
                                                 sHstAux) then
               raise Exception.Create( _Financeiro.MessageInfo ); (* Gustavo - 24/04/2003 *)
            _DataDiferido := 0; (* Gustavo - 24/04/2003 *)
          end
          else
            // 08/10/03 - Alex - Pend 14818 - incorporando fontes beraldo
            if not _Financeiro.FazerRateioCAPCAR(_CdsFazRateioCapCar.Data,
                                                 sCampoXouN,
                                                 snumcheque,
                                                 _RecPag,
                                                 DataFloat,
                                                 iAuxLotes,
                                                 _DtmCtrlDocCapCar.CdsPortForma.FieldByName('CODPORTFORMA').AsFloat,
                                                 _CodLancFinanc,
                                                 _IdPessoa,
                                                 _IdModulo,
                                                 _IdUsuarioInclusao,
                                                 _PlanoConta,
                                                 bEstorno,
                                                 _IntegraContab,
                                                 dDataDisp,
                                                 dDataBaixa,
                                                 sHstAux) then
               raise Exception.Create( _Financeiro.MessageInfo );
          _CdsFazRateioCapCar.Close;

          {* Clementino - 25/04/2003 *}

          if _CODLANCFINANCnIdent > 0 then
          begin
             _cds.close; // 25/06/2008 - 28197 André tavares - para consertar o erro "insufficient memory for this operation"

             // Grava relacionados no Financeiro
             _Cds.Data := GetDataPacket(_Financeiro.sSqlRelacionados);

             // Rodolpho da Silva - P: 21257 - 16/01/2006
             fIdRelacionani := GetSequence('RELACIONANI');

             _Cds.Append;
             _Cds.FieldByName('CODLANCFINANC').AsFloat := _CODLANCFINANCnIdent;

             // 19/02/2004 - Pendência 16107 - Gravação da data de conciliação
             _Cds.FieldByName('DATADISP').AsDateTime := _DataBaixa;
             _Cds.FieldByName('FLGNI').AsString      := 'I';

             // Rodolpho da Silva - P: 21257 - 16/01/2006
             _Cds.FieldByName('IDRELACIONANI').AsFloat := fIdRelacionani;

             // Rodolpho da Silva - P: 24574 - 01/03/2007
             _Cds.FieldByName('IDMODORIGEMREGU').AsFloat := _IdModulo;


             _Cds.Post;
             _Cds.Append;
             _Cds.FieldByName('CODLANCFINANC').AsFloat := _CodLancFinanc;
             _Cds.FieldByName('DATADISP').AsDateTime   := dDataDisp;
             _Cds.FieldByName('FLGNI').AsString        := 'N';

             // Rodolpho da Silva - P: 21257 - 16/01/2006
             _Cds.FieldByName('IDRELACIONANI').AsFloat := fIdRelacionani;

             // Rodolpho da Silva - P: 24574 - 01/03/2007
             _Cds.FieldByName('IDMODORIGEMREGU').AsFloat := _IdModulo;


             _Cds.Post;
             if not _Financeiro.GravaRelacionados(_Cds.Data) then
               raise Exception.Create( _Financeiro.MessageInfo );

             CODLANCFINANCEstorno := _CODLANCFINANCnIdent;
             //Muda o Status do Lançamento da baixa para J

             //Iferreira Pendencia 27308
             _CdsDocEstornado := TClientDataSet.Create(nil);
             try
               _CdsDocEstornado.Data := GetDataPacket('SELECT ROWID FROM MOVIMFINANC WHERE CODLANCFINANC = '+IntToStr(_CODLANCFINANCnIdent)+' AND FLGESTORNADO IS NULL ');
               if not _CdsDocEstornado.Eof then
               begin
                 _Financeiro.MudaStatusConcilia('J', DataFloat, _CODLANCFINANCnIdent);

                 if not _Financeiro.EstornoFinanceiro(dDataBaixa,
                                                      dDataDisp,
                                                      True,
                                                      CODLANCFINANCEstorno,
                                                      _IdPessoa,
                                                      _IdModulo,
                                                      _IdUsuarioInclusao,
                                                      _PlanoConta,
                                                      _IntegraContab) then
                   raise Exception.Create( _Financeiro.MessageInfo );
               end;
               _CdsDocEstornado.Close;
             finally
               FreeAndNil(_CdsDocEstornado);
             end;
             // fim 08/10/03 - Alex - Pend 14818 - incorporando fontes beraldo
          end;
          {* Clementino - 25/04/2003 *}

          bLancaFinanceiro := False;
       End
        else
           if ( _CdsDocumentos.FieldByName('OPERACAO').AsString = '14' ) then
            _Documento.UpdateStatusBaixaAdianto( _CdsDocumentos.FieldByName('CODDOCUMENTO').AsInteger, _PlanilhaBaixa,
            iNumLancto, dDataBaixa, SistemaLancto ); (* Gustavo Viegas - 24/04/2003 *)
   end
   //  Fim do processo de gravação no financeiro

   else
      if ( _CdsDocumentos.FieldByName('OPERACAO').AsString = '14' ) then
       _Documento.UpdateStatusBaixaAdianto(_CdsDocumentos.FieldByName('CODDOCUMENTO').AsInteger,
                                           _PlanilhaBaixa,
                                           iNumLancto,
                                           dDataBaixa,
                                           SistemaLancto );


   If iNumLancto = 0 Then
      iNumLancto := _Documento.Lanctodocum.NumLancto;

   //início - andré tavares - 18/01/2006 - pendência 21198
{
   with TclientDataset.Create(nil) do
   begin
     try
       Data := GetDataPacket( ' SELECT NVL(FLGALTDTBAIXA, ''N'') AS FLGALTDTBAIXA FROM PARAMFINANC WHERE IDPESSOA = '+ intToStr(_IDPessoa) );
       if (fieldByName('FLGALTDTBAIXA').asString = 'S') and (_CODLANCFINANCnIdent > 0) then
       begin
         data := GetDataPacket(' SELECT DATALANCFINAN FROM MOVIMFINANC WHERE CODLANCFINANC = '+ intTostr(_CODLANCFINANCnIdent) );
         _DataBaixa := fieldByName('DATALANCFINAN').asDateTime;
       end;
     finally
       close; // 25/06/2008 - 28197 André tavares - para consertar o erro "insufficient memory for this operation"
       free;
     end;
   end;
}
   try
     _cds.close; // 25/06/2008 - 28197 André tavares - para consertar o erro "insufficient memory for this operation"
     _cds.Data := GetDataPacket( ' SELECT NVL(FLGALTDTBAIXA, ''N'') AS FLGALTDTBAIXA FROM PARAMFINANC WHERE IDPESSOA = '+ intToStr(_IDPessoa) );
     if (_cds.fieldByName('FLGALTDTBAIXA').asString = 'S') and (_CODLANCFINANCnIdent > 0) then
     begin
       _cds.data := GetDataPacket(' SELECT DATALANCFINAN FROM MOVIMFINANC WHERE CODLANCFINANC = '+ intTostr(_CODLANCFINANCnIdent) );
       _DataBaixa := _cds.fieldByName('DATALANCFINAN').asDateTime;
     end;
   finally
     _cds.close; // 25/06/2008 - 28197 André tavares - para consertar o erro "insufficient memory for this operation"
   end;



   //fim - andré tavares - 18/01/2006 - pendência 21198

   if not _Documento.RecbToPagto.Inserir( _CdsDocumentos.FieldByName('CODDOCUMENTO').AsInteger,
                                         iNumLancto,
                                         _IdUsuarioInclusao,
                                         Trunc(_CodLancFinanc),
                                         _DtmCtrlDocCapCar.CdsPortForma.FieldByName('CODPORTFORMA').AsInteger,
                                         iNumLote,
                                         _CODLANCFINANCnIdent,
                                         iNumBaixaRecXPagto,
                                         sNumCheque,
                                         DateToStr(DataFloat),
                                         DateToStr(_DataBaixa)) then //  Rodolpho da Silva - 24/02/2005 /  Refere-se à uma pendência do André Pontes: 18584
       raise Exception.Create( _Documento.MessageInfo );

   //início - andré tavares - pendência 21647 - 11/04/2006
   UpdateEmissBloq(_CdsDocumentos.FieldByName('CODDOCUMENTO').AsInteger);
   //fim - andré tavares - pendência 21647 - 11/04/2006

   // 08/10/03 - Alex - Pend 14818 - incorporando fontes beraldo
   if bBaixaLotes then
      _Documento.Lote.BaixaDoc( _CdsDocumentos.FieldByName('CODDOCUMENTO').AsInteger, iNumLote)
   else
{
   with TClientDataSet.Create(nil) do
   try
      Data := GetDataPacket('SELECT  LOTE.NUMLOTE, LOTEX.FLGBAIXA ' + #13 +
                            '  FROM  ' + #13 +
                            '   LOTEXDOCUM LOTEX ,  ' + #13 +
                            '   LOTEPAGTO LOTE  ' + #13 +
                            '  WHERE LOTEX.CODDOCUMENTO = '+ _CdsDocumentos.FieldByName('CODDOCUMENTO').AsString + ' AND ' +#13 +
                            '        (LOTEX.FLGBAIXA = '' ''  OR LOTEX.FLGBAIXA IS NULL) AND ' + #13 +
                            '        LOTE.NUMLOTE    = LOTEX.NUMLOTE AND ' + #13 +
                            '        (LOTE.FLAGCANCEL = '' '' OR LOTE.FLAGCANCEL IS NULL)');
      if not isempty then
         _Documento.Lote.BaixaDoc( _CdsDocumentos.FieldByName('CODDOCUMENTO').AsInteger, FieldByName('NumLote').AsInteger);
   finally
     close; // 25/06/2008 - 28197 André tavares - para consertar o erro "insufficient memory for this operation"
      free;
   end;
}
   try
      _cds.close; // 25/06/2008 - 28197 André tavares - para consertar o erro "insufficient memory for this operation"
      _cds.Data := GetDataPacket('SELECT  LOTE.NUMLOTE, LOTEX.FLGBAIXA ' + #13 +
                            '  FROM  ' + #13 +
                            '   LOTEXDOCUM LOTEX ,  ' + #13 +
                            '   LOTEPAGTO LOTE  ' + #13 +
                            '  WHERE LOTEX.CODDOCUMENTO = '+ _CdsDocumentos.FieldByName('CODDOCUMENTO').AsString + ' AND ' +#13 +
                            '        (LOTEX.FLGBAIXA = '' ''  OR LOTEX.FLGBAIXA IS NULL) AND ' + #13 +
                            '        LOTE.NUMLOTE    = LOTEX.NUMLOTE AND ' + #13 +
                            '        (LOTE.FLAGCANCEL = '' '' OR LOTE.FLAGCANCEL IS NULL)');
      if not _cds.isempty then
         _Documento.Lote.BaixaDoc( _CdsDocumentos.FieldByName('CODDOCUMENTO').AsInteger, _cds.FieldByName('NumLote').AsInteger);
   finally
     _cds.close; // 25/06/2008 - 28197 André tavares - para consertar o erro "insufficient memory for this operation"
   end;


   // fim 08/10/03 - Alex - Pend 14818 - incorporando fontes beraldo
end;






constructor TCtrlBaixaDocumentos.Create;
Var
  x : Integer;
begin
  inherited;
  OnLogFinan := nil;

  iRegCorr := 0;
  OnBaixa := nil; //*** andre tavares - 07/12/2006
  _Documento := TCtrlDocumento.Create;

  // by Alex - Pend 15631 - o default para usa planopatro no totalprev é true
  _Financeiro := TCtrlFinanc.Create( 0,0,0,true );
  _TalaoCheque := TCtrlCheque.Create;
  _ImpostoBaixa := TCtrlImpostoRetido.Create;
  _Padroes := TCtrlPadroes.Create;


  _CdsLotes := TClientDataSet.Create(nil);
  _CdsDocumentos := TClientDataSet.Create(nil);
  _CdsParamCAP := TClientDataSet.Create(nil);
  _CdsFazRateioCapCar := TClientDataSet.Create(nil);

  // Cria o DataModulo e atribui ao ControlObject dos SqlParam a Control
  _DtmCtrlDocCapCar := tDtmCtrlDocCapCar.Create(nil);
  For X:=0 To _DtmCtrlDocCapCar.ComponentCount - 1 Do
    If _DtmCtrlDocCapCar.Components[x] is TCMSqlParams Then
      TCMSqlParams(_DtmCtrlDocCapCar.Components[x]).ControlObject := Self;

  _DataDiferido := 0; (* Gustavo - 24/04/2003 *)
  _CODLANCFINANCnIdent := 0; {* Clementino - 25/04/2003 *}
  FNumLancto := 0;

  CtrlRAD := TCtrlRAD.Create;
  CtrlRADPlus := TCtrlRADPlus.Create;
End;




destructor TCtrlBaixaDocumentos.Destroy;
begin
  _Documento.Free;
  _Financeiro.Free;
  _TalaoCheque.Free;
  _ImpostoBaixa.Free;
  _Padroes.Free;

  _CdsLotes.Free;
  _CdsDocumentos.Free;
  _CdsParamCAP.Free;
  _CdsFazRateioCapCar.Free;
  _DtmCtrlDocCapCar.Free;

  CtrlRAD.Free;
  CtrlRADPlus.Free;

  inherited;
end;




function TCtrlBaixaDocumentos.ProcessaBaixaAutomatica( Const ovLotes: OleVariant;
    dDataBaixa: TDateTime; SistemaLancto: TSistemaLancto; bLancaBaixaFloat: Boolean;
    iIdUsuarioInclusao, iIdPessoa, IdEspAcesso, iPLanoContabil: Integer;
    bUsaPlanoPatro, bLancaContab, bPartidaDobrada: Boolean; sRecPag : String
        ): Boolean;
Var
  bLancFinanc, bErro_Baixa: Boolean;
  sFaixa, ssql, sDocs, sBdocumento : string;
// início - andre tavares - pendência 16855 - 24/06/2004
// Esta function verifica se o lote já foi baixado
function isLoteBaixado(NumLote : Extended): Boolean;
var _cdsAux : TClientDataset;
begin
  _cdsAux := TClientDataset.Create(nil);
  try
    _cdsAux.data := GetDataPacket(' SELECT FLAGCANCEL FROM LOTEPAGTO WHERE FLAGCANCEL = ''B'' AND NUMLOTE = '+ floatToStr(NumLote));
  finally
    isLoteBaixado := (_cdsAux.IsEmpty = false);
    _cdsAux.free;
  end;
end;

// fim - andre tavares - pendência 16855 - 24/06/2004

begin
  if ConnectionSide = cnsClient then
  begin

     Result := Connection.AppServer.ProcessaBaixaAutomatica( ovLotes,
           dDataBaixa, Integer(SistemaLancto), bLancaBaixaFloat, iIdUsuarioInclusao,
           iIdPessoa, IdEspAcesso, iPLanoContabil, bUsaPlanoPatro, bLancaContab,
           bPartidaDobrada, sRecPag,
           Observacao );

     if not Result then
       MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
     Try
        StartTransaction;

        // 13/12/2005 Alex Abrir a query de parâmetros um única vez
        AbreParametros (SistemaLancto, iIdPessoa);

        _TotalBaixa := 0;
        _CdsLotes.Data := ovLotes;
        sFaixa := '';
        _CdsLotes.First;
        // início - andre tavares - pendência 16855 - 24/06/2004
        GetDataPacket('SELECT RECPAG FROM PARAMCAP WHERE RECPAG = '+quotedStr(sRecPag)+' FOR UPDATE');
        // fim - andre tavares - pendência 16855 - 24/06/2004
        While Not _CdsLotes.Eof Do
        Begin
           // início - andre tavares - pendência 16855 - 24/06/2004
           if isLoteBaixado(_CdsLotes.FieldByName('NUMLOTE').asFloat) then
             Raise Exception.Create(' O Lote '+ _CdsLotes.FieldByName('NUMLOTE').AsString + ' já foi baixado');
           // fim - andre tavares - pendência 16855 - 24/06/2004

           sFaixa := sFaixa + _CdsLotes.FieldByName('NUMLOTE').AsString + ',';
           _CdsLotes.Next;
        end;
        sFaixa := '(' +  Copy(sFaixa,1,Length(sFaixa)-1) + ')';


        if sRecPag = 'P' then
          ssql := ' SELECT  (''D'') as DEBCRE, ' + #13
       else
          ssql := ' SELECT  (''C'') as DEBCRE, ' + #13;
       ssql := ssql + '  DOC.DATAPROGRAMADA, ' + #13 +
            '  LOTE.CODPORTFORMA, ' + #13 +
            '  DOC.IDPESSOA, ' + #13 +
            '  PESS.RAZAOSOCIAL AS NOME, ' + #13 +
            '  DOC.DATAVENCTO, ' + #13 +
            '  DOC.NoDOCUMENTO, ' + #13 +
            '  DOC.COMPLDOCUMENTO, ' + #13 +
            '  DOC.CODTIPDOC, ' + #13 +
            '  DOC.CODDOCUMENTO, ' + #13 +
            '  DOC.OPERACAO, ' + #13 +
            '  LOTE.NUMLOTE, ' + #13 +
            '  DOC.PLANO , ' + #13 +
            '  DOC.PLACONTA, ' + #13 +
            '  DOC.CODSUBCONTA, ' + #13 +
            '  DOC.CODCENTROCUSTO, ' + #13 +
            '  LOTE.CODLANCFINANC, ' + #13 +
            '  LOTEX.VALOR, ' + #13 +
            '  LOTE.NUMCHQBORDERO, ' + #13 +
            '  LOTEX.FLGBAIXA, DOC.NUMSLIP, LOTE.NUMSLIP AS NUMORDEMPAGO, LOTE.FAVORECIDO ' + #13 +
            '  FROM  ' + #13 +
            '   DOCUMENTO DOC,  ' + #13 +
            '   PESSOA PESS,  ' + #13 +
            '   LOTEXDOCUM LOTEX ,  ' + #13 +
            '   LOTEPAGTO LOTE  ' + #13 +
            '  WHERE LOTEX.NUMLOTE IN ' + sFaixa + ' AND  ' + #13 +
            '        DOC.IDPESSOA = '+ IntToStr(iIdPessoa) +' AND  ' + #13 +
            '        DOC.RECPAG = '''+ sRecPag + ''' AND  ' + #13 +
            '        (LOTEX.FLGBAIXA = '' ''  OR LOTEX.FLGBAIXA IS NULL) AND ' + #13 +
            '        LOTE.NUMLOTE    = LOTEX.NUMLOTE AND ' + #13 +
            '        DOC.IDFORCLI = PESS.IDPESSOA AND ' + #13 +
            '        LOTEX.CODDOCUMENTO = DOC.CODDOCUMENTO ';

        _CdsDocumentos.Data := GetDataPacket(ssql);

        _LancaBaixaFloat := bLancaBaixaFloat;
        _DataBaixa := dDataBaixa;
        _PlanoConta := iPLanoContabil;
        _UsaPlanoPatro := bUsaPlanoPatro;
        _IntegraContab := bLancaContab;
        _IdPessoa := iIdPessoa;
        _IdUsuarioInclusao := iIdUsuarioInclusao;
        _IdEspAcesso := IdEspAcesso;

        //Marcus Oliveira 23/03/2007 24309
        _Documento.sCtrlDocObs := observacao;


        _CdsDocumentos.Filter := '';
        _CdsDocumentos.Filtered := True;

        _CdsLotes.First;

        While Not _CdsLotes.Eof Do
        Begin
          //início - andre tavares - pendência 23081 - 16/08/2006
          getPorformaBaixa(_CdsLotes.FieldByName('CODPORTFORMA').AsInteger);
          //fim - andre tavares - pendência 23081 - 16/08/2006

          _PlanilhaBaixa := 0;

          _CdsDocumentos.filter := 'NUMLOTE = ''' + _CdsLotes.FieldByName('NUMLOTE').AsString + '''';
          _CdsDocumentos.First;

          _Cds.Data := GetDataPacket('SELECT DATADIFERIDO FROM LOTEPAGTO WHERE NUMLOTE = ' + _CdsLotes.FieldByName('NUMLOTE').AsString); (* Gustavo - 24/04/2003 *)
          _DataDiferido := _Cds.Fields[0].AsDateTime; (* Gustavo - 24/04/2003 *)
          _Cds.Close; (* Gustavo - 24/04/2003 *)

          While ( not _CdsDocumentos.Eof ) Do
          begin
             ValidaDataBaixa( _CdsDocumentos.FieldByName('CODDOCUMENTO').AsInteger, _DataBaixa );
             _CdsDocumentos.next;
          end;

          _CdsDocumentos.First;
          bLancFinanc := True;
          _CodLancFinanc := -1;


          sDocs := '';//andre tavares - pendência 23041 - 26/09/2006
          bErro_Baixa := false;
          while not _CdsDocumentos.eof do
          begin
             try //andre tavares - pendência 23041 - 26/09/2006


               If _CdsDocumentos.FieldByName('OPERACAO').AsString <> '10' Then
                   BaixaDocumento( sBdocumento, bLancFinanc,
                                   _CdsLotes.FieldByName('NUMLOTE').AsInteger,
                                   SistemaLancto,
                                   (Not _CdsLotes.FieldByName('PLNCODIGO').IsNull),
                                   true, bPartidaDobrada, 0, dDataBaixa);
             except //andre tavares - pendência 23041 - 26/09/2006 - guarda os números dos documentos do lote com problema
               bErro_Baixa := true;
               sDocs := sDocs + _CdsDocumentos.fieldByName('NODOCUMENTO').asString + '/' + _CdsDocumentos.fieldByName('COMPLDOCUMENTO').asString + #13
             end;

             _CdsDocumentos.next;

          end;

          If not _Documento.Lote.BaixaLote( _CdsLotes.FieldByName('NUMLOTE').AsInteger ) then
             raise Exception.Create( _Documento.MessageInfo );

          _CdsLotes.Next;
        End;

        if bErro_Baixa then //andre tavares - pendência 23041 - 26/09/2006
          Raise Exception.Create( _Documento.MessageInfo );


        If Not _Padroes.GravaLogOperacoes(iIdPessoa, Integer(SistemaLancto) + 3, iIdUsuarioInclusao, 'Pagamento Automatico', False) Then
           Raise Exception.Create(_Padroes.MessageInfo);

        Commit;

        Result := True;
     except
        On E:Exception Do
         Begin
            Rollback;
            Result := False;
            //início - andre tavares - pendência 23041 - 26/09/2006
            MessageInfo := Format( MSG_ERRO_BAIXALOTE, [_CdsLotes.FieldByName('NUMLOTE').AsString] ) + QUEBRADELINHA +
            sDocs + E.Message;
            //fim - andre tavares - pendência 23041 - 26/09/2006
         End;
     End;
  end;
end;




function TCtrlBaixaDocumentos.ProcessaBaixaManual( bControlaEmissaoCheque: Boolean;
                                                   iCodPortForma: Integer;
                                                   rNumChqBordero: Double;
                                                   Const ovDocumentos: OleVariant;
                                                   dDataBaixa: TDateTime;
                                                   SistemaLancto: TSistemaLancto;
                                                   bLancaBaixaFloat: Boolean;
                                                   iIdUsuarioInclusao,
                                                   iIdPessoa,
                                                   IdEspAcesso,
                                                   iPLanoContabil: Integer;
                                                   bUsaPlanoPatro,
                                                   bLancaContab,
                                                   bPartidaDobrada: Boolean;
                                                   bCalculaImposto: Boolean;
                                                   iNumBaixaRecXPagto: Integer;
                                                   iPlnCodigo: Integer = 0;
                                                   iCodLancFinanc: Integer = -1;
                                                   bLancaFinancBaixa: boolean = True;
                                                   dDataDiferido: TDateTime = 0;
                                                   CODLANCFINANCnIdent : integer = 0;
                                                   dDataDisp: TDateTime = 0;
                                                   const bEstorno: Boolean = False;
                                                   const bUsaPortFormaRetorno: boolean = false;//andré tavares - pendência 21102 - 24/05/2006
                                                   bLancHistContabLoteOrig: boolean = False;// Rodolpho da Silva - P: 22526 - 18/07/2006
                                                   sBaixaObservacao: String = '';
                                                   const iTotReg: integer = 0
                                                 ) : Boolean; (* Gustavo - 24/04/2003 *)
Var
  iCodPortFormaAnt : integer;//andre tavares - pendencia 21102 - 30/05/2006
  iNumLoteManual: Integer;
  bContabilizaAlterador,// Rodolpho da Silva - P: 20932 - 21/12/2005
  bLancFinanc: Boolean;
  sDebCre, sNomeAlterador: String;
  cdsAux, cdsTipoDocXAltXModulo : TClientDataset;   // andre tavares 17/06/2004
  iNumLanc : integer;

  iCodTipDoc, iIdModulo  : integer;

  procedure BuscaDebCreFromAlterador(iCodAlteradorDebCre: Integer);
  var oCds : TClientDataSet;
  begin
     oCds := TClientDataSet.Create(nil);
     With oCds do
       Try
          Try
             Data           := GetDataPacket('SELECT ACRESDECRES, DESCRICAO FROM TIPOALTERADOR WHERE CODALTERADOR = ' + IntToStr(iCodAlteradorDebCre));
             sDebCre        := Fields[0].AsString;
             sNomeAlterador := Fields[1].AsString
          Except
             On E: Exception do
             begin
                MessageInfo := E.Message;
                Result      := False;
             end;
          end;
       finally
          FreeAndNil(oCds);
          if not Result then Raise Exception.Create(MessageInfo);
       end;
  end;


  procedure LancaAlteradores(iCodDocLancto, iCodAlterador: Integer; rValor, rValorOutraMoeda: Double; dDataLancto: TDateTime);
  begin
    if (not IsFloatZero(rValor)) And (iCodAlterador > 0) then
    begin
      BuscaDebCreFromAlterador(iCodAlterador);

      _Documento.Prepare(OpLanctoDocum, odlAlterador);
      _Documento.PartidaDobrada := bPartidaDobrada;
      _Documento.IdEspAcesso    := _IdEspAcesso;
      _Documento.IdUsuario      := _IdUsuarioInclusao;
      _Documento.IdModulo       := _IdModulo;
      _Documento.UsaPlanoPatro  := _UsaPlanoPatro;

      _Documento.Lanctodocum.SetValues(dDataLancto,
                                       iCodDocLancto,
                                       0,
                                       rValor,
                                       0,
                                       rValor,
                                       0,
                                       0,
                                       0,
                                      _IdUsuarioInclusao,
                                      _IdPessoa,
                                       0,
                                       0,
                                       0,
                                       0,
                                       iCodAlterador,
                                       '4',
                                       '',
                                       '',
                                       '',
                                       sNomeAlterador,
                                       '',
                                       '',
                                       '',
                                       sDebCre,
                                      _IdModulo,
                                      _PlanoConta,
                                      _UsaPlanoPatro,
                                      _IntegraContab);
      Result := _Documento.Insert;
      //Fim do Lançamento do alterador para a baixa do documento

      if Result then
      begin
         result := ExecSQL(' UPDATE LANCTODOCUM SET FLGLANCBAIXA = ''S'' WHERE CODDOCUMENTO = ' + IntToStr(iCodDocLancto) + ' AND NUMLANCTO = ' + IntToStr(_Documento.Lanctodocum.NumLancto));

         if not result then
           Exception.Create(MessageInfo);
      end
      else
         // Rodolpho da Silva - P: 25538 - 14/06/2007
         Raise Exception.Create('Erro ao lançar o alterador "' + sNomeAlterador +'". Motivo: ' + _Documento.MessageInfo);
    end;
  end;

begin

  if ConnectionSide = cnsClient then
  begin
     Result := Connection.AppServer.ProcessaBaixaManual(bControlaEmissaoCheque,
                   iCodPortForma, rNumChqBordero, ovDocumentos, dDataBaixa,
                   Integer(SistemaLancto), bLancaBaixaFloat, iIdUsuarioInclusao,
                   iIdPessoa, IdEspAcesso, iPLanoContabil, bUsaPlanoPatro,
                   bLancaContab, bPartidaDobrada, bCalculaImposto, iNumBaixaRecXPagto,
                   iPlnCodigo, iCodLancFinanc, bLancaFinancBaixa, dDataDiferido,
                   CODLANCFINANCnIdent, dDataDisp, bEstorno, bUsaPortFormaRetorno,
                   bLancHistContabLoteOrig, sBaixaObservacao);

     if not Result then
       MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
     try
       iCodPortFormaAnt            := iCodPortForma;
       cdsTipoDocXAltXModulo       := TClientDataSet.Create(nil);
       _Documento.EstornaDocumento := bEstorno;
       _DataDiferido               := dDataDiferido;
       _CODLANCFINANCnIdent        := CODLANCFINANCnIdent;
       iNumLoteManual              := 0;
       cdsAux                      := TClientDataSet.Create(nil);

       //Marcus Oliveira 23/03/2007 24309  Inicio
       observacao                  := sBaixaObservacao;
       _Documento.sCtrlDocObs      := observacao;
       //Marcus Oliveira 23/03/2007 24309 Fim


       try
          Result := true;
          AbreParametros (SistemaLancto, iIdPessoa);

          StartTransaction;
         _CdsDocumentos.Data := ovDocumentos;

         (* Gustavo - 06/03/2003 - Início
             Trata os documentos a serem baixados pelo alterador e exclui os registros
             dess tipo de baixa do grid para baixa efetiva
          *)
          If _CdsDocumentos.Fields.FindField('CODALTERADORBAIXA') <> nil then
          begin
             _CdsDocumentos.First;
             while not _CdsDocumentos.EOF do
             begin
               if _CdsDocumentos.FieldByName('CODALTERADORBAIXA').AsFloat <> 0 then
               begin
                 (* Gustavo - 26/03/2003 - Início *)
                 BuscaDebCreFromAlterador(_CdsDocumentos.FieldByName('CODALTERADORBAIXA').AsInteger);

                 // Início - Rodolpho da Silva - P: 20932
                 bContabilizaAlterador := _IntegraContab;

                 if bContabilizaAlterador then
                    bContabilizaAlterador := (_CdsDocumentos.FieldByName('FLGCONTABALTERADOR').AsString = 'S');
                 // Início - Rodolpho da Silva - P: 20932

                 //Lança o alterador para efetivação da baixa do documento
                 SetDadosModulo( SistemaLancto, _CdsDocumentos.FieldByName('VALOR').AsFloat );

                 _Documento.Prepare(OpLanctoDocum, odlAlterador);
                 _Documento.PartidaDobrada := bPartidaDobrada;
                 _Documento.IdEspAcesso    := _IdEspAcesso;
                 _Documento.IdUsuario      := _IdUsuarioInclusao;
                 _Documento.IdModulo       := _IdModulo;
                 _Documento.UsaPlanoPatro  := _UsaPlanoPatro;
                 _Documento.Lanctodocum.SetValues(dDataBaixa,
                                                  _CdsDocumentos.FieldByName('CODDOCUMENTO').AsInteger,
                                                  0,
                                                  _CdsDocumentos.FieldByName('VALOR').AsFloat,
                                                  0,
                                                  _CdsDocumentos.FieldByName('VALOR').AsFloat,
                                                  0,
                                                  0,
                                                  0,
                                                 _IdUsuarioInclusao,
                                                 _IdPessoa,
                                                  0,
                                                  0,
                                                  0,
                                                  0,
                                                  _CdsDocumentos.FieldByName('CODALTERADORBAIXA').AsInteger,
                                                  '4',
                                                  '',
                                                  '',
                                                  '',
                                                  sNomeAlterador ,
                                                  '',
                                                  '',
                                                  '',
                                                  sDebCre,
                                                 _IdModulo,
                                                 _PlanoConta,
                                                 _UsaPlanoPatro,
                                                 bContabilizaAlterador);


                 Result := _Documento.Insert;
                 //Fim do Lançamento do alterador para a baixa do documento

                 // início - 25/06/2008 - 28197 André tavares - para consertar o erro "insufficient memory for this operation"
                 //if not Result then Raise Exception.Create(MessageInfo);
                 if not result then //para não abortar todo o processamento por causa de um único documento que teve algum problema.
                   self.messageInfo := _Documento.MessageInfo;
                 //fim - 25/06/2008 - 28197 André tavares - para consertar o erro "insufficient memory for this operation"

                 _CdsDocumentos.Delete;
               end
               else
                 _CdsDocumentos.Next;
             end;
             _CdsDocumentos.First;
          end;


          //  Instanciando variáveis
          _LancaBaixaFloat   := bLancaBaixaFloat;
          _DataBaixa         := dDataBaixa;
          _PlanoConta        := iPLanoContabil;
          _UsaPlanoPatro     := bUsaPlanoPatro;
          _IntegraContab     := bLancaContab;
          _IdPessoa          := iIdPessoa;
          _IdUsuarioInclusao := iIdUsuarioInclusao;
          _IdEspAcesso       := IdEspAcesso;
          _rNumChqBordero    := rNumChqBordero;

          //  Pega os dados do PortadorForma
          //andré tavares - pendência 21102 - 24/05/2006 - este campo será preenchido pelo código de liquidação/baixa oriundo do arquivo de retorno do banco
          if bUsaPortFormaRetorno then
          begin
            iCodPortForma := _CdsDocumentos.fieldByName('CODPORTFORMA').asInteger;
            bLancFinanc := true;
            if iCodPortFormaAnt <> _CdsDocumentos.fieldByName('CODPORTFORMA').asInteger then //andré tavares - pendência 23789 - 22/11/2006
              _CodLancFinanc := 0;
          end;

          GetPorformaBaixa(iCodPortForma);

          If  (bControlaEmissaoCheque)     Or
             ((Not bControlaEmissaoCheque) And
              ( _DtmCtrlDocCapCar.CdsPortForma.FieldByName('FLGCONTROLACHEQUE').AsString = 'S')) Then
          Begin
             _TalaoCheque.ValidaPrimeiroCheque := True;
             _TalaoCheque.MostraMsg            := True;
             _TalaoCheque.VerificaChq          := True;
             _TalaoCheque.CodPortador          := _DtmCtrlDocCapCar.CdsPortForma.FieldByName('CODPORTADOR').AsInteger;
             _TalaoCheque.NumCheque            := rNumChqBordero;
             _TalaoCheque.GravaNumChq          := True;

             if (_TalaoCheque.ValidaNumCheque = vcError)then
                raise Exception.Create('Não foi possível validar o número do Cheque.');
          End;

          //  Instanciando variáveis
          iNumLoteManual :=  GetSequence('LOTEMANUAL');
          bLancFinanc    := bLancaFinancBaixa;
          _PlanilhaBaixa := iPlnCodigo;
          _CodLancFinanc := iCodLancFinanc;
          SetDadosModulo(SistemaLancto);

          iCodTipDoc := -1;
          iIdModulo := -1;
          _CdsDocumentos.first;
          _CdsDocumentos.LogChanges := false; // andre tavares 09/12/2005


          while not(_CdsDocumentos.eof) do
          begin
             iRegCorr := iRegCorr + 1; //andre tavares - 18/12/2006 - pend 23195 - para saber o registro corrente
             //Incrementa o progresso tela FBaixaIntBancoMT
             if assigned(OnBaixa) then
               OnBaixa([4,iRegCorr,0,1,iTotReg,'Processando Baixa dos Documentos ']); //*** andre tavares 07/12/2006

             //andre tavares - pendencia 21102 - 30/05/2006
             if bUsaPortFormaRetorno and (iCodPortFormaAnt <> _CdsDocumentos.FieldByName('CODPORTFORMA').asInteger) then
             begin
               _CodLancFinanc := 0;
               //andre tavares - pendência 23789 - 22/11/2006
               iCodPortFormaAnt := _CdsDocumentos.FieldByName('CODPORTFORMA').asInteger;
               iCodPortForma    := _CdsDocumentos.fieldByName('CODPORTFORMA').asInteger;
               getPorformaBaixa(iCodPortForma);
             end;

             //  Alex 07/12/05 - esta query não precisa ser executada a cada linha do laço
             if ((_CdsDocumentos.FieldByName ('CODTIPDOC').AsInteger <> iCodTipDoc) or
                 (_CdsDocumentos.FieldByName ('IDMODULO').AsInteger <> iIdModulo)) then begin

               // se for a primeira linha é preciso esta atribuição
               iCodTipDoc := _CdsDocumentos.FieldByName ('CODTIPDOC').AsInteger;
               iIdModulo  := _CdsDocumentos.FieldByName ('IDMODULO').AsInteger;

               // início - André Tavares - pendência 3138
               // busca alteradores específicos do módulo de origem do documento

               cdsTipoDocXAltXModulo.Close;   // 25/06/2008 - 28197 André tavares - para consertar o erro "insufficient memory for this operation"

               cdsTipoDocXAltXModulo.Data := GetDataPacket(' SELECT CODALTJUROS as CODALTERADORJUROS, CODALTDESC as CODALTERADORDESC, '+
                                                           ' CODALTABAT as CODALTERADORABAT, CODALTOUTROS as CODALTERADORTARIF '+
                                                           ' FROM TPDOCXALTXMODULO T  '+
                                                           ' WHERE  T.TIPODOC = ' + IntToStr (iCodTipDoc) +
                                                           ' AND T.IDMODULO = ' + IntToStr (iIdModulo));
             end else begin
               iCodTipDoc := _CdsDocumentos.FieldByName ('CODTIPDOC').AsInteger;
               iIdModulo  := _CdsDocumentos.FieldByName ('IDMODULO').AsInteger;
             end;


             ValidaDataBaixa( _CdsDocumentos.FieldByName('CODDOCUMENTO').AsInteger, _DataBaixa);

             (* Lança Alteradores Referentes ao processamento da baixa do documento *)
             If ( _CdsDocumentos.FindField('ABATIMENTO') <> nil ) And
                ( _CdsDocumentos.FieldByName('OPERACAO').AsString <> '10' ) then
             Begin
                if cdsTipoDocXAltXModulo.fieldByName('CODALTERADORABAT').isNull then // andre tavares 17/06/2004
                  LancaAlteradores(_CdsDocumentos.FieldByName('CODDOCUMENTO').AsInteger,
                                   _CdsParamCAP.FieldByName('CODALTERADORABAT').AsInteger,
                                   _CdsDocumentos.FieldByName('ABATIMENTO').AsFloat,
                                   0,
                                   _DataBaixa)
               else // andre tavares 17/06/2004
                  LancaAlteradores(_CdsDocumentos.FieldByName('CODDOCUMENTO').AsInteger,
                                   cdsTipoDocXAltXModulo.fieldByName('CODALTERADORABAT').AsInteger,
                                   _CdsDocumentos.FieldByName('ABATIMENTO').AsFloat,
                                   0,
                                   _DataBaixa);



                if cdsTipoDocXAltXModulo.fieldByName('CODALTERADORDESC').isNull then // andre tavares 17/06/2004
                  LancaAlteradores(_CdsDocumentos.FieldByName('CODDOCUMENTO').AsInteger,
                                   _CdsParamCAP.FieldByName('CODALTERADORDESC').AsInteger,
                                   _CdsDocumentos.FieldByName('DESCONTOS').AsFloat,
                                   0,
                                   _DataBaixa)
                else // andre tavares 17/06/2004
                  LancaAlteradores(_CdsDocumentos.FieldByName('CODDOCUMENTO').AsInteger,
                                   cdsTipoDocXAltXModulo.fieldByName('CODALTERADORDESC').AsInteger,
                                   _CdsDocumentos.FieldByName('DESCONTOS').AsFloat,
                                   0,
                                   _DataBaixa);


                if cdsTipoDocXAltXModulo.fieldByName('CODALTERADORJUROS').isNull then // andre tavares 17/06/2004
                  LancaAlteradores(_CdsDocumentos.FieldByName('CODDOCUMENTO').AsInteger,
                                   _CdsParamCAP.FieldByName('CODALTERADORJUROS').AsInteger,
                                   _CdsDocumentos.FieldByName('JUROS').AsFloat,
                                   0,
                                   _DataBaixa)
                else // andre tavares 17/06/2004
                  LancaAlteradores(_CdsDocumentos.FieldByName('CODDOCUMENTO').AsInteger,
                                   cdsTipoDocXAltXModulo.fieldByName('CODALTERADORJUROS').AsInteger,
                                   _CdsDocumentos.FieldByName('JUROS').AsFloat,
                                   0,
                                   _DataBaixa);



                if cdsTipoDocXAltXModulo.fieldByName('CODALTERADORTARIF').isNull then // andre tavares 17/06/2004
                  LancaAlteradores(_CdsDocumentos.FieldByName('CODDOCUMENTO').AsInteger,
                                   _CdsParamCAP.FieldByName('CODALTERADORTARIF').AsInteger,
                                   _CdsDocumentos.FieldByName('TARIFABANCARIA').AsFloat,
                                   0,
                                   _DataBaixa)
                else // andre tavares 17/06/2004
                  LancaAlteradores(_CdsDocumentos.FieldByName('CODDOCUMENTO').AsInteger,
                                   cdsTipoDocXAltXModulo.fieldByName('CODALTERADORTARIF').AsInteger,
                                   _CdsDocumentos.FieldByName('TARIFABANCARIA').AsFloat,
                                   0,
                                   _DataBaixa);

             End;

             //  Se for para calcular imposto...
             if bCalculaImposto then
             begin
                //Cálculo da CPMF e outras retenções de imposto/agregado
                _ImpostoBaixa.CodPortForma      := iCodPortForma;
                _ImpostoBaixa.UsaPlanoPatro     := bUsaPlanoPatro;
                _ImpostoBaixa.PartidaDobrada    := bPartidaDobrada;
                _ImpostoBaixa.IdPlanoConta      := _PlanoConta;
                _ImpostoBaixa.IntegraContab     := _IntegraContab;
                _ImpostoBaixa.IdEmpresa         := _IdPessoa;
                _ImpostoBaixa.NumLote           := -1;
                _ImpostoBaixa.NumLoteManual     := iNumLoteManual;
                _ImpostoBaixa.RecPag            := _RecPag[1];
                _ImpostoBaixa.IdUsuario         :=  _IdUsuarioInclusao;

                //andré tavares - pendência 21219 - 06/02/2006 - aproveitei para resolver o bug da autorização de lançamento de documentos
                _ImpostoBaixa.IdEspAcesso       := _IdEspAcesso;

                _ImpostoBaixa.IdModulo          := _IdModulo;
                _ImpostoBaixa.DataProgramada    := _DataBaixa;
                _ImpostoBaixa.OperacaoDocumento := _CdsDocumentos.FieldByName('OPERACAO').AsString;
                _ImpostoBaixa.IdForCli          := _CdsDocumentos.FieldByName('IDFORCLI').AsInteger;
                _ImpostoBaixa.CodDocumento      := _CdsDocumentos.FieldByName('CODDOCUMENTO').AsInteger;
                _ImpostoBaixa.NumLancto         := _CdsDocumentos.FieldByName('NUMLANCTO').AsInteger;
                _ImpostoBaixa.ValorLancto       := _CdsDocumentos.FieldByName('VALOR').AsFloat;
                _ImpostoBaixa.ValorLiquido      := _CdsDocumentos.FieldByName('VLRLIQUIDO').AsFloat;
                _ImpostoBaixa.DataLancto        := _DataBaixa;
                _ImpostoBaixa.DataEmissao       := _DataBaixa;

                If _CdsDocumentos.FieldByName('DEBCRE').AsString = 'D' then
                   _ImpostoBaixa.DebCre := 'C'
                else
                   _ImpostoBaixa.DebCre := 'D';

                _ImpostoBaixa.MomentoLancamento := mlBaixa;
                _ImpostoBaixa.Incluir;

                If (_ImpostoBaixa.ValorAlteradores <> 0) And
                   (_ImpostoBaixa.AlteraRetencao) Then
                Begin
                   Try
                     FrmListaRetencoesMT             := TFrmListaRetencoesMT.Create( Application , _CdsDocumentos.FieldByName('NUMLANCTO').AsInteger, _CdsDocumentos.FieldByName('VALOR').AsFloat);
                     FrmListaRetencoesMT.VlrRetencao := _ImpostoBaixa.ValorAlteradores;

                     if ( FrmListaRetencoesMT.ShowModal = mrAbort ) then Raise Exception.Create('Erro ao Cancelar\Alterar Retenções: ' + FrmListaRetencoesMT.ErrorMessage);

                     _CdsDocumentos.Edit;
                     _CdsDocumentos.FieldByName('VALOR').AsFloat :=  _CdsDocumentos.FieldByName('VALOR').AsFloat + FrmListaRetencoesMT.VlrRetencao;
                     _CdsDocumentos.Post;
                   finally
                     FrmListaRetencoesMT.Free;
                   End;
                End;
             End;

             //andre tavares - no CAR é necessário, pois não existe o parâmetro de lançamento no financeiro para baixa
             if (ParamIntegra.RecPag = 'R') then
               bLancFinanc := true;  //simplesmente ignoro o parâmero do CAP

             //andré tavares - pendência 21102 - 24/05/2006 - este campo será preenchido pelo código de liquidação/baixa oriundo do arquivo de retorno do banco
             if bUsaPortFormaRetorno and (iCodPortFormaAnt <> _CdsDocumentos.FieldByName('CODPORTFORMA').asInteger) then
             begin
               iCodPortFormaAnt := _CdsDocumentos.FieldByName('CODPORTFORMA').asInteger;//andre tavares - pendencia 21102 - 30/05/2006
               _CodLancFinanc := 0;
               iCodPortForma := _CdsDocumentos.fieldByName('CODPORTFORMA').asInteger;
               //andre tavares - pendência 23789 - 22/11/2006
               iCodPortFormaAnt := _CdsDocumentos.FieldByName('CODPORTFORMA').asInteger;

               //início - andre tavares - pendência 23081 - 16/08/2006
               getPorformaBaixa(iCodPortForma);

             end;//if


             // Início - Rodolpho da Silva - P: 22526 - 18/07/2006
             if bLancHistContabLoteOrig then
             begin
                _Cds.Data := getDataPacket(' SELECT L.NUMLOTE FROM LOTEPAGTO L, LOTEXDOCUM LX '+
                                           ' WHERE  L.NUMLOTE = LX.NUMLOTE AND  LX.CODDOCUMENTO = '+ _CdsDocumentos.FieldByName('CODDOCUMENTO').AsString);
                iNumLoteManual := _Cds.FieldByName('NUMLOTE').AsInteger;
             end;
             // Fim - Rodolpho da Silva - P: 22526 - 18/07/2006


             //início - andré Tavares - pendência 22528 - pega o lote do documento para colocar no histórico contábil
             if (_CdsDocumentos.FindField('NUMLOTE') <> nil) and (_CdsDocumentos.FieldByName('NUMLOTE').asInteger > 0) then
                BaixaDocumento(sBaixaObservacao, bLancFinanc, _CdsDocumentos.FieldByName('NUMLOTE').AsInteger, SistemaLancto, false, false, bPartidaDobrada, iNumBaixaRecXPagto,dDataDisp, bestorno, bUsaPortFormaRetorno, iCodPortForma ) // andre tavares - pendência 14177
             else
             //fim - andré Tavares - pendência 22528
             if _CdsDocumentos.FindField('NUMEROLOTE') <> nil then
             begin
               if _CdsDocumentos.FieldByName('NUMEROLOTE').AsInteger > -1 then
                  BaixaDocumento(sBaixaObservacao, bLancFinanc, _CdsDocumentos.FieldByName('NUMEROLOTE').AsInteger, SistemaLancto, false, false, bPartidaDobrada, iNumBaixaRecXPagto,dDataDisp, bestorno, bUsaPortFormaRetorno, iCodPortForma ) // andre tavares - pendência 14177
               else
                 BaixaDocumento(sBaixaObservacao, bLancFinanc, iNumLoteManual, SistemaLancto, false, false, bPartidaDobrada, iNumBaixaRecXPagto,dDataDisp, bestorno, bUsaPortFormaRetorno, iCodPortForma ); // andre tavares - pendência 14177
             end
             else
             begin
                  BaixaDocumento( sBaixaObservacao, bLancFinanc, iNumLoteManual, SistemaLancto, false, false, bPartidaDobrada, iNumBaixaRecXPagto,dDataDisp, bestorno, bUsaPortFormaRetorno, iCodPortForma ); // andre tavares - pendência 14177
             end;

             if bCalculaImposto then
             begin
               //DAVID - Pendência 26898 - UPDATE não traz NUMLANCTO preenchido
               if _Documento.Lanctodocum.NumLancto > 0 then
                 iNumLanc := _Documento.Lanctodocum.NumLancto
               else
               begin
                 cdsAux.Data := GetDataPacket( ' select NUMLANCTO from LANCTODOCUM where CODDOCUMENTO = ' + _CdsDocumentos.FieldByName('CODDOCUMENTO').AsString );
                 iNumLanc := cdsAux.Fields[0].AsInteger;
               end;
               _ImpostoBaixa.AlteraNumLancOrigem( _ImpostoBaixa.NumLancto, iNumLanc );
             end;

             _CdsDocumentos.next;
          end;
          //  Fim do loop do CdsDocumentos

          if bCalculaImposto then
          begin
             _ImpostoBaixa.NumLote       := -1;
             _ImpostoBaixa.NumLoteManual := iNumLoteManual;
             _ImpostoBaixa.CodPortForma  := iCodPortForma;
             _ImpostoBaixa.EfetivaNovoDocumento;
          end;

          If Not _Padroes.GravaLogOperacoes(_idPessoa, Integer(SistemaLancto) + 3, _IdUsuarioInclusao, 'Pagamento Manual') Then
             Raise Exception.Create(_Padroes.MessageInfo);

          Commit;

          //DAVID - 07/02/07 - Pendência 21696
          if _CODLANCFINANCnIdent > 0 then
          begin
            cdsAux.Data := GetDataPacket(
             ' select * from movimfinanc where codlancfinanc = ' + IntToStr( _CODLANCFINANCnIdent ) );                                                
           with TCtrlMensagens.Create do
           begin
             try
               InitializeAs( Self );
               EnviaMensagemContexto( iIdUsuarioInclusao, 1,
                [ 'CODLANCFINANC'    ,
                  'DATACONCILIA'    ,
                  'VALOR'          ] ,
                [ IntToStr( _CODLANCFINANCnIdent ),
                  FormatDateTime( 'dd/mm/yyyy', cdsAux.FieldByName('DATACONCILIACAO').AsDateTime ),
                  FormatFloat( '#,##0.00', cdsAux.FieldByName('VALORLANCFINAN').AsFloat ) ] );
             finally
               Free;
             end;
           end;
          end;

          if bCalculaImposto then
             _ImpostoBaixa.CancelaAcumulaImposto;
       except
          on E:Exception do
          begin
              Rollback;
              Result := False;
              MessageInfo := Format( MSG_ERRO_BAIXAMANUAL, [IntToStr(iNumLoteManual)] ) + QUEBRADELINHA + E.Message;
              if bCalculaImposto then
                 _ImpostoBaixa.CancelaAcumulaImposto;
          end;
       end;
    finally

      // 25/06/2008 - 28197 André tavares - para consertar o erro "insufficient memory for this operation"
      cdsTipoDocXAltXModulo.Close;
      cdsAux.Close;

      cdsTipoDocXAltXModulo.Free; // andre tavares 17/06/2004
      cdsAux.Free;

      if iTotReg = iRegCorr then
        iRegCorr := 0;              //andre tavares - 18/12/2006 - pendencia 23195
    end;
  end;
end;


procedure TCtrlBaixaDocumentos.ValidaDataBaixa( iCodDocumento: LongInt; dDataPagto: TDateTime );
var bRecebAtecip : boolean;
   _cdsLocal : TClientDataset; // 25/06/2008 - 28197 André tavares - para consertar o erro "insufficient memory for this operation"
begin
   //início andré tavares - pendência 20316 - 27/01/2005
   bRecebAtecip := false;
   // 26/06/2008 - 28197 André tavares - para consertar o erro "insufficient memory for this operation"
   _Cds.Close;
   _Cds.Data := GetDataPacket('SELECT DATALANCTO, OPERACAO FROM LANCTODOCUM WHERE CODDOCUMENTO = '+
   //fim andré tavares - pendência 20316 - 27/01/2005
                              IntToStr(iCodDocumento)+
                              ' AND OPERACAO IN (''2'',''3'',''1'',''14'') AND '+
                              ' DATALANCTO > TO_DATE('+ QuotedStr(DateToStr(dDataPagto)) +','+'''DD/MM/YYYY'')');

 //início andré tavares - pendência 20316 - 27/01/2005 - não testa a data se estiver baixando
   //um documento com recebimento antecipado (com a coluna placontaant preenchida).
{
   with TClientDataSet.Create(nil) do
   begin
     try
       data := GetDataPacket(' SELECT PLACONTAANT FROM DOCUMENTO WHERE CODDOCUMENTO = ' + IntToStr(iCodDocumento));
       bRecebAtecip := trim(fieldByName('PLACONTAANT').asString) <> '';
     finally
       close; // 25/06/2008 - 28197 André tavares - para consertar o erro "insufficient memory for this operation"
       free;
     end;//try
   end; //with
}
   // 26/06/2008 - 28197 André tavares - para consertar o erro "insufficient memory for this operation"
   _cdsLocal := TClientDataSet.Create(nil);
   try
     _cdsLocal.data := GetDataPacket(' SELECT PLACONTAANT FROM DOCUMENTO WHERE CODDOCUMENTO = ' + IntToStr(iCodDocumento));
     bRecebAtecip := trim(_cdsLocal.fieldByName('PLACONTAANT').asString) <> '';
   finally
     _cdsLocal.close; // 25/06/2008 - 28197 André tavares - para consertar o erro "insufficient memory for this operation"
     _cdsLocal.free;
   end;//try


   If (not _Cds.IsEmpty) and (not bRecebAtecip) Then
 //fim andré tavares - pendência 20316 - 27/01/2005
      raise Exception.Create( Format(MSG_ERRO_VERIFICADATA, [ _Cds.fieldbyname('datalancto').asstring ]) );
      
   _cds.Close; // 25/06/2008 - 28197 André tavares - para consertar o erro "insufficient memory for this operation"
end;




procedure TCtrlBaixaDocumentos.SetDadosModulo(SistemaLancto: TSistemaLancto; rValorLanc: Double = 0);
begin
   if SistemaLancto = slCap then
   begin
     _IdModulo := 3;
     _RecPag := 'P';

     if rValorLanc > 0  then
        _DebCred := 'D'
     else
        _DebCred := 'C';
   end
   else
   begin
     _IdModulo := 4;
     _RecPag := 'R';

     if rValorLanc > 0  then
        _DebCred := 'C'
     else
        _DebCred := 'D';
   end;
end;




function TCtrlBaixaDocumentos.GetEmptyCdsBaixa(bAddCodAlteradorBaixa: Boolean = false): OleVariant;
Var
   sCodAltBaixa: String;
begin
   (* Gustavo - 06/03/2003 - Início *)
   if bAddCodAlteradorBaixa then
      sCodAltBaixa := ', (0) AS CODALTERADORBAIXA, '' '' AS FLGCONTABALTERADOR '
   else
      sCodAltBaixa := '';
   (* Gustavo - 06/03/2003 - Fim *)

   Result := GetDataPacket( ' SELECT ' +
                            '   D.IDFORCLI, ' +
                            '   D.OPERACAO, ' +
                            '   D.CODTIPDOC, ' +
                            '   D.IDPESSOA, ' +
                            '   D.CODDOCUMENTO, ' +
                            '   D.NODOCUMENTO, ' +
                            '   D.COMPLDOCUMENTO, ' +
                            '   D.DATAPROGRAMADA, ' +
                            '   D.DATAVENCTO, ' +
                            '   D.RECPAG, ' +
                            '   P.NOME, ' +
                            '   D.STATUS, ' +
                            '   D.MOECODIGO, ' +
                            '   D.PLANO, ' +
                            '   D.PLACONTA, ' +

                            // Rodolpho da Silva - P: 18013 - 07/11/2005
                            '   D.IDMODULO, ' +

                            '   D.CODSUBCONTA, ' +
                            '   D.CODCENTROCUSTO, ' +
                            '   D.CODGRUPOCNAB, ' +
                            '   D.NOSSONUMERO, ' +
                            '   L.HISTORICOCOMPL, '+
                            '   L.NUMLANCTO, ' +
                            '   L.VLRLIQUIDO, ' +
                            '   L.VALOR, ' +
                            '   L.VALOROUTRAMOEDA, ' +
                            '   L.DEBCRE, ' +
                            // 08/10/03 - Alex - Pend 14818 - Incorporando fontes Beraldo
                            '   -1 AS NUMEROLOTE, '  + {* Clementino - 19/04/2003 foi criado para guardar o numero do lote *}
                            '   DECODE(SIGN(D.DATAVENCTO - SYSDATE), -1, 1, 0) AS SITUACAO, ' +
                            '  (0) AS JUROS, (0) AS DESCONTOS, (0) AS ABATIMENTO, (0) AS TARIFABANCARIA, ' + (* Gustavo - 26/03/2003 *)

                            // André Tavares - pendência 22528  - não estava correto - 21/08/2006
                            ' (-1) AS NUMLOTE, '+

                            ' 0 as CODPORTFORMA, '+ //andré tavares - pendência 21102 - 24/05/2006
                            '   2 AS STATUSVALOR ' +  sCodAltBaixa + (* Gustavo - 06/03/2003 *)
                            ', 0 as FLOATFORMAPAG '+ //andré tavares - pendência 23195 - 04/09/2006

                            ' FROM ' +
                            '   DOCUMENTO D, ' +
                            '   PESSOA P, ' +
                            '   LANCTODOCUM L ' +
                            ' WHERE ' +
                            '   1 = 2 ');
end;




procedure TCtrlBaixaDocumentos.SetNumLancto(const Value: Integer);
begin
  FNumLancto := Value;
end;

function TCtrlBaixaDocumentos.ProcessoRadLiberado(CodDocumento: Integer): boolean;
var
  cdsAux : TClientDataset;
begin
  Result := True;
  cdsAux := TClientDataset.Create( nil );
  try
    cdsAux.Data := GetDataPacket(
     ' SELECT IDPROCESSO FROM DOCUMENTO WHERE CODDOCUMENTO = ' + IntToStr( CodDocumento ) );
     Result := cdsAux.FieldByName('IDPROCESSO').IsNull;
     if not Result then
     begin
      if CtrlRADPlus.RecuperaVersaoRAD = '+' then
        Result := ( CtrlRADPlus.SituacaoProcesso( cdsAux.FieldByName('IDPROCESSO').AsInteger ) = 'S' )
      else
        Result := CtrlRAD.SituacaoProcesso( cdsAux.FieldByName('IDPROCESSO').AsInteger );

    end;

  finally
    cdsAux.close; // 25/06/2008 - 28197 André tavares - para consertar o erro "insufficient memory for this operation"
    cdsAux.Free;
  end;
end;


procedure TCtrlBaixaDocumentos.AbreParametros(
  const SistemaLancto: TSistemaLancto; const iIdPessoa: integer);
var
  sSql: string;
begin
  if not _CdsParamCAP.Active then begin
    // seta os dados do módulo : RECPAG
    SetDadosModulo (SistemaLancto);

    sSql := 'SELECT * FROM PARAMCAP ' + #13 +
            'WHERE IDPESSOA = ' + IntToStr  ( iIdPessoa ) + #13 +
            '  AND RECPAG   = ' + QuotedStr ( _RecPag );

    _CdsParamCap.Data := GetDataPacket ( sSql );
  end;

end;

//início - andré tavares - pendência 21647 - 11/04/2006
function TCtrlBaixaDocumentos.UpdateEmissBloq(const coddocumento: double): Boolean;
begin
   result := true;
   try
     execSql('UPDATE DOCUMENTO SET EMISBLOQ = ''N'' WHERE CODDOCUMENTO = '+ floatToStr(coddocumento) );
   except
     result := false;
     messageInfo := 'Erro ao atualizar o campo EMISSBLOC da tabela DOCUMENTO. Documento não Baixado.';
     raise Exception.Create('messageInfo');
   end;//try
end;
//fim - andré tavares - pendência 21647 - 11/04/2006

function TCtrlBaixaDocumentos.getPorformaBaixa(const codPortForma: integer): boolean;
begin
  result := true;
  try
    _DtmCtrlDocCapCar.SqlPortForma.Prepare;
    _DtmCtrlDocCapCar.SqlPortForma.ParamByName('CODPORTFORMA').AsInteger := codPortForma;
    _DtmCtrlDocCapCar.SqlPortForma.Open;
  except
    result := false;
  end;
end;



//início - andré tavares - pendeência 21601 - 24/08/2006
//verifica se existe relacionamento portadorConta X Plano relacionado a um portadorforma no rateio do documento
function TCtrlBaixaDocumentos.VerificaPortadorContaXPlano(const coddocumento: int64;
                                                       const codportForma: integer): Boolean;
var cdsRelacionamento: TClientDataset;
begin
  result := false;
  cdsRelacionamento := TClientDataSet.Create(nil);
  try
    cdsRelacionamento.data := GetDataPacket(
      ' SELECT DISTINCT IDPLANOPREV FROM RATEIODOCUM '+#13+
      ' WHERE CODDOCUMENTO = ' + intToStr(coddocumento)+
      '   AND IDPLANOPREV NOT IN  ( '+#13+
      '                         SELECT P.IDPLANOPREV '+#13+
      '                         FROM PORTCONTAXPLANO P, PORTADORFORMA PF '+#13+
      '                         WHERE  P.CODPORTADOR = PF.CODPORTADOR AND '+#13+
      '                                PF.CODPORTFORMA = '+ intToStr(codportForma)+#13+
      '                        )'          );

    result := cdsRelacionamento.IsEmpty or cdsRelacionamento.fieldByName('IDPLANOPREV').IsNull;

    cdsRelacionamento.data := GetDataPacket(
      '                         SELECT P.IDPLANOPREV '+#13+
      '                         FROM PORTCONTAXPLANO P, PORTADORFORMA PF '+#13+
      '                         WHERE  P.CODPORTADOR = PF.CODPORTADOR AND '+#13+
      '                                PF.CODPORTFORMA = '+ intToStr(codportForma) );

    result := result or cdsRelacionamento.IsEmpty;

  finally
    cdsRelacionamento.close; // 25/06/2008 - 28197 André tavares - para consertar o erro "insufficient memory for this operation"
    cdsRelacionamento.free;
  end;//try
end;
//fim - andré tavares - pendeência 21601 - 24/08/2006


procedure TCtrlBaixaDocumentos.SetObservacao(const Value: string);
begin
  FObservacao := Value;
end;

end.
