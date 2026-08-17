unit fCadDocOfic;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fCadastroGridCS,
  IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls, Mask,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, wwdblook,
  wwdbedit, CmEventosCadastro, ImgList;

type
  TfrmCadDocOfic = class(TFrmCadastroGridCS)
    Label1: TLabel;
    wwDBEdit1: TwwDBEdit;
    Label2: TLabel;
    wwDBEdit2: TwwDBEdit;
    Label3: TLabel;
    dblcTipoDoc: TwwDBLookupCombo;
    qryTipoDoc: TwwQuery;
    procedure qryBeforePost(DataSet: TDataSet);
    Procedure CmeCadastroFind(Sender: TObject);
    procedure dblcTipoDocChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  end;

var
  frmCadDocOfic: TfrmCadDocOfic;

implementation

uses uMensErro, dBaseDados, uFuncoesUteis;

{$R *.DFM}

procedure TfrmCadDocOfic.FormCreate(Sender: TObject);
begin
  inherited;
  qryTipoDoc.Open;
end;

procedure TfrmCadDocOfic.CmeCadastroFind(Sender: TObject);
begin
  if (MontaSelect.RetornouValor) then
    qry.Locate ('CODDOCUMENTO', MontaSelect.ValoresChave[0], []);
end;

procedure TfrmCadDocOfic.qryBeforePost(DataSet: TDataSet);
begin
  inherited;
  qry.FieldByName('SIGLADOCUMENTO').asString := Trim(qry.FieldByName('SIGLADOCUMENTO').asString);
end;

procedure TfrmCadDocOfic.dblcTipoDocChange(Sender: TObject);
begin
  if (qry.State in [dsInsert,dsEdit]) then
  begin
    if (Trim(dblcTipoDoc.Text) <> '') and (qryTipoDoc.Locate('NOMEDOCUMENTO',
        qryTipoDoc.FieldByName('NOMEDOCUMENTO').asString,[])) then
    begin
      with (dtmBaseDados.qry) do
      begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT IDDOCUMENTO');
        SQL.Add('FROM   TIPODOCOFICIAL');
        SQL.Add('WHERE  (IDDOCUMENTO = ' +qryTipoDoc.FieldByName('IDDOCUMENTO').asString+ ')');
        Open;
      end;  
      if (dtmBaseDados.qry.IsEmpty) then
        qry.FieldByName('NOMEDOCUMENTO').asString := qryTipoDoc.FieldByName('NOMEDOCUMENTO').asString
      else
      begin
        qry.FieldByName('IDDOCUMENTO').Clear;
        MsgDlg('Não é permitido a seleção deste Tipo de Documento'+CR_LF+
               'pois ele já foi selecionado em outros Documentos Oficiais!','Aviso',mtInformation,[mbOk,mbHelp],0);
      end;
    end
    else
      qry.FieldByName('NOMEDOCUMENTO').Clear;
  end;    
end;

end.
