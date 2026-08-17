unit FExecLancAlteradorNovo;
{
---------------------------------------------------------------------------------------------------
//N. SIG.............: 116142
//Data da Alteração..: 13/07/2021
//Responsável........: Ewerton Beltramini
//Descrição..........: Inclusão do campo IDENVIODOCUMENTO para validação da exclusão.
-------------------------------------------------------------------------------
SIG................: 116469
Data da Alteração..: 02/06/2021
Responsável........: Ewerton Beltramini
Descrição..........: Correção de erro no LanctoDocum.SetValues.
-------------------------------------------------------------------------------
//Rotina.............: bbtnConfirmarClick, DBcboAlteradorCloseUp
//                     VerificaPreenchimento
//N. SIG.............: 115585
//Data da Alteração..: 18/05/2021
//Alteração Form.....: FExecLancAlteradorNovo
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Readequação das atribuições de tipo de serviço e valor
//                     base de NFS.
-------------------------------------------------------------------------------
Rotina......: bbtnConfirmarClick
Nº SIG......: 43218
Data........: 10/08/2017
Responsável.: Darivaldo Alencar
Descrição...: Administração Imobiliária só possam ser lançados no mês de
              competência do documento ou depois
--------------------------------------------------------------------------------
Rotina......: FormCreate
Nº SOL......: 241068
Nº KINTANA..: 547179
Data........: 24/04/2014
Responsável.: Marcio Sanches Spinosa SOL 241068 PPM 547179
Descrição...: melhoria de performance na busca de documentos
--------------------------------------------------------------------------------
Rotina......: FormCreate
Nº SOL......: 227442-15877
Nº KINTANA..: 2061820
Data........: 24/04/2014
Responsável.: Edilaine Ferraresi
Descrição...: melhoria de performance na busca de documentos
--------------------------------------------------------------------------------
Rotina......: btnProcurarClick
Nº SOL......: 227442
Nº KINTANA..: 2061380
Data........: 06/03/2014
Responsável.: Marcio Sanches Spinosa SOL 227442 KINTANA 2061380
Descrição...: Ajuste na view e no filtro do MS_LANCAMENTO1
--------------------------------------------------------------------------------
Rotina......: btnProcurarClick
Nº SOL......: 226287
Nº KINTANA..: 2060118
Data........: 12/02/2014
Responsável.: Edilaine Ferraresi
Descrição...: troca na execução do MS_lANCAMENTO por MS_lANCAMENTO1
--------------------------------------------------------------------------------
Rotina......: FormCreate, FormClose
Nº SOL......: 196482/13524
Nº KINTANA..: 1992938
Responsável : SADI FREIRE
Data        : 31/01/2014
Descrição   : Otimização do processo de busca na consulta de lancamentos (MS_lANCAMENTO por MS_lANCAMENTO1)
--------------------------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 172902
Nº KINTANA..: 1577381
Data........: 14/03/2012
Responsável.: Helen V. Bianchi
Descrição...: Não deixar fazer lançamentos com Período contabil Bloqueado
--------------------------------------------------------------------------------
SOl_Kintana : 162650_1383795
Data        : 05.08.2011
Analista    : Ricardo de Freitas Araújo
Descrição   : Alterado tipo de variável para realiza corretamente o cálculo de Saldo,
              devido o problemas dos tipos real,double do delphi 5.

SOl_Kintana : 156667_1267057
Data        : 20.05.2011
Analista    : Ricardo de Freitas Araújo
Descrição   : Ao lancar um alterador, verifica se o saldo do documento fica negativo e exibe
             uma tela de confirmação.

{Rotina.........: VerificaPreenchimento
N. Sol..........: 74540
N. Kintana......: 523500
Data............: 03/02/2010
Responsável.....: Bruno Bastos
Descrição.......: Inclusão de verificação se a disponibilidade está bloqueada.


{Rotina.........: TfrmExecLancAlteradorNovo.btnProcurarClick
N. Sol..........: 124962
N. Kintana......: 640067
Data............: 29/09/2009
Responsável.....: Marilza Colpani
Descrição.......: Alteração do parâmetro para o valor chave do MontaSelect}

//	-------------------------------------------------------------------------------------------------
//
//	   Lançamento de Alteradores (--> nova integração)
//
//	Autor             :  André Pontes
//	Data de Início    :	20/11/2000
//	Data de Término   :  21/11/2000
//
//	Modificações      :  22/11/2000  1) Lógica refeita em função de alterações na Integração (IDDOCUMENTO)
//                           28/04/2001  2) qryLancImovel local, não mais do dtmLookImobiliario
//                           30/09/2004  3) Pend. 17787 - Vinicius - Inclusão de Observações
//
//
// -------------------------------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, StdCtrls, ExtCtrls, Db, DBTables, wwdblook, Grids, Wwdbigrd, Wwdbgrid,
  MontaSelect, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, Mask,
  DBCtrls, Wwdatsrc, TEdNum, TB97Ctls, Wwquery, wwdbdatetimepicker, CMDateTimePicker,
  FSairAjudaImob, {uCtrlDocumento}uCtrlImobDocumento, uCtrlParamIntegra, uModuloImobiliario,
  uCtrlFinanc, uCtrlPadroes, uCMClientDataSet, //Bruno Bastos - Sol: 74540 - Kintana: 523500
  UDiasInUteis, //Darivaldo Alencar SIG43218
  // Helen - SOL: 172902 KTN: 1577381
  uCtrlContab;

//Darivaldo Alencar SIG43218 -inicio
const
  MSG02 = 'É necessário indicar a Data de Lançamento.';
  MSG03 = 'É necessário indicar o Tipo de Alterador.';
  MSG07 = 'Data Inválida. A data deve ser maior ou igual a: ';
//Darivaldo Alencar SIG43218 -fim

type
  TfrmExecLancAlteradorNovo = class(TfrmSairAjudaImob)
    qryAlteradoresLanc: TwwQuery;
    dsAlteradoresLanc: TwwDataSource;
    qryAlteradoresLancCODDOCUMENTO: TFloatField;
    qryAlteradoresLancNUMLANCTO: TFloatField;
    qryAlteradoresLancCODALTERADOR: TFloatField;
    qryAlteradoresLancPLNCODIGO: TFloatField;
    qryAlteradoresLancDATALANCTO: TDateTimeField;
    qryAlteradoresLancVALOR: TFloatField;
    qryAlteradoresLancVALOROUTRAMOEDA: TFloatField;
    qryAlteradoresLancDEBCRE: TStringField;
    qryAlteradoresLancOPERACAO: TStringField;
    qryAlteradoresLancHISTORICOCOMPL: TStringField;
    qryAlteradoresLancDESCRICAO: TStringField;
    qryAlteradoresLancNODOCUMENTO: TFloatField;
    ds: TwwDataSource;
    Label2: TLabel;
    Label12: TLabel;
    Label1: TLabel;
    Bevel1: TBevel;
    Label6: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label4: TLabel;
    rdgAcreDesc: TRadioGroup;
    DBcboAlterador: TwwDBLookupCombo;
    DBgrdAlteradoresLanc: TwwDBGrid;
    edtDataLancamento: TCMDateTimePicker;
    edtValor: TEditNum;
    chkContabiliza: TCheckBox;
    DBgrdReajuste: TwwDBGrid;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit1: TDBEdit;
    Panel3: TPanel;
    Panel1: TPanel;
    btnProcurar: TBitBtn;
    bbtnConfirmar: TBitBtn;
    btnExcluiAlterador: TBitBtn;
    Label3: TLabel;
    edtObs: TEdit;
    cboTipoServico: TwwDBLookupCombo;
    Label5: TLabel;
    edtValorBase: TEditNum;
    Label7: TLabel;
    Label8: TLabel;
    Label11: TLabel;
    cboProcesso: TwwDBLookupCombo;
    Label13: TLabel;
    qryAlteradoresLancIDFORCLI: TFloatField;
    qryAlteradoresLancIDTIPOSERVICO: TFloatField;
    qryAlteradoresLancIDPROCESSO: TFloatField;
    qryAlteradoresLancVALORBASERETENCAO: TFloatField;
    qryAlteradoresLancFLGLANCANFS: TStringField;
    qryAlteradoresLancFLGVALORBASE: TStringField;
    qryAlteradoresLancIDENVIODOCUMENTO: TFloatField;

    procedure rdgAcreDescClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnExcluiAlteradorClick(Sender: TObject);
    procedure DBgrdAlteradoresLancCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure DBcboAlteradorCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure DBgrdAlteradoresLancTopRowChanged(Sender: TObject);
    procedure DBgrdReajusteCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure DBgrdReajusteTopRowChanged(Sender: TObject);
    procedure btnProcurarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);


  private { Private declarations }
    //Darivaldo Alencar SIG43218 -inicio
    iCidade,iPais    : Integer;
    sEstado          : String;
    Dias             : TDiasInUteis;
    dDtLancamento    : TDate;
    //Darivaldo Alencar SIG43218 -fim

    iDocumento       : integer;
    iAlterador       : integer;
    sFiltroMS        : string;
    sTipoImovel      : string;
    sRecPag          : string;

    //CtrlDocumento    : TCtrlDocumento;
    CtrlImobDocumento : TCtrlImobDocumento;
    CtrlParamIntegra  : TCtrlParamIntegra;

    CtrlFinanc        : TCtrlFinanc; //Bruno Bastos - Sol: 74540 - Kintana: 523500
    CtrlContab  : TCtrlContab; // Helen - SOL: 172902 KTN: 1577381

    function VerificaPreenchimento: boolean;

    procedure AbreQueries;
    procedure FechaQueries;
    //Cássio Camargo - Sol: 74540 - Kintana: 52350
    function VerificaDocumento(iCodDocumento : Integer): Boolean;
    function IIF(bCondicao: Boolean; sValorV, sValorF: String): String; //Darivaldo Alencar SIG43218
  public { Public declarations }

  end;



var
  frmExecLancAlteradorNovo: TfrmExecLancAlteradorNovo;



implementation
{$R *.DFM}
uses
   uMensErro, uSistema, uDataBase, uData, uFuncaoGeral, //UDiasInUteis, --Darivaldo Alencar SIG43218(Incluído no uses principal)
   UComunsImobiliario, uVerificaPreenchimento, uIntegraBack, uLancContab,
   dLookImobiliario, dImobiliario, uFuncoesImob, DMS, dLancImovel, dBaseDados;


procedure TfrmExecLancAlteradorNovo.rdgAcreDescClick(Sender: TObject);
begin
   inherited;
   AbreQueries;
end;



procedure TfrmExecLancAlteradorNovo.FormShow(Sender: TObject);
begin
   inherited;
   AbreQueries;
end;



procedure TfrmExecLancAlteradorNovo.FormCreate(Sender: TObject);
begin
   inherited;

   // Sadi Freite - SOL 196482/13524 Ktn 1992938
   dtmMS.MS_Lancamento1.UsaDistinct := true;
   dtmMS.MS_Lancamento1.Tabelas.Add('LANCAMENTOSIMOVEL L');
   dtmMS.MS_Lancamento1.CamposChave.Add('L.CODTIPIMOVEL');       //8
   dtmMS.MS_Lancamento1.Colunas.Strings[24] := 'L.CODTIPIMOVEL';

   //Darivaldo Alencar SIG43218 -inicio
   dtmMS.MS_Lancamento1.CamposChave.Add('L.DATALANCAMENTO');     // 9
//   dtmMS.MS_Lancamento1.Colunas.Strings[12] := 'L.DATALANCAMENTO';
   dtmMS.MS_Lancamento1.CamposChave.Add('VW.IDCIDADES');         //10
   dtmMS.MS_Lancamento1.CamposChave.Add('VW.CODESTADO');         //11
   dtmMS.MS_Lancamento1.CamposChave.Add('VW.IDPAIS');            //12
   //Darivaldo Alencar SIG43218 -fim

   dtmMS.MS_Lancamento1.Filtro.Text := 'VW.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa);
   // Adiciona o filtro de EmpresaProp ao MontaSelect
   sFiltroMS := dtmMS.MS_Lancamento1.Filtro.Text;

   dtmMS.MS_Lancamento1.Filtro.Add('VW.CODDOCUMENTO IS NOT NULL');
   dtmMS.MS_Lancamento1.Filtro.Add('RTRIM(VW.STATUS_DOC) <> ''2''');
   dtmMS.MS_Lancamento1.Filtro.Add('L.CODDOCUMENTO = VW.CODDOCUMENTO');    //Marcio Sanches Spinosa SOL 227442 KINTANA 2061380
   dtmMS.MS_Lancamento1.Filtro.Add('(L.IDIMOVEL = VW.IDIMOVEL)');           //Marcio Sanches Spinosa SOL 227442 KINTANA 2061380
   //Marcio Sanches Spinosa SOL 241068 PPM 547179 -Inicio
//   dtmMS.MS_Lancamento1.Filtro.Add('(L.IDCONTRATOIMOVEL = VW.IDCONTRATOIMOVEL)');//Marcio Sanches Spinosa SOL 227442 KINTANA 2061380
   //Marcio Sanches Spinosa SOL 241068 PPM 547179 - Fim
   dtmMS.MS_Lancamento1.Filtro.Add('(L.IDLANCIMOVEL = VW.IDLANCIMOVEL)');  //Marcio Sanches Spinosa SOL 227442 KINTANA 2061380
   dtmMS.MS_Lancamento1.Filtro.Add('(L.IDDOCUMENTO = VW.IDDOCUMENTO)'); //Marcio Sanches Spinosa SOL 227442 KINTANA 2061380

   // Sadi Freite - SOL 196482/13524 Ktn 1992938 - fim

   // Pendência 22797 - Marcos Topini em 24/10/2006
   //dtmMS.MS_Lancamento1.Filtro.Add('VW.IDMODULO = ' + IntToStr(Sistema.Idmodulo));    // Sadi Freite - SOL 196482/13524 Ktn 1992938
   // Fim Pendência 22797

   {//edilaine - SOL 227442-15877 / KTN 2061820 - comentado
   dtmMS.MS_Lancamento1.Filtro.Add(' ROWNUM < 5000 '); //Marcio Sanches Spinosa SOL 227442 KINTANA 2061380
   } //edilaine - SOL 227442-15877 / KTN 2061820

   // Marcio Motta - 19/04/2004 - Pendência: 16195
   //CtrlDocumento    := TCtrlDocumento.Create;
   CtrlImobDocumento := TCtrlImobDOcumento.Create;
   CtrlParamIntegra  := TCtrlParamIntegra.Create;

   //CtrlDocumento.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
   CtrlImobDocumento.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                                Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                                ComunsImobiliario.MensErroMT);

   //CtrlParamIntegra.InitializeAs(CtrlDocumento);
   CtrlParamIntegra.InitializeAs(CtrlImobDocumento);
   // Fim implementação - Marcio Motta ----------------------------

   //Bruno Bastos - Sol: 74540 - Kintana: 523500 - Início
   CtrlFinanc := TCtrlFinanc.Create(Sistema.IdEmpresa,Sistema.IdModulo,Sistema.IdUsuario,Sistema.UsaPlanoPatro);
   CtrlFinanc.InitializeAs(Padroes);
   //Bruno Bastos - Sol: 74540 - Kintana: 523500 - Fim
   // Helen - SOL: 172902 KTN: 1577381
   CtrlContab     := TCtrlContab.Create;
   CtrlContab.InitializeAs(CtrlImobDocumento);
   Dias:= TDiasInUteis.Create;//Darivaldo Alencar SIG43218

   //Cássio Rovaroto - SIG nº 115585 - Início
   Label5.Visible := False;
   cboTipoServico.Visible := False;
   Label8.Visible := False;
   edtValorBase.Visible := False;
   Label13.Visible := False;
   cboProcesso.Visible := False;
   chkContabiliza.Top := cboTipoServico.Top;
   Panel1.Top := Label13.Top;
   DBgrdAlteradoresLanc.Top := (Panel1.Top + Panel1.Height);
   //Cássio Rovaroto - SIG nº 115585 - Fim
