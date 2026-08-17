//********************************************************************************************************
// Data     : 23/03/2007
// Código   : AL_3
// Pendencia: 24844
// Sol      : 56250
// Função   : Exibir o Plano/Patrocinadora ao selecionar o Contrato (Alterei a Qry)
//********************************************************************************************************
// Data     : 08/03/2007
// Código   : AL_2
// Pendencia: 24676
// Sol      : 55162
// Função   : Incluir Plano/Patro no Relatório de Operações
//********************************************************************************************************
// Data     : 28/02/2007
// Código   : AL_1
// Pendencia: 24553
// Sol      : 53867
// Função   : Incluir a Coluna Observação no Relatório Operações
//********************************************************************************************************

unit FParamOpeContAcoes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarInv, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, fcLabel, ExtCtrls, Db, DBTables, Wwquery, wwdblook,
  CMDBLookupCombo, FPreview;

type
  TfrmParamOpeContAcoes = class(TfrmOkCancelarInv)
    qryContratos: TwwQuery;
    qryContratosIDOPERCONTACOES: TFloatField;
    qryContratosCONTRATO: TStringField;
    Label1: TLabel;
    dblContrato: TCMDBLookupCombo;
    chkExpandido: TCheckBox;
    qryContratosPLANPRVCONTABPATRO: TStringField;
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamOpeContAcoes: TfrmParamOpeContAcoes;

implementation

uses FDMRelContOpe, UOperComum;

{$R *.DFM}

procedure TfrmParamOpeContAcoes.FormShow(Sender: TObject);
begin
  qryContratos.Open;
  Caption := 'Relatório';
  inherited;
end;

procedure TfrmParamOpeContAcoes.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  //AL_1
  try
     Opercomum.LimpaParametros(DMRelContOpe.qry);
     Opercomum.LimpaParametros(DMRelContOpe.qrydetalhe);

     if Trim(dblContrato.Text) <> '' then
     begin
        DMRelContOpe.qry.ParamByName('IDOPERCONTACOES').AsInteger := qryContratosIDOPERCONTACOES.AsInteger;
        DMRelContOpe.qrydetalhe.ParamByName('IDOPERCONTACOES').AsInteger := qryContratosIDOPERCONTACOES.AsInteger;
        DMRelContOpe.lblContrato.Visible := True;
        DMRelContOpe.lblContrato.Caption := 'Contrato: ' + qryContratosCONTRATO.AsString;
     end
     else
        DMRelContOpe.lblContrato.Visible := False;

     DMRelContOpe.qry.Open;

     if not DMRelContOpe.qry.IsEmpty then
     begin
        DMRelContOpe.qrydetalhe.Open;
        DMRelContOpe.qry.DisableControls;
        DMRelContOpe.qrydetalhe.DisableControls;
        DMRelContOpe.srptOperacao.ExpandAll := (chkExpandido.Checked);
        TFrmPreview.CreateModalPreview(Application, DMRelContOpe.rpt, DMRelContOpe.rpt.PrinterSetup.DocumentName);
        DMRelContOpe.qry.EnableControls;
        DMRelContOpe.qrydetalhe.EnableControls;
     end;

     finally
        Opercomum.LimpaParametros(DMRelContOpe.qry);
        Opercomum.LimpaParametros(DMRelContOpe.qrydetalhe);
        bbtnSairClick(Self);

     end;
end;

end.
