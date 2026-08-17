unit fCadPeso;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fCadMestreDetCS,
  IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls, Mask,
  MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97, Grids, Wwdbigrd, Wwdbgrid, ComCtrls, ImgList,
  TabControlDetalhe, ExtCtrls, DBCtrls, wwdbedit, Wwdbspin, wwdblook, CmEventosCadastro;

type
  TfrmCadPeso = class(TfrmCadMestreDetalheCS)
    Label1: TLabel;
    Label10: TLabel;
    qryDet: TwwQuery;
    updDet: TUpdateSQL;
    dbedMat: TwwDBEdit;
    dbedNome: TwwDBEdit;
    qryAval: TwwQuery;
    Label2: TLabel;
    dblcFatorAval: TwwDBLookupCombo;
    Label4: TLabel;
    DBEdit2: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure dblcFatorAvalChange(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeDetalheInsert(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
  end;

var
  frmCadPeso: TfrmCadPeso;

implementation

uses uMensErro, uDataBase, UsoGeralRH;

{$R *.DFM}

procedure TfrmCadPeso.FormCreate(Sender: TObject);
begin
  inherited;
  qry.Prepare;
  qryDet.Prepare;

  qry.Close;
  qry.ParamByName('CODGRPFUNC').asString := '-1';
  qry.Open;

  qryDet.Close;
  qryDet.ParamByName('CODGRPFUNC').asString := '-1';
  qryDet.Open;

  qryAval.Open;

  sbtnProcurarClick(Sender);  
end;

procedure TfrmCadPeso.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
  //
end;

procedure TfrmCadPeso.CmeCadastroFind(Sender: TObject);
begin
  if (MontaSelect.ValoresChave.Count > 0) and (MontaSelect.ValoresChave[0] <> '')  then
  begin
    qry.Close;
    qry.ParamByName('CODGRPFUNC').asString := MontaSelect.ValoresChave[0];
    qry.Open;

    qryDet.Close;
    qryDet.ParamByName('CODGRPFUNC').asString := MontaSelect.ValoresChave[0];
    qryDet.Open;
  end;
end;

procedure TfrmCadPeso.dblcFatorAvalChange(Sender: TObject);
begin
  if (qryDet.State in [dsInsert, dsEdit]) then
    qryDet.FieldByName('DESCRFATORAVAL').asString := dblcFatorAval.Text;
end;

procedure TfrmCadPeso.bbtnOkDetClick(Sender: TObject);
begin
  if (Trim(dblcFatorAval.Text) = '') then
  begin
    MsgDlg('Selecione um Fator de Avaliação !','Aviso', mtInformation,[mbOk,mbHelp],0);
    dblcFatorAval.SetFocus;
    exit;
  end;
  inherited;
end;

procedure TfrmCadPeso.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  qryDet.FieldByName('CODGRPFUNC').asString := qry.FieldByName('CODGRPFUNC').asString;
  qryDet.FieldByName('PESO').asInteger      := 0;
end;

procedure TfrmCadPeso.CmeCadastroConfirma(Sender: TObject);
begin
  try
    AplicaAlteracoes([qryDet]);
  except
    raise;
  end;
end;

end.