end;



procedure TfrmExecLancAlteradorNovo.AbreQueries;
begin
   with dtmLookImobiliario.qryLookAlteradorXTipoImo do begin

      LimpaParametros(dtmLookImobiliario.qryLookAlteradorXTipoImo);

      ParamByName('PCODTIPIMOVEL').AsString     := sTipoImovel;
      ParamByName('PIDEMPRESAPROP').AsInteger   := Sistema.idEmpresa;
      ParamByName('PRECPAG').AsString           := sRecPag;

      if length(sRecPag) > 0 then begin
         case sRecPag[1] of
            'P':
            case rdgAcreDesc.ItemIndex of
               0: ParamByName('PACRESDECRES').AsString   := 'C'; // Acréscimo
               1: ParamByName('PACRESDECRES').AsString   := 'D'; // Desconto
            end;
            'R':
            case rdgAcreDesc.ItemIndex of
               0: ParamByName('PACRESDECRES').AsString   := 'D'; // Acréscimo
               1: ParamByName('PACRESDECRES').AsString   := 'C'; // Desconto
            end;
         end;
      end;

      Open;
   end;

   dtmLookImobiliario.qryLookTipoServico.Open;
end;



procedure TfrmExecLancAlteradorNovo.FechaQueries;
var
   i : integer;
