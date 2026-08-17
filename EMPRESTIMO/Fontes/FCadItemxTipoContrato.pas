{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
-------------------------------------------------------------------------------
Pendência   : SOL 179157 KINTANA 1647959
Responsável : BRUNO AZEVEDO
Data        : 26/04/2012
Descrição   : Ajuste ao carregar os itens.
-------------------------------------------------------------------------------
Pendência   : SOL 129014 KINTANA 698559
Responsável : Ádler Souza
Data        : 06/05/2010
Descrição   : Parametrização para itens que terão valores transferidos para o PGA.
--------------------------------------------------------------------------------
Pendência   : 27370
Responsável : Daniel Simões
Data        : 11/02/2008
Descrição   : Alteração/Implementação do número do Help Context...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit FCadItemxTipoContrato;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, wwdblook, Db, Wwdatsrc, DBTables, Wwquery, StdCtrls, Mask,
  wwdbedit, DBCtrls, MAHlpBtn, Buttons, TB97, ExtCtrls, UMensErro, UAutorizacao,
  USistema, FTelaAut, ComCtrls, Menus, CMTree, TB97Tlbr, IvDictio, IvMulti,
  IvEMulti, uIntegraBack, FSairAjuda, fcButton, fcImgBtn, fcShapeBtn;

type
  TfrmCadItemxTipoContrato = class(TfrmSairAjuda)
    qryRecCred: TwwQuery;
    dsItens: TwwDataSource;
    qryTipoContrato: TwwQuery;
    qryAux: TwwQuery;
    dbcoTipoContrato: TwwDBLookupCombo;
    qryItens: TwwQuery;
    LstItensNAOAss: TListBox;
    Label4: TLabel;
    Label5: TLabel;
    LstItensAss: TTreeView;
    Panel3: TPanel;
    Panel1: TPanel;
    qryTipoContratoIDTIPOEMPTMO: TFloatField;
    qryTipoContratoDESCTIPOEMPTMO: TStringField;
    btnDetalhe: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    qryItensITCSEQCALCULO: TFloatField;
    qryItensFLGDESTACADO: TFloatField;
    qryItensFLGCENTRALIZA: TFloatField;
    qryItensITCEVENTO: TFloatField;
    qryItensIDPROVENTON: TFloatField;
    qryItensIDPROVENTOA: TFloatField;
    qryItensIDPROVENTOD: TFloatField;
    qryItensITCRECPAG: TStringField;
    qryItensITEDESCRICAO: TStringField;
    qryItensIDITEMEMPTMO: TFloatField;
    qryRecCredIDITEMEMPTMO: TFloatField;
    qryRecCredITEDESCRICAO: TStringField;
    dsDadosTpContrato: TwwDataSource;
    edtTipoEmptmo: TEdit;
    qryTipoContratoIDTIPOCONTREMPTMO: TFloatField;
    qryTipoContratoTCEDESCRICAO: TStringField;
    btnIncluir: TfcShapeBtn;
    btnExcluir: TfcShapeBtn;
    qryItensDESCEVENTO: TStringField;

    procedure FormActivate(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure dbcoTipoContratoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnDetalheClick(Sender: TObject);
    procedure LstItensAssChanging(Sender: TObject; Node: TTreeNode;
      var AllowChange: Boolean);


   private  // Private declarations

    Item : String;

    procedure AbreItens;
    procedure Processar;


   public   // Public declarations

    bVaiInserir : Boolean;
    bConfirmou  : Boolean;

    procedure Atualizar;


  end;



var
  frmCadItemxTipoContrato: TfrmCadItemxTipoContrato;



implementation
{$R *.DFM}
uses
   FCadItemDetalhe,
   UFuncoesEmptmo, (* LimpaParametros *)
   UModulo,
   uDataBase,
   DBaseDados;




procedure TfrmCadItemxTipoContrato.FormActivate(Sender: TObject);
begin

   inherited;

   (* Procedure que abre a query para a escolha do Tipo de Contrato/Empréstimo *)
   with qryTipoContrato do begin
     LimpaParametros(qryTipoContrato);
     ParamByName('PIDEMPRESAPROP').asInteger := Sistema.IdEmpresa;
     Open;
   end;(* with qryTipoContrato *)
end;



procedure TfrmCadItemxTipoContrato.Processar;
begin
   frmCadItemDetalhe                := TfrmCadItemDetalhe.Create(self);
   frmCadItemDetalhe.Item           := Item;
   frmCadItemDetalhe.CodItemRC      := qryRecCredIDItemEmptmo.AsInteger;
   frmCadItemDetalhe.IdTipContrato  := qryTipoContratoIDTipoContrEmptmo.AsInteger;
   frmCadItemDetalhe.ShowModal;
   frmCadItemDetalhe.Free;

   if bConfirmou then
   begin
      if dtmBaseDados.dbBaseDados.InTransaction then
      begin
         dtmBaseDados.dbBaseDados.Commit;
         Atualizar;
      end;
   end
   else
   begin

      // Pendência 26325 - 11/09/2007 - Alberto
      MsgDlg('O detalhamento do item é obrigatório para efetuar sua associação com o tipo de contrato!', 'Empréstimo', mtError, [mbOk], 0);

      bConfirmou := True;

      if dtmBaseDados.dbBaseDados.InTransaction then dtmBaseDados.dbBaseDados.Rollback;
   end;
end;



procedure TfrmCadItemxTipoContrato.btnIncluirClick(Sender: TObject);
var
   sItem : String;
   sSQL  : String;
begin
   // ----------------------------------------------------------------------------------------------

   // Inicia uma transação - só se não ouver transação iniciada
   if dtmBaseDados.dbBaseDados.InTransaction then
   begin
      MsgDlg('Transação anterior em progresso!', 'Empréstimo', mtError, [mbOk], 0);
      Repaint;
      Exit;
   end;

   //Pendência 26325 - 11/09/2007 - Alberto

   // ----------------------------------------------------------------------------------------------

   if LstItensNAOAss.ItemIndex = -1 then
   begin
      MsgDlg('Nenhum item selecionado!', 'Empréstimo', mtError, [mbOK], 0);
      LstItensNAOAss.SetFocus;
      Exit;
   end;

   // Pendência 26325 - 11/09/2007 - Alberto
   StartTransacao;

   Item := LstItensNAOAss.Items[LstItensNAOAss.ItemIndex];

   qryRecCred.Locate('ITEDESCRICAO', LstItensNAOAss.Items[LstItensNAOAss.ItemIndex], [loPartialKey]);

   sItem       := qryRecCredIDITEMEMPTMO.AsString;
   bVaiInserir := True;
   bConfirmou  := False;

   sSQL :=
   'INSERT INTO ITEMXTIPOCONTR '    + #13 +
   '( '                             + #13 +
   'IDTIPOCONTREMPTMO' + ', '       + #13 +
   'IDITEMEMPTMO' + ', '            + #13 +
   'PLANO '                         + #13 +
   ') '                             + #13 +
   'VALUES '                        + #13 +

   '( ' + #13 +
   qryTipoContratoIDTIPOCONTREMPTMO.AsString + ', ' + #13 +
   sItem                                     + ', ' + #13 +
   IntToStr(Modulo.iPlano)                   + #13 +
   ') ';

   qryAux.SQL.Clear;
   qryAux.SQL.Text := sSQL;

   try
      qryAux.ExecSQL;

   except
      MsgDlg('Não foi possível completar a inclusão!', 'Empréstimo', mtError, [mbOK], 0);
      Repaint;

      Raise;
      Repaint;
   end;

   Processar;
   AbreItens;
end;



procedure TfrmCadItemxTipoContrato.btnExcluirClick(Sender: TObject);
var
   sSQL     : String;
   sBusca   : String;
begin
   inherited;

   if LstItensAss.Items.Item[0].Text = '' then Exit;

   sBusca := trim(copy(LstItensAss.Selected.Text, 7, 60));

   (* Procedure que abre a query que busca os Itens *)
   with qryItens do
   begin
      LimpaParametros(qryItens);
      ParamByName('PIDTIPOCONTREMPTMO').AsInteger := qryTipoContratoIDTipoContrEmptmo.AsInteger;
      Open;
      Locate('ITEDESCRICAO', sBusca, [loPartialKey]);
   end; (* with qryItens *)

   sSQL :=
   'SELECT '                                                                        + #13 +
   '   HME.IDCONTRATOEMPTMO '                                                       + #13 +
   'FROM '                                                                          + #13 +
   '   HISTMOVEMPTMO  HME, '                                                        + #13 +
   '   CONTRATOEMPTMO CON '                                                         + #13 +
   'WHERE '                                                                         + #13 +
   '      CON.IDTIPOCONTREMPTMO  = ' + qryTipoContratoIDTIPOCONTREMPTMO.AsString    + #13 +
   '  AND HME.IDITEMEMPTMO       = ' + qryItensIDITEMEMPTMO.AsString                + #13 +
   '  AND ROWNUM                 = 1 '                                              + #13 +
   '  AND CON.IDCONTRATOEMPTMO   = HME.IDCONTRATOEMPTMO ';

   qryAux.SQL.Clear;
   qryAux.SQL.Text := sSQL;
   qryAux.Open;

   if not(qryAux.IsEmpty) then begin
      MsgDlg('Não é possível completar a exclusão. ' + #13 +
             'Já existe Contrato utilizando o item selecionado.', 'Empréstimo', mtError, [mbOK], 0);
      Exit;
   end;

   sSQL :=
   'DELETE FROM '       + #13 +
   '  ITEMXTIPOCONTR '  + #13 +
   'WHERE '             + #13 +
   '      IDTIPOCONTREMPTMO = ' + IntToStr(qryTipoContratoIDTIPOCONTREMPTMO.AsInteger) + #13 +
   '  AND IDITEMEMPTMO  = ' + IntToStr(qryItensIDITEMEMPTMO.AsInteger);

   qryAux.SQL.Clear;
   qryAux.SQL.Text := sSQL;

   try
      qryAux.ExecSQL;

      if dtmBaseDados.dbBaseDados.InTransaction then CommitTransacao;

   except
      if dtmBaseDados.dbBaseDados.InTransaction then RollbackTransacao;

      MsgDlg('Não foi possível completar a exclusão!', 'Empréstimo', mtError, [mbOK], 0);
      Repaint;

      Raise;
      Repaint;
   end;

   AbreItens;
end;



procedure TfrmCadItemxTipoContrato.dbcoTipoContratoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;
   edtTipoEmptmo.Text := qryTipoContratoDESCTIPOEMPTMO.AsString;
   //BRUNO AZEVEDO SOL 179157 KINTANA 1647959 - INICIO
   if (Trim(dbcoTipoContrato.Text) <> '') then begin
     AbreItens;
   end else begin
     LstItensAss.Items.Clear;
     LstItensNAOAss.Items.Clear;
   end;
   //BRUNO AZEVEDO SOL 179157 KINTANA 1647959 - FIM
end;

procedure TfrmCadItemxTipoContrato.AbreItens;
var
   sItem     : String;
   nNoPai    : TTreeNode;
   nNoFilho  : TTreeNode;
   DscEvento : String;
begin
   nNoPai   := nil;
   nNoFilho := nil;

   // Procedure que abre a query que busca os Itens
   with qryItens do begin
     LimpaParametros(qryItens);
     ParamByName('PIDTIPOCONTREMPTMO').AsInteger := qryTipoContratoIDTipoContrEmptmo.AsInteger;
     Open;
     First;
   end; // with qryItens

   LstItensAss.Items.Clear;
   nNoPai    := LstItensAss.Items.Add(nNoPai,qryItensDESCEVENTO.AsString);
   DscEvento := qryItensDESCEVENTO.AsString;

   while not(qryItens.EOF) do begin
      sItem := '(' + CompletaInicio(IntToStr(qryItensIDITEMEMPTMO.asInteger), ' ', 3) + ') ';

      If DscEvento <> qryItensDESCEVENTO.AsString then
      begin
        nNoPai := LstItensAss.Items.Add(nNoPai,qryItensDESCEVENTO.AsString);
      end;

      if ((qryItensFLGDESTACADO.AsInteger = 0) and (qryItensFLGCENTRALIZA.AsInteger = 1)) or
         ((qryItensFLGDESTACADO.AsInteger = 1) and (qryItensFLGCENTRALIZA.AsInteger = 0)) then
        begin
         nNoFilho  := LstItensAss.Items.AddChild(nNoPai, sItem + qryItensIteDescricao.AsString);
         DscEvento := qryItensDESCEVENTO.AsString
        end;

      If (qryItensFLGCENTRALIZA.AsInteger = 0) and (qryItensFLGDESTACADO.AsInteger = 0) then
         LstItensAss.Items.AddChild(nNoFilho, sItem + qryItensIteDescricao.AsString);

      qryItens.Next;

   end; // while not(EOF)

   qryItens.First;

   LstItensNAOAss.Items.Clear;
   qryRecCred.Close;
   qryRecCred.Open;

   while not(qryRecCred.EOF) do begin
      LstItensNAOAss.Items.Add(qryRecCredITEDESCRICAO.AsString);
      qryRecCred.Next;
   end;

   qryRecCred.First;

   LstItensAss.FullExpand;
   LstItensAss.Selected := LstItensAss.Items[0];
end;


procedure TfrmCadItemxTipoContrato.Atualizar;
var
   SavePlace: TBookmark;
begin
   inherited;
   SavePlace := qryTipoContrato.GetBookmark;

   (* Procedure que abre a query para a escolha do Tipo de Contrato/Empréstimo *)
   with qryTipoContrato do begin
     LimpaParametros(qryTipoContrato);
     ParamByName('PIDEMPRESAPROP').asInteger := Sistema.IdEmpresa;
     Open;
   end;(* with qryTipoContrato *)

   qryTipoContrato.GotoBookmark(SavePlace);
   dbcoTipoContrato.Text := qryTipoContratoTceDescricao.AsString;
   AbreItens;
end;



procedure TfrmCadItemxTipoContrato.btnDetalheClick(Sender: TObject);
begin
   inherited;

   bConfirmou  := False;
   bVaiInserir := False;

   (* Procedure que abre a query que busca os Itens *)
   with qryItens do begin
      LimpaParametros(qryItens);
      ParamByName('PIDTIPOCONTREMPTMO').AsInteger := qryTipoContratoIDTipoContrEmptmo.AsInteger;
      Open;

      Locate('ITEDESCRICAO', Copy(LstItensAss.Selected.Text, 7, 60), []);
   end; (* with *)


   (* passa as informações para o form de detalhe *)
   frmCadItemDetalhe                := TfrmCadItemDetalhe.Create(Self);
   frmCadItemDetalhe.Item           := LstItensAss.Selected.Text;

   frmCadItemDetalhe.CodItemRC      := qryItensIDItemEmptmo.AsInteger;
   frmCadItemDetalhe.IdTipContrato  := qryTipoContratoIDTipoContrEmptmo.AsInteger;

   while not(bConfirmou) do frmCadItemDetalhe.ShowModal;

   frmCadItemDetalhe.Free;

   bConfirmou := True;
end;



procedure TfrmCadItemxTipoContrato.LstItensAssChanging(Sender: TObject; Node: TTreeNode; var AllowChange: Boolean);
begin
  inherited;
  btnDetalhe.Enabled := Node.Level <> 0;
end;



end.
