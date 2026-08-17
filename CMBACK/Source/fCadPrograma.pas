//DF 05/07 Gustavo
//Implementação do Cadastro de Programas Previdenciários
//Fim DF 05/07 Gustavo

unit fCadPrograma;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, CMwwQuery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, Mask, wwdbedit, CmEventosCadastro,
  ImgList;

type
  TfrmCadPrograma = class(TFrmCadastroGridCS)
    qryIDPROGRAMA: TFloatField;
    qryCODPROGRAMA: TStringField;
    qryDESCPROGRAMA: TStringField;
    DebCodigo: TwwDBEdit;
    DbeDesc: TwwDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Procedure CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadPrograma: TfrmCadPrograma;

implementation

Uses uDataBase;

{$R *.DFM}

procedure TfrmCadPrograma.CmeCadastroInsert(Sender: TObject);
begin
  Inherited;
  If DebCodigo.CanFocus Then DebCodigo.SetFocus;
  qryIDPROGRAMA.AsFloat := LeultRegistro(nil,'PROGRAMA');  
end;

procedure TfrmCadPrograma.CmeCadastroEdit(Sender: TObject);
begin
  Inherited;
  If DebCodigo.CanFocus Then DebCodigo.SetFocus;
end;

Procedure TfrmCadPrograma.CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
begin
  Accept := ((DebCodigo.Text <> '') And (DbeDesc.Text <> ''));
end;

end.