begin
   for i := 0 to (ComponentCount - 1) do begin
      if ( (TObject(Components[i]).ClassType = TwwQuery) and (TwwQuery(Components[i]).Active) ) then begin
         TwwQuery(Components[i]).Close;
      end;
   end;

   dtmLancImovel.qryLancImovel.Close;
end;



procedure TfrmExecLancAlteradorNovo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   // Sadi Freite - SOL 196482/13524 Ktn 1992938
   dtmMS.MS_Lancamento1.Filtro.Text := sFiltroMS;
   dtmMS.MS_Lancamento1.UsaDistinct := False;
   dtmMS.MS_Lancamento1.Tabelas.Delete(1);
   dtmMS.MS_Lancamento1.CamposChave.Delete(8);
   dtmMS.MS_Lancamento1.Colunas.Strings[24] := 'VW.CODTIPIMOVEL';
   // Sadi Freite - SOL 196482/13524 Ktn 1992938 - fim

//   dtmMS.MS_Lancamento1.Colunas.Strings[12] := 'VW.DATALANCAMENTO'; //Darivaldo Alencar SIG43218

   FechaQueries;
   FreeAndNil(CtrlFinanc); //Bruno Bastos - Sol: 74540 - Kintana: 523500
   FreeAndNil(Dias); //Darivaldo Alencar SIG43218
   inherited;
