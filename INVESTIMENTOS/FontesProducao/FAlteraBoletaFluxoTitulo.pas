unit FAlteraBoletaFluxoTitulo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, CmEventosCadastro, ImgList, Db, Wwdatsrc, MontaSelect,
  DBTables, IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, DBCtrls, Mask,
  wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmAlteraBoletaFluxoTitulo = class(TfrmCadastroCS)
    dbLote: TDBEdit;
    Label1: TLabel;
    Label5: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    dbNumDocumento: TDBEdit;
    Label4: TLabel;
    edtObs: TDBMemo;
    edDataRef: TCMDateTimePicker;
    Label2: TLabel;
    qryIDOPERACAOINVEST: TFloatField;
    qryIDLOTE: TStringField;
    qryDATAOPERACAO: TDateTimeField;
    qryNUMDOCUMENTO: TStringField;
    qryOBSERVACAO: TStringField;
    qryDESCTIPOOPERACAO: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroFind(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAlteraBoletaFluxoTitulo: TfrmAlteraBoletaFluxoTitulo;

implementation

{$R *.DFM}

procedure TfrmAlteraBoletaFluxoTitulo.FormCreate(Sender: TObject);
begin
  inherited;
   edDataRef.Date := Date;
end;

procedure TfrmAlteraBoletaFluxoTitulo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   Qry.Close;
end;

procedure TfrmAlteraBoletaFluxoTitulo.CmeCadastroFind(Sender: TObject);
begin
  inherited;
   If (MontaSelect.ValoresChave.Count > 0) And (MontaSelect.ValoresChave[0] <> '') Then
   begin
      with Qry do
      begin
         Close;
         ParamByName('IDOPERACAOINVEST').AsInteger := StrToInt(MontaSelect.ValoresChave[0]);
         Open;
         if not IsEmpty then
         begin
            edDataRef.Date      := FieldByName('DATAOPERACAO').AsDateTime;
            dbLote.Text         := FieldByName('IDLOTE').AsString;
            dbNumDocumento.Text := FieldByName('NUMDOCUMENTO').AsString;
            edtObs.Text         := FieldByName('OBSERVACAO').AsString;
         end;
      end
   End;
end;

end.
