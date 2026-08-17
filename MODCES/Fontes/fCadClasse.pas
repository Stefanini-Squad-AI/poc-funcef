//******************************************************************************************
//Rotina..........: dfm (qryParamRH e qryFaixa)
//N. Sol..........: 171426
//N. Kintana......: 1537613
//Data............: 08/03/2012
//Responsável.....: Edilaine Ferraresi
//Descrição.......: Inclusão de novas faixas salariais (de 9 para 20)
//******************************************************************************************

unit fCadClasse;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCadMestreDetCS,
  IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls, TB97,
  MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, Grids, Wwdbigrd, Wwdbgrid, ComCtrls, ExtCtrls, Mask,
  TabControlDetalhe, DBCtrls, wwdbedit, Wwdbspin, wwdblook, CmEventosCadastro, ImgList;

type
  TfrmCadClasse = class(TfrmCadMestreDetalheCS)
    Label1: TLabel;
    Label10: TLabel;
    qryDet: TwwQuery;
    updDet: TUpdateSQL;
    dbedMat: TwwDBEdit;
    dbedNome: TwwDBEdit;
    sbtnFaixas: TToolbarButton97;
    ToolbarSep972: TToolbarSep97;
    qryParamRH: TwwQuery;
    Label2: TLabel;
    dbedMinimo: TDBEdit;
    Label3: TLabel;
    dbedMaximo: TDBEdit;
    Label4: TLabel;
    dblcFaixa: TwwDBLookupCombo;
    qryFaixa: TwwQuery;
    qryGrauCargo: TwwQuery;
    qryCargo: TwwQuery;
    qryClasse: TwwQuery;
    qryRelav: TwwQuery;
    dsCargo: TwwDataSource;
    updCargo: TUpdateSQL;
    procedure FormCreate(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure sbtnFaixasClick(Sender: TObject);
    procedure dsDetStateChange(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
  private
    procedure AbreQuerys (ID: string);
  end;

var
  frmCadClasse: TfrmCadClasse;

implementation

uses uMensErro, uDataBase;

{$R *.DFM}

procedure TfrmCadClasse.FormCreate(Sender: TObject);
var
  c: integer;
begin
  inherited;
  AbreQuerys ('-1');

  qryParamRH.Open;
  qryFaixa.Open;
  dblcFaixa.Selected.Clear;
  dblcFaixa.Selected.Add('IDFAIXASALARIAL' +#9+'06'+#9+ 'Código');
  dblcFaixa.Selected.Add('DATAEFETIV'      +#9+'15'+#9+ 'Data Efetivação');

  for c:=1 to qryParamRH.FieldByName('NUMSTEPS').asInteger do
    dblcFaixa.Selected.Add('STEP' +IntToStr(c)+#9+'15'+#9+
      qryParamRH.FieldByName('TITSTEP' + IntToStr(c)).asString);

  sbtnProcurarClick(Sender);
end;

procedure TfrmCadClasse.CmeCadastroFind(Sender: TObject);
begin
  if (MontaSelect.ValoresChave.Count > 0) and (MontaSelect.ValoresChave[0] <> '')  then
    AbreQuerys (MontaSelect.ValoresChave[0]);

  sbtnFaixas.Enabled := (qryDet.Active) and (qryDet.State = dsBrowse) and not(qryDet.IsEmpty);
end;

procedure TfrmCadClasse.dsDetStateChange(Sender: TObject);
begin
  inherited;
  if (Self.Visible) then
    dbedMinimo.SetFocus;
end;

procedure TfrmCadClasse.sbtnFaixasClick(Sender: TObject);
var
  bAplicarAlt: boolean;
  iTotPontos: integer;
begin
  if (MsgDlg('Confirma Atualização das Faixas?', LerMensagem(4),
      mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
  begin
    bAplicarAlt := false;
    
    qryClasse.Open;    
    qryCargo.Open;
    qryGrauCargo.Open;
    qryRelav.Open;
    while not(qryCargo.EOF) do
    begin
      // Rotina para calcular os pontos do cargo
      iTotPontos := 0;

      qryGrauCargo.First;
      while not(qryGrauCargo.EOF) do
      begin
        if (qryRelav.Locate('CODGRPFUNC;IDFATORAVAL',
            VarArrayOf([qryCargo.FieldByName('CODGRPFUNC').asString,
             qryGrauCargo.FieldByName('IDFATORAVAL').asInteger]),[])) then
          iTotPontos := iTotPontos + qryRelav.FieldByName('PESO').asInteger *
            qryGrauCargo.FieldByName('GRAU').asInteger;
        qryGrauCargo.Next;
      end;

      qryClasse.First;
      while not(qryClasse.EOF) do
      begin
        if (iTotPontos >= qryClasse.FieldByName('MINIMO').asInteger) and
           (iTotPontos <= qryClasse.FieldByName('MAXIMO').asInteger) and
           (qryCargo.FieldByName('IDFAIXASALARIAL').asInteger <>
            qryClasse.FieldByName('IDFAIXASALARIAL').asInteger) then
        begin
          qryCargo.Edit;
          qryCargo.FieldByName('IDFAIXASALARIAL').asInteger :=
            qryClasse.FieldByName('IDFAIXASALARIAL').asInteger;
          qryCargo.Post;
          bAplicarAlt := true;
          break;
        end;
        qryClasse.Next;
      end;
      qryCargo.Next;
    end;

    if (bAplicarAlt) then
    begin
      try
        AplicaAlteracoes([qryCargo]);
        MsgDlg('Atualização realizada com sucesso!','Aviso',mtInformation,[mbOk, mbHelp],0);
      except
        raise;
      end;
    end
    else
      MsgDlg('Nenhuma atualização foi feita!','Aviso',mtInformation,[mbOk, mbHelp],0);

    qryClasse.Close;
    qryCargo.Close;
    qryGrauCargo.Close;
    qryRelav.Close;
  end;
end;

procedure TfrmCadClasse.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  qryDet.FieldByName('CODGRPFUNC').asString := qry.FieldByName('CODGRPFUNC').asString;
  qryDet.FieldByName('MINIMO').asInteger    := 0;
  qryDet.FieldByName('MAXIMO').asInteger    := 0;
end;

procedure TfrmCadClasse.bbtnOkDetClick(Sender: TObject);
begin
  if (Trim(dblcFaixa.Text) = '') then
  begin
    MsgDlg('Selecione uma Faixa Salarial !','Aviso', mtInformation,[mbOk,mbHelp],0);
    dblcFaixa.SetFocus;
  end
  else
    inherited;
end;

procedure TfrmCadClasse.CmeCadastroConfirma(Sender: TObject);
begin
  try
    AplicaAlteracoes([qryDet]);
  except
    raise;
  end;
  sbtnFaixas.Enabled := (qryDet.Active) and (qryDet.State = dsBrowse) and not(qryDet.IsEmpty);  
end;

procedure TfrmCadClasse.AbreQuerys (Id: string);
begin
  if not(qry.Prepared) then
    qry.Prepare;
  if not(qryDet.Prepared) then
  qryDet.Prepare;

  qry.Close;
  qry.ParamByName('CODGRPFUNC').asString := Id;
  qry.Open;

  qryDet.Close;
  qryDet.ParamByName('CODGRPFUNC').asString := Id;
  qryDet.Open;
end;

end.