end;



procedure TfrmExecLancAlteradorNovo.btnExcluiAlteradorClick(Sender: TObject);
var
   iNumeroLancto        : integer;
//   iPlanilhaAEstornar   : integer;

begin
   inherited;

   if ( (qryAlteradoresLanc.Active) and (not(qryAlteradoresLanc.isEmpty)) ) then begin
     if MsgDlg('Deseja realmente EXCLUIR esse alterador?', 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin

         //Ewerton Beltramini - SIG116142 - Inicio...
         if qryAlteradoresLanc.FieldByName('IDENVIODOCUMENTO').AsFloat = 1 then
         begin
              MsgDlg('Alteradores originados de recálculos ou atualizações de inadimplência não podem ser excluídos!', 'Atenção', mtError, [ mbOk ], 0 );
              exit;
         end;
         //Ewerton Beltramini - SIG116142 - Fim.  

       Repaint;
       StartTransacao;
       try
         Screen.Cursor := crHourGlass;

         // Helen - SOL: 172902 KTN: 1577381 - Inicio
         if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,qryAlteradoresLancDATALANCTO.AsString) then
         begin
            exit;
            btnExcluiAlterador.SetFocus;
         end;
         // Helen - SOL: 172902 KTN: 1577381 - Fim

         iNumeroLancto        := qryAlteradoresLancNUMLANCTO.asInteger;
         iDocumento           := qryAlteradoresLancCODDOCUMENTO.asInteger;
