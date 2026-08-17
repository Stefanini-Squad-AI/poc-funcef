{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Pendência   : 27394
Responsável : Daniel Simões
Data        : 14/02/2008
Descrição   : Alteração/Implementação do número do Help Context...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit FCadItensXFormaCalculo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjudaImob, fcButton, fcImgBtn, fcShapeBtn, ComCtrls, StdCtrls,
  wwdblook, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, uMensErro,
  ExtCtrls, Db, DBClient, uCMClientDataSet, uCmSqlParams, uSistema, UCtrlPadroes,
  uCtrlFormaCalcImob;

type
  TfrmCadItensXFormaCalculo = class(TfrmSairAjudaImob)
    Label4: TLabel;
    dbcboFormaCalculo: TwwDBLookupCombo;
    Panel1: TPanel;
    LstItensNAOAss: TListBox;
    LstItensAss: TTreeView;
    Panel3: TPanel;
    btnIncluir: TfcShapeBtn;
    btnExcluir: TfcShapeBtn;
    btnDetalhe: TBitBtn;
    cdsFormaCalculo: TCMClientDataSet;
    cdsItemXFormaCalc: TCMClientDataSet;
    cdsItensNaoAss: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbcboFormaCalculoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnDetalheClick(Sender: TObject);
    procedure LstItensAssChange(Sender: TObject; Node: TTreeNode);
  private
    { Private declarations }
    CtrlFormaCalcImob : TCtrlFormaCalcImob;

    function CompletaInicio(sOriginal, sCompleta: string; iLimiteTamanho: word): string;
    procedure AbreItens;
    
  public
    { Public declarations }
  end;

var
  frmCadItensXFormaCalculo: TfrmCadItensXFormaCalculo;

implementation

uses FCadItemDetalhe;

{$R *.DFM}

procedure TfrmCadItensXFormaCalculo.FormCreate(Sender: TObject);
begin
   inherited;
   CtrlFormaCalcImob := TCtrlFormaCalcImob.Create;
   CtrlFormaCalcImob.InitializeAs(Padroes);
   CtrlFormaCalcImob.CdsItemFormaCalc := cdsItemXFormaCalc;

   cdsFormaCalculo.Data := CtrlFormaCalcImob.LookupFormaCalcImob(Sistema.IdModulo);
end;



procedure TfrmCadItensXFormaCalculo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   FreeAndNil(CtrlFormaCalcImob);
   inherited;
end;



procedure TfrmCadItensXFormaCalculo.dbcboFormaCalculoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;
   if dbcboFormaCalculo.LookupValue <> '' then begin
      AbreItens;
   end;
end;



procedure TfrmCadItensXFormaCalculo.AbreItens;
var
   sItem     : String;
   nNoPai    : TTreeNode;
   nNoFilho  : TTreeNode;
   DscEvento : String;
begin
   nNoPai   := nil;
   nNoFilho := nil;

   cdsItemXFormaCalc.Data := CtrlFormaCalcImob.LookupItemXForma(StrToInt(dbcboFormaCalculo.LookupValue));

   LstItensAss.Items.Clear;
   nNoPai    := LstItensAss.Items.Add(nNoPai,cdsItemXFormaCalc.FieldByName('DESCEVENTO').AsString);
   DscEvento := cdsItemXFormaCalc.FieldByName('DESCEVENTO').AsString;

   while not(cdsItemXFormaCalc.EOF) do begin
      sItem := '(' + CompletaInicio(IntToStr(cdsItemXFormaCalc.FieldByName('IDTIPOCUSTORECIMO').asInteger), ' ', 3) + ' ) ';

      if DscEvento <> cdsItemXFormaCalc.FieldByName('DESCEVENTO').AsString then
      begin
        nNoPai := LstItensAss.Items.Add(nNoPai,cdsItemXFormaCalc.FieldByName('DESCEVENTO').AsString);
      end;

      if cdsItemXFormaCalc.FieldByName('FLGCENTRALIZA').AsInteger = 1 then
      begin
         nNoFilho  := LstItensAss.Items.AddChild(nNoPai, sItem + cdsItemXFormaCalc.FieldByName('NOMEITEM').AsString);
         DscEvento := cdsItemXFormaCalc.FieldByName('DESCEVENTO').AsString;
      end;

      if cdsItemXFormaCalc.FieldByName('FLGCENTRALIZA').AsInteger = 0 then
         LstItensAss.Items.AddChild(nNoFilho, sItem + cdsItemXFormaCalc.FieldByName('NOMEITEM').AsString);

      cdsItemXFormaCalc.Next;
   end; 

   cdsItemXFormaCalc.First;

   LstItensNAOAss.Items.Clear;
   cdsItensNaoAss.Data := CtrlFormaCalcImob.LookupItemNaoAssociado(sistema.IdModulo,StrToInt(dbcboFormaCalculo.LookupValue));

   while not cdsItensNaoAss.EOF do begin
      LstItensNAOAss.Items.Add(cdsItensNaoAss.FieldByName('DESCCUSTORECIMO').AsString);
      cdsItensNaoAss.Next;
   end;

   LstItensAss.FullExpand;
   LstItensAss.Selected := LstItensAss.Items[0];
end;



function TfrmCadItensXFormaCalculo.CompletaInicio(sOriginal, sCompleta: string; iLimiteTamanho: word): string;
var
   i     : Integer;
   sAux  : String;
begin
   sAux := '';
   for i := 1 to iLimiteTamanho do sAux := sAux + sCompleta;

   Result := copy((sAux + sOriginal), (length((sAux + sOriginal)) - (iLimiteTamanho - 1)), iLimiteTamanho);
end;



procedure TfrmCadItensXFormaCalculo.btnIncluirClick(Sender: TObject);
var
   sBusca : String;
begin
   inherited;
   if LstItensNAOAss.Items[LstItensNAOAss.ItemIndex] = '' then Exit;

   sBusca := Trim(LstItensNAOAss.Items[LstItensNAOAss.ItemIndex]);
   cdsItensNaoAss.Locate('DESCCUSTORECIMO', sBusca, []);

   cdsItemXFormaCalc.Insert;
   cdsItemXFormaCalc.FieldByName('IDFORMACALCIMOB').AsInteger   := StrToInt(dbcboFormaCalculo.LookupValue);
   cdsItemXFormaCalc.FieldByName('IDTIPOCUSTORECIMO').AsInteger := cdsItensNaoAss.FieldByName('IDTIPOCUSTORECIMO').AsInteger;
   cdsItemXFormaCalc.FieldByName('FLGCENTRALIZA').AsInteger     := cdsItensNaoAss.FieldByName('FLGCENTRALIZA').AsInteger;
   cdsItemXFormaCalc.Post;

   if not CtrlFormaCalcImob.GravaItemFormaCalcImob then
      MsgDlg(CtrlFormaCalcImob.MessageInfo,'Aviso',mtWarning,[mbOK],0);

   AbreItens;
end;



procedure TfrmCadItensXFormaCalculo.btnExcluirClick(Sender: TObject);
var
   sBusca : String;
begin
   inherited;
   if LstItensAss.Selected.Text = '' then Exit;

   sBusca := trim(copy(LstItensAss.Selected.Text, 7, 60));

   if cdsItemXFormaCalc.Locate('NOMEITEM',sBusca,[]) then
   begin
      cdsItemXFormaCalc.Delete;

      if not CtrlFormaCalcImob.GravaItemFormaCalcImob then
         MsgDlg(CtrlFormaCalcImob.MessageInfo,'Aviso',mtWarning,[mbOK],0);

      AbreItens;
   end;
end;



procedure TfrmCadItensXFormaCalculo.btnDetalheClick(Sender: TObject);
var
   sBusca : String;
begin
   inherited;
   if LstItensAss.Selected.Text = '' then Exit;

   sBusca := trim(copy(LstItensAss.Selected.Text, 7, 60));

   if cdsItemXFormaCalc.Locate('NOMEITEM',sBusca,[]) then
   begin

      Application.CreateForm(TfrmCadItemDetalhe, frmCadItemDetalhe);
      frmCadItemDetalhe.Item    := sBusca;
      frmCadItemDetalhe.iForma  := cdsItemXFormaCalc.FieldByName('IDFORMACALCIMOB').AsInteger;
      frmCadItemDetalhe.CodItem := cdsItemXFormaCalc.FieldByName('IDTIPOCUSTORECIMO').AsInteger;
      frmCadItemDetalhe.ShowModal;

      AbreItens;
   end;
end;



procedure TfrmCadItensXFormaCalculo.LstItensAssChange(Sender: TObject;
  Node: TTreeNode);
begin
   inherited;
   btnDetalhe.Enabled := ((Node.Level <> 0) or
                          ((Node.Level = 0) and (LstItensAss.Selected <> nil) and (trim(copy(LstItensAss.Selected.Text, 1, 1)) = '('))
                         );
end;



end.
