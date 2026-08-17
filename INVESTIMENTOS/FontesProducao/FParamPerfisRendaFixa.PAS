//******************************************************************************
//Data	          : 29/06/2004
//Origem	  : FUNCEF
//Query 	  : qryPerfil
//Motivo(S)       : Passado o Active da qry para 'False'
//******************************************************************************

unit fParamPerfisRendaFixa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarInv, StdCtrls, wwdblook, Db, DBTables, Wwquery, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, fcLabel, ExtCtrls, FPreview;

type
  TfrmParamPerfisRendaFixa = class(TfrmOkCancelarInv)
    qryPerfil: TwwQuery;
    dblPerfil: TwwDBLookupCombo;
    qryPerfilIDCURVARENFIX: TFloatField;
    qryPerfilDESCCURVARENFIX: TStringField;
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamPerfisRendaFixa: TfrmParamPerfisRendaFixa;

implementation

uses FDmRelPerfisAtualizacao, UOperComum;

{$R *.DFM}

procedure TfrmParamPerfisRendaFixa.FormShow(Sender: TObject);
begin
  inherited;
  qryPerfil.Open;
end;

procedure TfrmParamPerfisRendaFixa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qryPerfil.Close;
  inherited;
end;

procedure TfrmParamPerfisRendaFixa.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  OperComum.LimpaParametros(DmRelPerfisAtualizacao.qryPerfisAtualizacao);
  if Trim(dblPerfil.Text) <> '' then
     DmRelPerfisAtualizacao.qryPerfisAtualizacao.ParamByName('PERFIL').AsInteger :=
                                                 qryPerfilIDCURVARENFIX.AsInteger;

  DmRelPerfisAtualizacao.qryPerfisAtualizacao.Open;
  TFrmPreview.CreateModalPreview(Application,
                                 DmRelPerfisAtualizacao.rptPerfisAtualizacao,
                                 DmRelPerfisAtualizacao.rptPerfisAtualizacao.PrinterSetup.DocumentName);
  DmRelPerfisAtualizacao.qryPerfisAtualizacao.Close;
end;

end.