//         iPlanilhaAEstornar   := qryAlteradoresLancPLNCODIGO.asInteger;

         // Marcio Motta - 20/04/2004 - Pendência: 16195
         // Some com o LancToDocum e desfaz a contabilização se houver
         {CtrlDocumento.Prepare(OpLanctoDocum, odlAlterador);
         CtrlDocumento.CodDocumento          := iDocumento;
         CtrlDocumento.Lanctodocum.NumLancto := iNumeroLancto;

         if not CtrlDocumento.Delete then
            raise exception.create(CtrlDocumento.MessageInfo);}
         // Fim Implementação - Marcio Motta

         CtrlImobDocumento.Prepare(OpLanctoDocumImob, odlAlteradorImob);
         CtrlImobDocumento.CodDocumento          := iDocumento;
         CtrlImobDocumento.Lanctodocum.NumLancto := iNumeroLancto;

         if not CtrlImobDocumento.Delete then
            raise exception.create(CtrlImobDocumento.MessageInfo);


(*         // Some com o LanctoDocum
         Documento.Excluir(dtmImobiliario.qryAux, iDocumento, iNumeroLancto);

         // Desfaz a contabilização
         ExcluiLanc(True, iPlanilhaAEstornar, 'BASEDADOS', '64', IntegraBack.Plano, Sistema.idEmpresa,
                    Sistema.idUsuario, True, 0, IntegraBack.MascaraPlano);
*)

         CommitTransacao;
         qryAlteradoresLanc.Close;
         qryAlteradoresLanc.Open;

         MsgDlg('Alterador excluído.', 'Informação', mtInformation, [mbOk], 0);
         Repaint;

         Screen.Cursor := crDefault;
       except
         RollBackTransacao;
         Repaint;
         Screen.Cursor := crDefault;
       end;
     end;
   end;
end;



procedure TfrmExecLancAlteradorNovo.DBgrdAlteradoresLancCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
   inherited;

   // faz com que as linhas do grid tenham cores alternadas
   if State <> [gdSelected] then begin
      if not Highlight then begin
         // linhas ímpares = amarelo, linhas pares = branco
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
            ABrush.Color := $00C0FFFF; // amarelo bebê
         end else begin
            ABrush.Color := clWhite;
         end;
      end;
   end else begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;
end;



procedure TfrmExecLancAlteradorNovo.bbtnConfirmarClick(Sender: TObject);
var iPlanilha : integer;
var
  //Ricardo Freitas SOL: 156667 KINTANA: 1267057
  Natureza:integer;
  //Ricardo Freitas SOL: 162650 KITANA: 1383795 - Alterado tipo da variável para Currency
  SaldoDoc,Saldo,SaldoFinal:Currency;
  sDebCreDoc:string;
  iIdServico, iIdProcesso: Integer; //Cássio Rovaroto - SIG nº 115585
