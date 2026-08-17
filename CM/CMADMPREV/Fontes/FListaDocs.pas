// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Rotina      : Criação da tela
// Autor(a)    : Gleyber
// Data        : 11/05/2004
// Pendência   : 16420
// Descrição   : Criação da rotina de visualização de documentos do titular.
//-----------------------------------------------------------------------------
unit FListaDocs;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, Db, DBTables, Pessoa, Wwquery, ComCtrls, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Mask,
  wwdbedit, wwdblook, CMDBLookupCombo, wwdbdatetimepicker,
  CMDateTimePicker, DBCtrls, Wwdatsrc;

type
  TFrmListaDocs = class(TfrmOkCancelar)
    lstDocumentos: TListView;
    qryDocumento: TwwQuery;
    pnlItemsDoc: TPanel;
    pnlNomeDoc: TPanel;
    DBText1: TDBText;
    pnlOrgao: TPanel;
    lblPdOrgao: TLabel;
    wwDBEdit1: TwwDBEdit;
    pnlEmissao: TPanel;
    lblPdEmiss: TLabel;
    CMDateTimePicker2: TCMDateTimePicker;
    pnlUF: TPanel;
    lblPdUF: TLabel;
    dbcmbEstadoDoc: TCMDBLookupCombo;
    pnlNumDoc: TPanel;
    edDocNumDocumento: TwwDBEdit;
    PnlValidade: TPanel;
    LblDtValidade: TLabel;
    CMDateTimePicker1: TCMDateTimePicker;
    Pessoa: TPessoa;
    dsDocumento: TwwDataSource;
    procedure lstDocumentosChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
  private
    { Private declarations }
    procedure MudaDocumento;
  public
    Procedure ListaDocumentos( piIdPessoa : Integer; psNome : String);
    { Public declarations }
  end;

var
  FrmListaDocs: TFrmListaDocs;

implementation

{$R *.DFM}

{ TFrmListaDocs }

procedure TFrmListaDocs.ListaDocumentos( piIdPessoa : Integer; psNome : String);
Var
  li : TListItem;
begin
  Self.Caption := 'Documentos de '+psNome;
  With qryDocumento Do
  Begin
    Close;
    ParamByName('IDPESSOA').AsInteger := piIdPessoa;
    Open;

    lstDocumentos.Onchange := nil;
    lstDocumentos.Items.clear;
    First;
    While Not Eof Do
    Begin
         li := lstDocumentos.Items.Add;
         li.Caption := FieldByName('NOMEDOCUMENTO').AsString;
         li.Data := TObject(FieldByName('IDDOCUMENTO').AsInteger);
         FieldByName('NUMDOCUMENTO').EditMask := Pessoa.MaskField(FieldByName('MASCARA').AsString);
         edDocNumDocumento.SelectAll;
         li.SubItems.Add(edDocNumDocumento.SelText);
         edDocNumDocumento.ClearSelection;
         next;
    End;
    If RecordCount > 1
     Then Begin
         lstDocumentos.OnChange := lstDocumentosChange;
         lstDocumentos.Items[0].Selected := true;
         lstDocumentos.Items[0].Focused := true;
     End;
  End;
end;

procedure TFrmListaDocs.MudaDocumento;
begin
  With qryDocumento do
  Begin
     If Active
      Then Begin
          Locate('IDDOCUMENTO', Integer(lstDocumentos.Selected.Data),[]);
          FieldByName('NUMDOCUMENTO').EditMask := Pessoa.MaskField(FieldByName('MASCARA').AsString);
          pnlEmissao.Visible := (FieldByName('OBRIGAEMISSAO').AsString = 'S') ;
          pnlUF.Visible := (FieldByName('OBRIGAUF').AsString = 'S');
          pnlOrgao.Visible := (FieldByName('OBRIGAORGAO').AsString = 'S');
          PnlValidade.Visible := (FieldByName('FLGOBRIGAVALIDADE').AsString = 'S');
     End;
  End;
end;

procedure TFrmListaDocs.lstDocumentosChange(Sender: TObject;
  Item: TListItem; Change: TItemChange);
begin
  inherited;
   if Item.Selected then  MudaDocumento; 
end;

end.
