{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Rotina............: FormCreate
N. Sol.............: 92381
N. Kintana......: 394180
Data...............: 18/09/2008
Responsável...: Cássio Camargo
Descrição........: Inclusão do Control Object CtrlImobDocumento, com o
                     objetivo de internalizar funcionalidades.
--------------------------------------------------------------------------------
Pendência   : 27394
Responsável : Daniel Simões
Data        : 14/02/2008
Descrição   : Alteração/Implementação do número do Help Context...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit fDesfazConfissaoDivida;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FWizardMT, IvDictio, IvMulti, IvEMulti, fcButton, fcImgBtn, fcShapeBtn,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, fcLabel, ComCtrls, ExtCtrls,
  wwdbdatetimepicker, CMDateTimePicker, mLocatario, TB97Ctls, ImgList,
  Grids, Wwdbigrd, Wwdbgrid, wwriched, Wwdotdot, Wwdbcomb, DBCtrls,
  DBCtrls2, mImovelAtivo, mResponsavel, mAdministradora, Mask, wwdbedit, uSistema,
  Wwdbspin, wwdblook, TREdit, uCtrlPadroes, uCtrlConfissaoDivida, uCtrlHistMovImob,
  Db, uCmSqlParams, DBClient, uCMClientDataSet, uCtrlParamIntegra, uCtrlOutroDado,
  uCtrlContratoImovel, uCtrlEventoImovel, {uCtrlDocumento,} CMDBLookupCombo,
  //Cássio Camargo - 18/09/2008 - N. Sol 92381 -  N. Kintana 394180
  uCtrlImobDocumento;


type
  TfrmDesfazConfissaoDivida = class(TfrmWizardMT)
    Panel2: TPanel;
    Panel3: TPanel;
    ImlPadrao: TImageList;
    CMSqlParams1: TCMSqlParams;
    cdsConfDividaImob: TCMClientDataSet;
    cdsConfDividaImobXDoc: TCMClientDataSet;
    cdsConfDividaImobXOper: TCMClientDataSet;
    cdsContratoImovel: TCMClientDataSet;
    cdsContratoXImovel: TCMClientDataSet;
    cdsAux: TCMClientDataSet;
    CdsEventoImovel: TCMClientDataSet;
    CdsContratoXVlrAno: TCMClientDataSet;
    CdsContratoXDesc: TCMClientDataSet;
    CdsCondPagImovel: TCMClientDataSet;
    CdsAvalistaXContrato: TCMClientDataSet;
    cdsImovelAluguel: TCMClientDataSet;
    edtNumContrato: TEdit;
    Label2: TLabel;
    edtNomeContrato: TEdit;
    Label3: TLabel;
    btnBuscaContrato: TBitBtn;
    btnLimpaContrato: TBitBtn;
    edtDataProcesso: TCMDateTimePicker;
    Label1: TLabel;
    memResult: TMemo;
    cdsConfDividaImobXContr: TCMClientDataSet;
    cdsOutroDadoXImovel: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnContinuarClick(Sender: TObject);
    procedure btnBuscaContratoClick(Sender: TObject);
    procedure btnLimpaContratoClick(Sender: TObject);
  private
    { Private declarations }

    iContratoSelecao : Integer;
    bProcessou       : Boolean;

    CtrlConfissaoDivida : TCtrlConfissaoDivida;
    CtrlContratoImovel  : TCtrlContratoImovel;
    CtrlEventoImovel    : TCtrlEventoImovel;
    //Cássio Camargo - 18/09/2008 - N. Sol 92381 -  N. Kintana 394180
    //CtrlDocumento       : TCtrlDocumento;
    CtrlImobDocumento   : TCtrlImobDocumento;
    CtrlParamIntegra    : TCtrlParamIntegra;
    CtrlHistMovImob     : TCtrlHistMovImob;
    CtrlOutroDado       : TCtrlOutroDado;

    function  VerificaPreenchimentoSelecao : Boolean;
    function  PermiteExclusaoContrato      : Boolean;
    function  DesfazContabilOperacao       : boolean;
    function  DesfazBaixaDocumentos        : boolean;
    function  RegistraEvento               : boolean;

  public
    { Public declarations }
  end;

var
  frmDesfazConfissaoDivida: TfrmDesfazConfissaoDivida;

implementation

uses uDataBase, uVerificaPreenchimento, uMensErro, fAguarde, dMS;

{$R *.DFM}

procedure TfrmDesfazConfissaoDivida.FormCreate(Sender: TObject);
begin
   inherited;
   CtrlConfissaoDivida := TCtrlConfissaoDivida.Create;
   CtrlContratoImovel  := TCtrlContratoImovel.Create(Sistema.IdEmpresa, Sistema.IdModulo, Sistema.IdUsuario, Sistema.IdEspAcesso, Sistema.UsaPlanoPatro);
   CtrlEventoImovel    := TCtrlEventoImovel.Create;
   //Cássio Camargo - 18/09/2008 - N. Sol 92381 -  N. Kintana 394180
   //CtrlDocumento       := TCtrlDocumento.Create;
   CtrlImobDocumento   := TCtrlImobDocumento.Create;
   CtrlParamIntegra    := TCtrlParamIntegra.Create;
   CtrlHistMovImob     := TCtrlHistMovImob.Create;
   CtrlOutroDado       := TCtrlOutroDado.Create;


   CtrlConfissaoDivida.InitializeAs(Padroes);
   CtrlContratoImovel.InitializeAs(Padroes);
   CtrlEventoImovel.InitializeAs(Padroes);
   //Cássio Camargo - 18/09/2008 - N. Sol 92381 -  N. Kintana 394180
   //CtrlDocumento.InitializeAs(Padroes);
   CtrlImobDocumento.InitializeAs(Padroes);
   CtrlParamIntegra.InitializeAs(Padroes);
   CtrlHistMovImob.InitializeAs(Padroes);
   CtrlOutroDado.InitializeAs(Padroes);

   CtrlParamIntegra.GetParams(Sistema.idEmpresa,0,'','', tiSistema);

   CtrlContratoImovel.CdsContratoImovel    := cdsContratoImovel;
   CtrlContratoImovel.CdsContratoXImovel   := cdsContratoXImovel;
   CtrlContratoImovel.CdsContratoXVlrAno   := CdsContratoXVlrAno;
   CtrlContratoImovel.CdsAvalistaXContrato := CdsAvalistaXContrato;
   CtrlContratoImovel.CdsEventoImovel      := CdsEventoImovel;
   CtrlContratoImovel.CdsContratoXDesc     := CdsContratoXDesc;
   CtrlContratoImovel.CdsCondPagImovel     := CdsCondPagImovel;
   CtrlContratoImovel.CdsOutroDadoXImovel  := CdsOutroDadoXImovel;

   CtrlConfissaoDivida.CdsConfDividaImob        := CdsConfDividaImob;
   CtrlConfissaoDivida.CdsConfDividaImobXContr  := CdsConfDividaImobXContr;
   CtrlConfissaoDivida.CdsConfDividaImobXDoc    := CdsConfDividaImobXDoc;
   CtrlConfissaoDivida.CdsConfDividaImobXOper   := CdsConfDividaImobXOper;

   CtrlConfissaoDivida.OpenTransaction := False;
   CtrlContratoImovel.OpenTransaction  := False;
   CtrlEventoImovel.OpenTransaction    := False;
   //Cássio Camargo - 18/09/2008 - N. Sol 92381 -  N. Kintana 394180
   //CtrlDocumento.OpenTransaction       := False;
   CtrlImobDocumento.OpenTransaction   := False;
   CtrlOutroDado.OpenTransaction       := False;
end;



procedure TfrmDesfazConfissaoDivida.FormClose(Sender: TObject;var Action: TCloseAction);
begin
   FreeAndNil( CtrlConfissaoDivida );
   FreeAndNil( CtrlContratoImovel );
   FreeAndNil( CtrlEventoImovel );
   //Cássio Camargo - 18/09/2008 - N. Sol 92381 -  N. Kintana 394180
   //FreeAndNil( CtrlDocumento );
   FreeAndNil(CtrlImobDocumento);
   FreeAndNil( CtrlParamIntegra );
   FreeAndNil( CtrlHistMovImob );
   FreeAndNil( CtrlOutroDado );
   inherited;
end;



function TfrmDesfazConfissaoDivida.VerificaPreenchimentoSelecao: Boolean;
begin
   Result := True;
   try
      if Trim(edtNumContrato.Text) = '' then
         raise EValidacao.CreateVal('Favor informar o contrato!', btnBuscaContrato);

      if edtDataProcesso.Text = '' then
         raise EValidacao.CreateVal('Data do processo não informada', edtDataProcesso);

      if not PermiteExclusaoContrato then
         raise EValidacao.CreateVal('O Contrato Informado possui itens de parcela. Favor desfazer a geração da Folha!', btnBuscaContrato);

   except
      on ev : EValidacao do begin
         if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Result := False;
      end;
   end;
end;




procedure TfrmDesfazConfissaoDivida.btnContinuarClick(Sender: TObject);
var
   bOk        : Boolean;
begin
   bProcessou  := True;
   bOk := False;
   memResult.Lines.Clear;
   if PagControle.ActivePage = tabSelecao then
   begin
      memResult.Lines.Add('Inicio do Processo: ' + FormatDateTime('dd/mm/yyyy hh:nn:ss',now));

      bOk := VerificaPreenchimentoSelecao;
      if bOk then
      begin
         StartTransacao;
         bProcessou                    := DesfazContabilOperacao;
         if bProcessou then bProcessou := DesfazBaixaDocumentos;
         if bProcessou then bProcessou := RegistraEvento;

         if bProcessou then
         begin
            bProcessou := True;
            memResult.Lines.Add('Inicio - Apagando dados da confissão: ' + FormatDateTime('dd/mm/yyyy hh:nn:ss',now));
            if not CtrlConfissaoDivida.ApagaConfissao then
            begin
               bProcessou := False;
               memResult.Lines.Add(CtrlConfissaoDivida.MessageInfo);
            end;
            memResult.Lines.Add('Fim - Apagando dados da confissão: ' + FormatDateTime('dd/mm/yyyy hh:nn:ss',now));
         end;

         if bProcessou then
         begin
            bProcessou := True;
            memResult.Lines.Add('Inicio - Apagando dados do contrato: ' + FormatDateTime('dd/mm/yyyy hh:nn:ss',now));
            cdsContratoImovel.Delete;
            if not CtrlContratoImovel.ExcluiContratoImovel then
            begin
               bProcessou := False;
               memResult.Lines.Add(CtrlContratoImovel.MessageInfo);
            end;
            memResult.Lines.Add('Fim - Apagando dados do contrato: ' + FormatDateTime('dd/mm/yyyy hh:nn:ss',now));
         end;

         if bProcessou then
         begin
            memResult.Lines.Add('Efetivando gravação: ' + FormatDateTime('dd/mm/yyyy hh:nn:ss',now));
            CommitTransacao;
         end
         else
         begin
            memResult.Lines.Add('Desfazendo gravação: ' + FormatDateTime('dd/mm/yyyy hh:nn:ss',now));
            RollbackTransacao;
         end;
      end;
      memResult.Lines.Add('Fim do Processo: ' + FormatDateTime('dd/mm/yyyy hh:nn:ss',now));
      if bOk then inherited;
   end;
end;



procedure TfrmDesfazConfissaoDivida.btnBuscaContratoClick(Sender: TObject);
var
   sFiltro : String;
begin
   inherited;
   sFiltro := 'C.IDRESPONSAVEL   = PR.IDPESSOA(+)'         + #13 +
              'C.IDLOCATARIO     = PL.IDPESSOA(+)'         + #13 +
              'C.IDRESPONSAVEL   = U.IDUSUARIO(+)'         + #13 +
              'C.IDTIPOCONTRIMOB = TC.IDTIPOCONTRIMOB(+)'  + #13 +
              'C.FLGTIPOCONTRATO = ''D''';

   dtmMS.MS_Contrato.Filtro.Text := sFiltro;
   dtmMS.MS_Contrato.Executar;

   // redesenha o form na volta do MontaSelect
   Repaint;

   // se houve busca, abre a query de Custos/Recebimentos por Imovel com apenas o registro buscado
   if dtmMS.MS_Contrato.RetornouValor then begin

      Screen.Cursor := crHourGlass;

      iContratoSelecao     := StrToInt(dtmMS.MS_Contrato.ValoresChave[0]);
      edtNumContrato.Text  := dtmMS.MS_Contrato.ValoresChave[1];
      edtNomeContrato.Text := dtmMS.MS_Contrato.ValoresChave[2];
      Screen.Cursor        := crDefault;

      cdsConfDividaImob.Data       := CtrlConfissaoDivida.LookupConfissao(iContratoSelecao);
      cdsConfDividaImobXDoc.Data   := CtrlConfissaoDivida.LookupConfissaoDocumentos(iContratoSelecao);
      cdsConfDividaImobXContr.Data := CtrlConfissaoDivida.LookupConfissaoContratos(iContratoSelecao);
      cdsConfDividaImobXOper.Data  := CtrlConfissaoDivida.LookupConfissaoOperacoes(iContratoSelecao);

      cdsContratoImovel.Data    := CtrlContratoImovel.LookupContratoImovel(iContratoSelecao);
      cdsContratoXImovel.Data   := CtrlContratoImovel.LookupContratoXImovel(iContratoSelecao);
      CdsContratoXVlrAno.Data   := CtrlContratoImovel.LookupContratoXVlrAno(iContratoSelecao);
      CdsAvalistaXContrato.Data := CtrlContratoImovel.LookupContratoXFiador(iContratoSelecao);
      CdsEventoImovel.Data      := CtrlEventoImovel.LookupEventoImovel( -1, -1, iContratoSelecao, -1, -1, True );
      CdsContratoXDesc.Data     := CtrlContratoImovel.LookupContratoXDesc(iContratoSelecao);
      CdsCondPagImovel.Data     := CtrlContratoImovel.LookupContratoXCondPag(iContratoSelecao);
      CdsOutroDadoXImovel.Data  := CtrlOutroDado.LookupOutroDadoXImovel(-2,-2);

   end;

   btnBuscaContrato.SetFocus;

end;



procedure TfrmDesfazConfissaoDivida.btnLimpaContratoClick(Sender: TObject);
begin
   inherited;
   iContratoSelecao  := -1;
   edtNumContrato.Clear;
   edtNomeContrato.Clear;
end;



function TfrmDesfazConfissaoDivida.PermiteExclusaoContrato: Boolean;
begin
   memResult.Lines.Add('Início - Verificação de itens no histórico: ' + FormatDateTime('dd/mm/yyyy hh:nn:ss',now));
   Result := True;
   while not cdsCondPagImovel.eof do
   begin
      cdsAux.Data := CtrlHistMovImob.LookupHistMovImob(cdsCondPagImovel.FieldByName('IDCONDPAGIMOVEL').AsInteger,-1,0);
      if not cdsAux.IsEmpty then
      begin
         Result := False;
         Exit;
      end;
      cdsCondPagImovel.Next;
   end;
   memResult.Lines.Add('Fim de Verificação de itens no histórico: ' + FormatDateTime('dd/mm/yyyy hh:nn:ss',now));
end;



function TfrmDesfazConfissaoDivida.DesfazContabilOperacao : Boolean;
var
   iPlanilha : Integer;
begin
   Result := True;

   memResult.Lines.Add('Inicio - Desfaz Contabilização de Operação: ' + FormatDateTime('dd/mm/yyyy hh:nn:ss',now));

   cdsConfDividaImob.First;
   while not cdsConfDividaImob.eof do
   begin
      if not cdsConfDividaImob.FieldByName('PLNCODIGO').IsNull then
      begin
         iPlanilha := cdsConfDividaImob.FieldByName('PLNCODIGO').AsInteger;

         cdsConfDividaImob.Edit;
         cdsConfDividaImob.FieldByName('PLNCODIGO').Clear;
         cdsConfDividaImob.Post;



         if not CtrlHistMovImob.DesfazContabilizacao(Sistema.IdUsuario,
                                                     iPlanilha,
                                                     Sistema.IdModulo,
                                                     0,
                                                     Sistema.UsaPlanoPatro,
                                                     True,
                                                     False) then
         begin
            memResult.Lines.Add(CtrlHistMovImob.MessageInfo);
            Result := False;
         end;
      end;
      cdsConfDividaImob.Next;
   end;
   memResult.Lines.Add('Fim - Desfaz Contabilização de Operação: ' + FormatDateTime('dd/mm/yyyy hh:nn:ss',now));
end;



function TfrmDesfazConfissaoDivida.DesfazBaixaDocumentos : boolean;
begin
   Result := True;
   memResult.Lines.Add('Inicio - Desfaz Desfaz Baixa de Documentos: ' + FormatDateTime('dd/mm/yyyy hh:nn:ss',now));
   cdsConfDividaImobXDoc.First;
   while not cdsConfDividaImobXDoc.Eof do
   begin
      //Cássio Camargo - 18/09/2008 - N. Sol 92381 -  N. Kintana 394180
      {CtrlDocumento.Prepare(OpLanctoDocum, odlAlterador);
      CtrlDocumento.CodDocumento          := cdsConfDividaImobXDoc.FieldByName('CODDOCUMENTO').AsInteger;
      CtrlDocumento.Lanctodocum.NumLancto := cdsConfDividaImobXDoc.FieldByName('IDLANCTODOCUMLIQ').AsInteger;}
      CtrlImobDocumento.Prepare(OpLanctoDocumImob, odlAlteradorImob);
      CtrlImobDocumento.CodDocumento          := cdsConfDividaImobXDoc.FieldByName('CODDOCUMENTO').AsInteger;
      CtrlIMobDocumento.Lanctodocum.NumLancto := cdsConfDividaImobXDoc.FieldByName('IDLANCTODOCUMLIQ').AsInteger;

      //if not CtrlDocumento.Delete then
      if not CtrlImobDocumento.Delete then
      begin
         //memResult.Lines.Add(CtrlDocumento.MessageInfo);
         memResult.Lines.Add(CtrlImobDocumento.MessageInfo);
         Result := False;
      end;

      cdsConfDividaImobXDoc.Next;
   end;
   memResult.Lines.Add('Fim - Desfaz Desfaz Baixa de Documentos: ' + FormatDateTime('dd/mm/yyyy hh:nn:ss',now));
end;



function TfrmDesfazConfissaoDivida.RegistraEvento: boolean;
begin
   Result := True;
   memResult.Lines.Add('Inicio - Registra Evento: ' + FormatDateTime('dd/mm/yyyy hh:nn:ss',now));
   cdsConfDividaImobXContr.First;
   while not cdsConfDividaImobXContr.Eof do
   begin

      if not CtrlEventoImovel.RegistraEvento(-1,
                                         cdsConfDividaImobXContr.FieldByName('IDCONTRATOIMOVEL').AsInteger,
                                         -1,-1,Sistema.IdUsuario,'CD','Confissão de Dívidas',
                                         'Desfeito o contrato de confissão de dívida ' + cdsContratoImovel.FieldByName('CONNUMERO').AsString,
                                         edtDataProcesso.Date,-1,-1,-1,-1,-1,False) then
      begin
         memResult.Lines.Add(CtrlEventoImovel.MessageInfo);
         Result := False;
      end;
      cdsConfDividaImobXContr.Next;
   end;
   memResult.Lines.Add('Fim - Registra Evento: ' + FormatDateTime('dd/mm/yyyy hh:nn:ss',now));
end;



end.