begin
   if VerificaPreenchimento then begin
     if MsgDlg('Deseja realmente lançar os valores no Contas a Pagar/Receber?', 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
       Repaint;
       try
         if ( (dtmLancImovel.qryLancImovel.Active) and not(dtmLancImovel.qryLancImovel.isEmpty) ) then begin

           iPlanilha   := 0;

           //Cássio Rovaroto - SIG nº 115585 - Início
           if not(cboTipoServico.Text = EmptyStr) then
            iIdServico := dtmLookImobiliario.qryLookTipoServico.FieldByName('IDTIPOSERVICO').AsInteger
           else
            iIdServico := -1;

           if not(cboProcesso.Text = EmptyStr) then
            iIdProcesso := dtmLookImobiliario.qryLookProcesso.FieldByName('IDPROCESSO').AsInteger
           else
            iIdProcesso := -1;
           //Cássio Rovaroto - SIG nº 115585 - Fim

           StartTransacao;
//---------- INÍCIO - Marcio Motta - 20/04/2004 - Pendência: 16195 ---------------------------------
           // Prepara a função para lançar o alterador
           //CtrlDocumento.Prepare( OpLanctoDocum, odlAlterador );
           CtrlImobDocumento.Prepare( OpLanctoDocumImob, odlAlteradorImob );
//           CtrlDocumento.OpenTransaction := True;
           //CtrlDocumento.OpenTransaction := False;
           CtrlImobDocumento.OpenTransaction := False;
           //CtrlDocumento.PartidaDobrada  := ParamIntegra.PartidaDobrada;
           CtrlImobDocumento.PartidaDobrada  := ParamIntegra.PartidaDobrada;
           //CtrlDocumento.UsaPlanoPatro   := Sistema.UsaPlanoPatro;
           CtrlImobDocumento.UsaPlanoPatro   := Sistema.UsaPlanoPatro;
           //CtrlDocumento.IdUsuario       := Sistema.IdUsuario;
           CtrlImobDocumento.IdUsuario       := Sistema.IdUsuario;
           //CtrlDocumento.IdEspAcesso     := Sistema.idEspAcesso;
           CtrlImobDocumento.IdEspAcesso     := Sistema.idEspAcesso;
           //CtrlDocumento.IdModulo        := Sistema.idModulo;
           CtrlImobDocumento.IdModulo        := Sistema.idModulo;

           //Ricardo Freitas SOL: 156667 KINTANA: 1267057
           SaldoFinal := 0;
           SaldoDoc   := 0;
           Saldo      := 0;
           SaldoDoc   := CtrlImobDocumento.RetornaSaldoDocumento(IntToStr(iDocumento),sDebCreDoc);

           if Trim(dtmLookImobiliario.qryLookAlteradorXTipoImo.FieldByName('ACRESDECRES').AsString) = Trim(sDebCreDoc) then
              Natureza := 1
           else
              Natureza := -1;

           Saldo      :=  StrToFloat(Trim(edtValor.Text));
           Saldo      :=  Saldo * Natureza;
           SaldoFinal :=  (SaldoDoc + Saldo);

           if (0 > SaldoFinal ) then
           begin
               if Application.MessageBox(PChar('Realizando o lançamento deste alterador, o saldo do documento ficará negativo.' + #13 +
                                                   'Saldo do documento com este alterador: ' + FloatToStr(SaldoFinal) + #13 + #13 +
                                                   'Confirma inclusão deste alterador?'),'Confirmar',36) <> 6 then
               begin
                 RollBackTransacao;
                 Exit;
               end;
           end;
           //Ricardo Freitas - Fim

           //Ewerton Beltramini - 02/06/2021 - SIG 116469
           if (Trim(edtValorBase.Text) = '') then
              edtValorBase.Text := '0';

           //CtrlDocumento.Lanctodocum.SetValues( edtDataLancamento.Date,
           CtrlImobDocumento.Lanctodocum.SetValues( edtDataLancamento.Date,
                                                iDocumento, 0,
                                                StrToFloat(edtValor.Text),
                                                0,
                                                StrToFloat(edtValor.Text),
//                                                ModuloImobiliario.AdminImob.iUnidNegoc,
                                                // Marchetti - Pendencia 22952
                                                0,
                                                // Fim Marchetti - Pendencia 22952
                                                iPlanilha,
                                                0,
                                                Sistema.idUsuario,
                                                Sistema.idEmpresa,
                                                0, 0, 0, 0,
                                                dtmLookImobiliario.qryLookAlteradorXTipoImoCODALTERADOR.AsInteger,
                                                '4', '', '', '', edtObs.Text, '', '', '',
                                                dtmLookImobiliario.qryLookAlteradorXTipoImoACRESDECRES.AsString,
                                                Sistema.idModulo,
                                                ParamIntegra.Plano,
                                                Sistema.UsaPlanoPatro,
                                                not(chkContabiliza.Checked)
                                                //Cássio Rovaroto - SIG nº 115585 - Início
                                                , 0, 0, '', 0, 0,
                                                iIdServico,
                                                iIdProcesso,
                                                StrToFloat(edtValorBase.Text)
                                                //Cássio Rovaroto - SIG nº 115585 - Fim
                                                );

           {if not CtrlDocumento.Insert then
              raise exception.Create( CtrlDocumento.MessageInfo );}
           if not CtrlIMobDocumento.Insert then
              raise exception.Create( CtrlImobDocumento.MessageInfo );
//------- Fim Implementação/Alteração - Marcio Motta -----------------------------------------------

         end;


         CommitTransacao;

         qryAlteradoresLanc.Close;
         qryAlteradoresLanc.Open;

         //Cássio Rovaroto - SIG nº 115585 - Início
         Label5.Visible := False;
         cboTipoServico.Visible := False;
         cboTipoServico.LookupValue := '';
         Label8.Visible := False;
         edtValorBase.Visible := False;
         Label13.Visible := False;
         cboProcesso.Visible := False;
         cboProcesso.LookupValue := '';
         chkContabiliza.Top := cboTipoServico.Top;
         Panel1.Top := Label13.Top;
         DBgrdAlteradoresLanc.Top := (Panel1.Top + Panel1.Height);
         //Cássio Rovaroto - SIG nº 115585 - Fim


       except
         RollBackTransacao;
         MsgDlg('Houve erro durante a tentativa de integração com o Contas a Pagar/Receber.', 'Erro', mtError, [mbOk], 0);
         Repaint;
       end;
     end;
     Repaint;
   end;
end;


procedure TfrmExecLancAlteradorNovo.DBcboAlteradorCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;
   if length(trim(DBcboAlterador.Text)) > 0 then begin
      iAlterador  := StrToInt(DBcboAlterador.LookupValue);

      // Pend. 17787 - Vinicius
      edtObs.Text := dtmLookImobiliario.qryLookAlteradorXTipoImoDESCRICAO.AsString;

      //Cássio Rovaroto - SIG nº 115585 - Início
      LimpaParametros(dtmLookImobiliario.qryLookProcesso);
      dtmLookImobiliario.qryLookProcesso.ParamByName('PIDFORCLI').AsInteger := qryAlteradoresLancIDFORCLI.AsInteger;
      dtmLookImobiliario.qryLookProcesso.Open;
      cboProcesso.Visible := not(dtmLookImobiliario.qryLookProcesso.IsEmpty);

      if not(cboProcesso.Visible) then
      begin
        chkContabiliza.Top := cboProcesso.Top;
        Panel1.Top := 312;
        DBgrdAlteradoresLanc.Top := (Panel1.Top + Panel1.Height);
      end
      else
      begin
        chkContabiliza.Top := 312;
        Panel1.Top := 329;
        DBgrdAlteradoresLanc.Top := (Panel1.Top + Panel1.Height);
      end;

      if dtmLookImobiliario.qryLookAlteradorXTipoImoFLGLANCANFS.AsString = 'S' then
      begin
        Label5.Visible := True;
        cboTipoServico.Visible := True;
        chkContabiliza.Top := Label13.Top;
        Panel1.Top := 312;
        DBgrdAlteradoresLanc.Top := (Panel1.Top + Panel1.Height);
      end
      else
      begin
        Label5.Visible := False;
        cboTipoServico.Visible := False;
        chkContabiliza.Top := Label8.Top;
        Panel1.Top := Label13.Top;
        DBgrdAlteradoresLanc.Top := (Panel1.Top + Panel1.Height);
      end;

      if dtmLookImobiliario.qryLookAlteradorXTipoImoFLGVALORBASE.asString = 'S' then
      begin
        Label8.Visible := True;
        edtValorBase.Visible := True;
        edtValorBase.Text := '0,00';
      end
      else
      begin
        Label8.Visible := False;
        edtValorBase.Visible := False;
      end;
      //Cássio Rovaroto - SIG nº 115585 - Fim
   end else begin
      iAlterador := -1;
   end;
end;


function TfrmExecLancAlteradorNovo.VerificaPreenchimento: boolean;
var
  dData: TDate; //Darivaldo Alencar SIG43218
begin
  Result := False;

  try
    if trim(edtDataLancamento.Text)= '' then
      //raise EValidacao.CreateVal('É necessário indicar a Data de Vencimento!', edtDataLancamento);//Darivaldo Alencar SIG43218
      raise EValidacao.CreateVal(MSG02, edtDataLancamento);                                         //Darivaldo Alencar SIG43218

    if Trim(DBcboAlterador.Text) = '' then
      //raise EValidacao.CreateVal('É necessário indicar o Alterador !', DBcboAlterador);  //Darivaldo Alencar SIG43218
      raise EValidacao.CreateVal(MSG03, DBcboAlterador);                                   //Darivaldo Alencar SIG43218

    //Darivaldo Alencar SIG43218 -inicio
    if (dDtLancamento > edtDataLancamento.Date) then
       raise EValidacao.CreateVal(MSG07 + formatdatetime('dd/mm/yyyy',dDtLancamento), edtDataLancamento);

    if Dias.Feriado(edtDataLancamento.Date, iCidade, iPais,sEstado,True,False) then
      begin
         dData:= Dias.PrimeiroDiaUtilPosterior(edtDataLancamento.Date,iCidade,iPais,sEstado, True,False,False);
         if (MsgDlg('Data informada invalida. Confirma lançamento para a data '+formatdatetime('dd/mm/yyyy',dData)+' (próximo dia útil)?','Atenção',mtConfirmation,[mbYes,mbNo],0) = mrYes) then
             edtDataLancamento.Date:= Dias.PrimeiroDiaUtilPosterior(edtDataLancamento.Date,iCidade,iPais,sEstado, True,False,False);
      end;

    //Darivaldo Alencar SIG43218 -fim

    //LancFinanc.TestaDispFinanc(sistema.idempresa, sistema.idusuario, edtDataLancamento.Date);
    //Bruno Bastos - Sol: 74540 - Kintana: 523500 - Início
    //Cássio Camargo - Sol: 74540 - Kintana: 52350
    if VerificaDocumento(dtmLancImovel.qryLancImovel.FieldByName('CODDOCUMENTO').asInteger) then
    begin
      if not CtrlFinanc.TestaDispFinanc(Sistema.IdEmpresa, Sistema.IdUsuario, edtDataLancamento.Date) then
      begin
         MsgDlg('Não foi possível alterar os dados do documento. ' + #13 +
                'Motivo: ' + CtrlFinanc.MessageInfo,'Aviso',mtWarning,[mbOk],0);
         Exit;
      end;
    end;
    //Bruno Bastos - Sol: 74540 - Kintana: 523500 - Fim
    // Helen - SOL: 172902 KTN: 1577381 - Inicio
    if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,edtDataLancamento.Text) then
    begin
        edtDataLancamento.SetFocus;
        exit;
    end;
    // Helen - SOL: 172902 KTN: 1577381 - Fim

    //Cássio Rovaroto - SIG nº 115585 - Início
    if (cboTipoServico.Visible) and (cboTipoServico.Text =  '') then
      raise EValidacao.createVal('Para este lançamento, informe o tipo de serviço.', cboTipoServico);

    if edtValorBase.Visible then
    begin
      if (edtValorBase.Text = '0,00') or (edtValorBase.Text = '') then
        raise EValidacao.createVal('Para esta lançamento, informe o valor base de retenção.', edtValorBase)
      else
        if MessageDlg('O valor base de retenção deste tributo é realmente de R$' + edtValorBase.Text + '?', mtInformation, [mbYes, mbNo], 0) = mrNo then
        begin
          edtValorBase.SetFocus;
          Result := False;
          Exit;
        end;
    end;
    //Cássio Rovaroto - SIG nº 115585 - Fim
  except

    on ev : EValidacao do begin
      if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
  	Repaint;

      if ev.Control.CanFocus then ev.Control.SetFocus;
        Exit;
    end;

  end;
  Result := True;
