{*******************************************************************************************
  Analista Responsável: André Tavares
  Mostra um FORM que permite que seja alterado o lacal de atendimento no momento do login
  (pendência da CBS para atender a estrutura de rede com terminais BURROS)
  Período de Implementação: 10/06/2002 a 11/06/2002
  Última alteração em :  /  /
- 15/09/2003 - André Tavares - pendência 15025

********************************************************************************************}


unit fMudaLocalAtend;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, wwdblook, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  Buttons, TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, DBaseDados, UdataBase;

type
  TfrmMudaLocalAtend = class(TfrmOkCancelar)
    DblkLocalAtend: TwwDBLookupCombo;
    Label1: TLabel;
    qryLocalAtend: TwwQuery;
    qryLocalAtendIDLOCALATEND: TFloatField;
    qryLocalAtendDESCLOCALATEND: TStringField;
    qryLocalAtendXcpu: TwwQuery;
    qryLocalAtendXcpuIDLOCALATENDXCPU: TFloatField;
    qryLocalAtendXcpuIDLOCALATEND: TFloatField;
    qryDeleteCPU: TwwQuery;
    qryInsereCPU: TwwQuery;
    qryAux: TwwQuery;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure DblkLocalAtendChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    existeLocalAtendXcpu : boolean;
  public
    { Public declarations }
  end;

var
  frmMudaLocalAtend: TfrmMudaLocalAtend;

implementation
uses FPrincipal, umoduloCap;
{$R *.DFM}

procedure TfrmMudaLocalAtend.FormCreate(Sender: TObject);
begin
  inherited;
  existeLocalAtendXcpu := false;
  qryLocalAtend.Close;
  qryLocalAtend.Open;
  qryLocalAtendXcpu.close;
  qryLocalAtendXcpu.Open;

  if qryLocalAtend.Locate('IDLOCALATEND', DtmBaseDados.Qry.fieldbyName('IDLOCALATEND').asInteger, []) then
  begin
    dblkLocalAtend.LookUpValue := qryLocalAtendIDLOCALATEND.asString;
    dblkLocalAtend.Text := qryLocalAtendDESCLOCALATEND.AsString;
  end;
  qryLocalAtendXcpu.Locate('IDLOCALATEND', DtmBaseDados.Qry.fieldbyName('IDLOCALATEND').asInteger, []);
end;

procedure TfrmMudaLocalAtend.bbtnConfirmarClick(Sender: TObject);
var ValAux : LongInt;
begin
  inherited;
  ValAux := 0;
  if (DblkLocalAtend.LookUpValue <> '') then
  begin
    if not DtmBaseDados.Qry.IsEmpty then
     begin
     if  dtmBaseDados.dbBaseDados.InTransaction then
       RollbackTransacao
     else
       StartTransacao;

      qryAux.Close;
      qryAux.ParamByName('IDCPUATEND').asInteger := DtmBaseDados.Qry.fieldbyName('IDCPUATEND').asInteger;
      qryAux.ParamByName('IDLOCALATEND').asInteger := strToInt(DblkLocalAtend.LookUpValue);
      qryAux.Open;

      if qryAux.IsEmpty then
      begin
        qryInsereCPU.Close;
        valAux := LeultRegistro(nil,'LOCALATENDXCPU');
        qryInsereCPU.ParamByName('IDLOCALATENDXCPU').asInteger := valAux;
        qryInsereCPU.ParamByName('IDCPUATEND').asInteger := DtmBaseDados.Qry.fieldbyName('IDCPUATEND').asInteger;
        qryInsereCPU.ParamByName('IDLOCALATEND').asInteger := strToInt(DblkLocalAtend.LookUpValue);
        qryInsereCPU.ExecSql;
      end
      else
      begin
        valAux := qryAux.fieldByName('IDLOCALATENDXCPU').asInteger
      end;

      CommitTransacao;
    end;
  end;

  if dblkLocalAtend.lookupValue <> '' then
    ModuloCap.IdLocaAtendxCpu := valAux;
  FPrincipal.IdCpuAtend := ModuloCap.IdLocaAtendxCpu;
  FPrincipal.NomeCpuAtend := FPrincipal.sComputerName;
  bbtnSairClick(sender);
end;

procedure TfrmMudaLocalAtend.bbtnSairClick(Sender: TObject);
begin
  inherited;
  exit;
end;

procedure TfrmMudaLocalAtend.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  dblkLocalAtend.lookupValue := '';
  exit;
end;

procedure TfrmMudaLocalAtend.DblkLocalAtendChange(Sender: TObject);
begin
  inherited;
  if dblkLocalAtend.lookupValue <> '' then
      existeLocalAtendXcpu := qryLocalAtendXcpu.Locate('IDLOCALATEND', strToInt(dblkLocalAtend.lookupValue), []);
end;

procedure TfrmMudaLocalAtend.FormShow(Sender: TObject);
begin
  inherited;
  if bbtnSair.CanFocus then bbtnSair.SetFocus;
end;

end.
