{===============================================================================
Unit    :  uMemoriaCalculoHist
Form    :  frmMemoriaCalculoHist

Autor   : Rômulo Coriolano de Melo
Empresa : Fórmula Informática Ltda.

Data    : 31/08/2000

Objetivo: Consultar Memória de Cálculo da Base de Histórico.

Propriedades Publicadas:
Métodos Publicos:
Manutenção:

   Data       Responsável      Descrição
----------    -----------      -------------------------------------------------

================================================================================}
unit uMemoriaCalculoHist;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, DBCtrls, Grids, Wwdbigrd, Wwdbgrid, Db,
  Wwdatsrc, DBTables, Wwquery;

type
  TfrmMemoriaCalculoHist = class(TfrmOkCancelar)
    ds: TwwDataSource;
    dbGrd: TwwDBGrid;
    qryPrincipal: TwwQuery;
    qryPrincipalCD_PESSOA_ENTID: TFloatField;
    qryPrincipalCD_PESSOA_PATROC: TFloatField;
    qryPrincipalCD_PLANO: TFloatField;
    qryPrincipalDT_GERACAO: TDateTimeField;
    qryPrincipalDS_HIPOTESE: TStringField;
    qryAux: TwwQuery;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    Versao: Integer;
  end;

var
  frmMemoriaCalculoHist: TfrmMemoriaCalculoHist;

implementation

uses uGlobal, FTelaAut, uVersaoBase, uProcura;

{$R *.DFM}

procedure TfrmMemoriaCalculoHist.bbtnConfirmarClick(Sender: TObject);
begin
  if qryPrincipal.isEmpty then
    exit;

  frmProcura := TfrmProcura.create(application);
  frmProcura.DataSet := qryAux;
  frmProcura.Form := 'MemoriaCalculoHist';
  frmProcura.CD_VERSAO := IntToStr(Versao);
  frmProcura.DT_GERACAO := DateTimeToStr(qryPrincipal.FieldByName('DT_GERACAO').asDateTime);

  frmProcura.ShowModal;

  frmProcura.free;
  inherited;
end;

procedure TfrmMemoriaCalculoHist.bbtnCancelarClick(Sender: TObject);
begin
  close;
end;

procedure TfrmMemoriaCalculoHist.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qryPrincipal.Close;
  inherited;
end;

end.