end;


procedure TfrmExecLancAlteradorNovo.DBgrdAlteradoresLancTopRowChanged(Sender: TObject);
begin
   inherited;
   (Sender as TwwDBGrid).Invalidate;
end;



procedure TfrmExecLancAlteradorNovo.DBgrdReajusteCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
   inherited;

   // faz com que as linhas do grid tenham cores alternadas
   if State <> [gdSelected] then begin
      if not Highlight then begin
         // linhas ímpares = amarelo, linhas pares = branco
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
            ABrush.Color := $00C0FFFF; // amarelo bebê
         end else begin
            ABrush.Color := clWhite;
         end;
      end;
   end else begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;
end;



procedure TfrmExecLancAlteradorNovo.DBgrdReajusteTopRowChanged(Sender: TObject);
begin
   inherited;
   (Sender as TwwDBGrid).Invalidate;
end;



procedure TfrmExecLancAlteradorNovo.btnProcurarClick(Sender: TObject);
begin
   inherited;
   iCidade:=0; iPais := 0; sEstado:= emptystr;  //Darivaldo Alencar SIG43218
   try
      dtmMS.MS_Lancamento1.Executar;       // Edilaine - SOL 226287 / KTN 2060118

      // redesenha o form na volta do MontaSelect
      Repaint;

      // se houve busca, abre a query principal com apenas o registro buscado
      if dtmMS.MS_Lancamento1.RetornouValor then begin         // Edilaine - SOL 226287 / KTN 2060118

        //Darivaldo Alencar SIG43218 -inicio
        if (dtmMS.MS_Lancamento1.ValoresChave[9] <> EmptyStr)then
           dDtLancamento:= StrToDate(dtmMS.MS_Lancamento1.ValoresChave[9])
        else dDtLancamento:= 0;
        sEstado:= dtmMS.MS_Lancamento1.ValoresChave[11];
        iCidade:= StrToInt(iif(dtmMS.MS_Lancamento1.ValoresChave[10] = EmptyStr,'0',dtmMS.MS_Lancamento1.ValoresChave[10] ));
        iPais  := StrToInt(iif(dtmMS.MS_Lancamento1.ValoresChave[12] = EmptyStr,'0',dtmMS.MS_Lancamento1.ValoresChave[12]));
        //Darivaldo Alencar SIG43218 -fim

         Screen.Cursor  := crHourGlass;
         // Edilaine - SOL 226287 / KTN 2060118
         iDocumento       := StrToInt(dtmMS.MS_Lancamento1.ValoresChave[1]);
         //Marilza Colpani 29/09/2009 N.Sol 124962/N.Kintana 640067
         if dtmMS.MS_Lancamento1.ValoresChave[8] <> '' then
            sTipoImovel := dtmMS.MS_Lancamento1.ValoresChave[8]
         else
            sTipoImovel := dtmMS.MS_Lancamento1.ValoresChave[5];
         sRecPag          := dtmMS.MS_Lancamento1.ValoresChave[7];
         // Edilaine - SOL 226287 / KTN 2060118 - fim

         with dtmLancImovel.qryLancImovel do begin
            LimpaParametros(dtmLancImovel.qryLancImovel);
            ParamByName('PIDPESSOA').AsInteger     := Sistema.idEmpresa;
            ParamByName('PCODDOCUMENTO').AsInteger := iDocumento;
            Open;

            if not(IsEmpty) then begin
               with qryAlteradoresLanc do begin
                  LimpaParametros(qryAlteradoresLanc);
                  ParamByName('PCODDOCUMENTO').AsFloat := iDocumento;
                  Open;
               end;
            end;

         end;

         AbreQueries;
      end;

   finally
      Screen.Cursor := crDefault;
   end;
end;



procedure TfrmExecLancAlteradorNovo.FormDestroy(Sender: TObject);
begin
  inherited;
  //FreeAndNil(CtrlDocumento);
  FreeAndNil(CtrlImobDocumento);
  FreeAndNil(CtrlContab);// Helen - SOL: 172902 KTN: 1577381 
end;

function TfrmExecLancAlteradorNovo.VerificaDocumento(
  iCodDocumento: Integer): Boolean;
var
  cdsAux : TCMClientDataSet;
  sSQL : String;
begin
  cdsAux := TCMClientDataSet.Create(nil);
  try
    sSQL := 'SELECT 1                                            '+#13#10+
            '  FROM DOCUMENTO DT, DOCUMXDOCUM DD                 '+#13#10+
            ' WHERE DT.CODDOCUMENTO = ' + IntToStr(iCodDocumento) +#13#10+
            '   AND DD.IDDOCUMENTO(+) = DT.CODDOCUMENTO          '+#13#10+
            '   AND DD.IDDOCUMENTOPAI IS NULL                    '+#13#10+
            '   AND ((DT.RECPAG <> ''R'') OR (STATUS = 2))       ';
    cdsAux.Data := Padroes.GetDataPacket(sSQL);
    Result := not cdsAux.IsEmpty;
  finally
    FreeAndNil(cdsAux);
  end;
end;

//Darivaldo Alencar SIG43218 -inicio
function TfrmExecLancAlteradorNovo.IIF(bCondicao: Boolean; sValorV, sValorF: String): String;
begin
  if bCondicao then
      result:= sValorV
 else result:= sValorF;
end;
//Darivaldo Alencar SIG43218 -fim


end.
