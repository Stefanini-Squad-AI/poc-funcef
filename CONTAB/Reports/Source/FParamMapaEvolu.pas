{------------------------------------------------------------------------------
  Desenvolvedor : Marcus Oliveira
  Data          : 23/05/2007
  Pendência     : 25323
  Descrição     : Criado dois botões para Marcar todos e Inverter Marcação para
                  Plano e patro.
------------------------------------------------------------------------------}
{ Desenvolvedor: Marcus Oliveira
  Data         : 23/03/2007
  Pendência    : 15355 - alterado o codcentrocusto para codexterno.
------------------------------------------------------------------------------
//Atualizado: Marcus Oliveira P. 21041 08/09/2006
------------------------------------------------------------------------------
// Atualizado:  André Tavares - pendência 14917 - 29/10/2003
------------------------------------------------------------------------------}

unit FParamMapaEvolu;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uCtrlContab, fParamReports_Padrao, Db, DBClient, uCMClientDataSet,
  uCmSqlParams, MontaSelect, Mask, Spin, StdCtrls, wwdblook, CmParamReport,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls,
  Grids, Wwdbigrd, Wwdbgrid, Wwdatsrc, CMDBLookupCombo, CMProcuraMask;

type
  TfrmParamMapaEvolu = class(TfrmParamReports_Padrao)
    grpDatas: TGroupBox;
    Label3: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    dblkExercicio: TwwDBLookupCombo;
    dblkPeriodoIni: TwwDBLookupCombo;
    Panel1: TPanel;
    chkGrau: TCheckBox;
    spnGrau: TSpinEdit;
    chkZerados: TCheckBox;
    Panel4: TPanel;
    Label5: TLabel;
    Label7: TLabel;
    mskCCustoIni: TMaskEdit;
    btnCCustoIni: TBitBtn;
    mskAtivProj: TMaskEdit;
    btnAtivProj: TBitBtn;
    Panel2: TPanel;
    lblMoeda: TLabel;
    dblcMoeda: TwwDBLookupCombo;
    MontaSelectAtivProj: TMontaSelect;
    MontaSelectCCusto: TMontaSelect;
    sqlPeriodoIni: TCMSqlParams;
    sqlExercicio: TCMSqlParams;
    sqlPeriodoFim: TCMSqlParams;
    cdsPeriodoIni: TCMClientDataSet;
    cdsPeriodoFim: TCMClientDataSet;
    cdsExercicio: TCMClientDataSet;
    sqlAtivProj: TCMSqlParams;
    cdsAtivProj: TCMClientDataSet;
    cdsCCusto: TCMClientDataSet;
    sqlCCusto: TCMSqlParams;
    sqlMoeda: TCMSqlParams;
    cdsMoeda: TCMClientDataSet;
    Panel3: TPanel;
    cdsPlanoPrev: TCMClientDataSet;
    sqlPlanoPrev: TCMSqlParams;
    cdsPatrocinadora: TCMClientDataSet;
    sqlPatrocinadora: TCMSqlParams;
    dbgrPlanoPrev: TwwDBGrid;
    dbgrPatro: TwwDBGrid;
    dsPlanoPrev: TwwDataSource;
    dsPatrocinadora: TwwDataSource;
    dblkPeriodoFim: TwwDBLookupCombo;
    cmpContaFim: TCMProcuraMaskContabil;
    cmpContaIni: TCMProcuraMaskContabil;
    sqlIdPlanCentCust: TCMSqlParams;
    cdsIdPlanCentCust: TCMClientDataSet;
    Panel5: TPanel;
    Splitter3: TSplitter;
    Bevel1: TBevel;
    Panel6: TPanel;
    spdInverterPlano: TSpeedButton;
    spdTodosPlano: TSpeedButton;
    Panel7: TPanel;
    spdTodosPatro: TSpeedButton;
    spdInvertePatro: TSpeedButton;
    procedure chkGrauClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure mskCCustoIniExit(Sender: TObject);
    procedure btnCCustoIniClick(Sender: TObject);
    procedure mskAtivProjExit(Sender: TObject);
    procedure btnAtivProjClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dblkExercicioExit(Sender: TObject);
    procedure dblkPeriodoIniExit(Sender: TObject);
    procedure dblkPeriodoFimChange(Sender: TObject);
    procedure spdTodosPlanoClick(Sender: TObject);
    procedure spdInverterPlanoClick(Sender: TObject);
    procedure spdTodosPatroClick(Sender: TObject);
    procedure spdInvertePatroClick(Sender: TObject);
  private
    CtrlContab  : TCtrlContab;
    sUnidNegoc :string;
  public
    { Public declarations }
  end;

var
  frmParamMapaEvolu: TfrmParamMapaEvolu;

implementation

uses UMensErro, uDatabase, DBaseDados, uSistema, uData,uModulo;

{$R *.DFM}

procedure TfrmParamMapaEvolu.chkGrauClick(Sender: TObject);
begin
  inherited;
  if chkGrau.Checked then
     spnGrau.Enabled := True
  else
     spnGrau.Enabled := False;

end;

procedure TfrmParamMapaEvolu.FormShow(Sender: TObject);
begin
  inherited;
   //Preenche as combo-boxes
   with sqlExercicio do begin
      Prepare;
      ParamByName('IDPESSOA').asInteger := Sistema.idEmpresa;
      Open;
   end;
   with sqlPeriodoIni do begin
      Prepare;
      ParamByName('IDPESSOA').asInteger := Sistema.idEmpresa;
      ParamByName('PEREXERCICIO').asInteger := Year(Date);
      Open;
   end;
   with sqlPeriodoFim do begin
      Prepare;
      ParamByName('IDPESSOA').asInteger := Sistema.idEmpresa;
   cmpContaIni.Plano     := CtrlContab.PlanoParam;
   cmpContaIni.Mascara   := CtrlContab.MascaraContaParam;
   cmpContaFim.Plano     := CtrlContab.PlanoParam;
   cmpContaFim.Mascara   := CtrlContab.MascaraContaParam;


      Open;
   end;

   mskCCustoIni.editMask := modulo.sMascaraCCusto + ';0; ';
   mskAtivProj.editMask  := modulo.sMascaraUnidNegoc + ';0; ';

   sqlMoeda.Open;

   spnGrau.MaxValue := FuncaoGeral.CalcGrauMax(CtrlContab.MascaraContaParam);
   spnGrau.Value    := FuncaoGeral.CalcGrauMax(CtrlContab.MascaraContaParam);
   spnGrau.MinValue := 1;

   sqlPlanoPrev.Open;
   sqlPatrocinadora.Open;

end;

procedure TfrmParamMapaEvolu.FormCreate(Sender: TObject);
begin
  inherited;
   CtrlContab := TCtrlContab.Create;
   CtrlContab.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                  Sistema.AppRemoteServer,True,nil,nil,False);

   If Not CtrlContab.SelecionaParametros(Sistema.IdEmpresa) Then
      MsgDlg(CtrlContab.MessageInfo,'Erro',MtError,[mbOk],0);

   MontaSelectCCusto.Filtro.Add('CENTCUST.IDEMPRESA = ' + IntToStr(sistema.idEmpresa));
   MontaSelectAtivProj.Filtro.Add('UNIDNEGOCIO.IDPESSOA = ' + IntToStr(sistema.idEmpresa));

end;

procedure TfrmParamMapaEvolu.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlContab.free;
end;

procedure TfrmParamMapaEvolu.mskCCustoIniExit(Sender: TObject);
var sCCusto : string;
begin
  inherited;
   if mskCCustoIni.text <> '' then begin
      sCCusto := mskCCustoIni.text;
      with sqlCCusto do begin
         Prepare;
         ParamByName('IDEMPRESA').asFloat := sistema.idEmpresa;
         ParamByName('CODCENTROCUSTO').asString   := sCCusto;
         Open;
         if not cdsCCusto.isEmpty then begin
            mskCCustoIni.text := cdsCCusto.FieldByName('CODEXTERNO').asString;
         end else begin
            MsgDlg('O código do centro de custo informado não existe.','Aviso',mtWarning,[mbOk],0);
            mskCCustoIni.SetFocus;
         end;
      end;
   end;

end;

procedure TfrmParamMapaEvolu.btnCCustoIniClick(Sender: TObject);
var sCCusto : string;
begin
  inherited;
   MontaSelectCCusto.Executar;
   Repaint;

   if MontaSelectCCusto.RetornouValor then begin
      sCCusto := MontaSelectCCusto.ValoresChave[2];
      with sqlCCusto do begin
         Prepare;
         ParamByName('IDEMPRESA').asFloat := sistema.idEmpresa;
         ParamByName('CODCENTROCUSTO').asString   := sCCusto;
         Open;
         mskCCustoIni.text   := cdsCCusto.FieldByName('CODEXTERNO').asString;
      end;
   end;

end;

procedure TfrmParamMapaEvolu.mskAtivProjExit(Sender: TObject);
var sAtivProj : string;
begin
  inherited;
   if mskAtivProj.text <> '' then begin
      sAtivProj := mskAtivProj.text;
      with sqlAtivProj do begin
         Prepare;
         ParamByName('IDPESSOA').asFloat   := sistema.idEmpresa;
         ParamByName('UNIDNEGOC').asFloat  := StrToFloat(sAtivProj);
         Open;
         if not cdsAtivProj.isEmpty then begin
            mskAtivProj.text := cdsAtivProj.FieldByName('UNECODIGO').asString;
            sUnidNegoc := IntToStr(cdsAtivProj.FieldByName('UNIDNEGOC').asInteger);
         end else begin
            MsgDlg('O código da atividade/projeto informado não existe.','Aviso',mtWarning,[mbOk],0);
            mskAtivProj.SetFocus;
         end;
      end;
   end;

end;

procedure TfrmParamMapaEvolu.btnAtivProjClick(Sender: TObject);
var
 sAtivProj: string;
begin
   inherited;

   MontaSelectAtivProj.Executar;
   Repaint;
   if MontaSelectAtivProj.RetornouValor then begin
      sAtivProj := MontaSelectAtivProj.ValoresChave[0];
      with sqlAtivProj do begin
         Prepare;
         ParamByName('IDPESSOA').asFloat  := sistema.idEmpresa;
         ParamByName('UNIDNEGOC').asFloat := StrToFloat(sAtivProj);
         Open;
         mskAtivProj.text     := cdsAtivProj.FieldByName('UNECODIGO').asString;
         sUnidNegoc  := IntToStr(cdsAtivProj.FieldByName('UNIDNEGOC').asInteger);

      end;
   end;

end;

procedure TfrmParamMapaEvolu.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
   if dblkExercicio.text = '' then begin
      MsgDlg('O Exercício deve ser preenchido.','Erro',mtError,[mbOk],0);
      modalResult := mrNone;
      Exit;
   end;

   if dblkPeriodoIni.text = '' then begin
      MsgDlg('O Período Inicial deve ser preenchido.','Erro',mtError,[mbOk],0);
      modalResult := mrNone;
      Exit;
   end;

   if dblkPeriodoFim.text = '' then begin
      MsgDlg('O Período Final deve ser preenchido.','Erro',mtError,[mbOk],0);
      modalResult := mrNone;
      Exit;
   end;

   If mskAtivProj.text = '' then
      sUnidNegoc := '';

  //*** passa os paramentos para o componente padrao ***
  Cmp_Padrao.ParamValues[0].AsInteger  := StrToInt(dblkExercicio.LookupValue);
  Cmp_Padrao.ParamValues[1].AsInteger  := StrToInt(dblkPeriodoIni.LookupValue);
  Cmp_Padrao.ParamValues[2].AsInteger  := cdsPeriodoFim.FieldByname('PERNUMERO').AsInteger;

  Cmp_Padrao.ParamValues[3].AsString   := Trim(mskCCustoIni.text);
  Cmp_Padrao.ParamValues[4].AsString   := sUnidNegoc;
  Cmp_Padrao.ParamValues[5].AsString   := dblcMoeda.LookupValue;
  Cmp_Padrao.ParamValues[6].AsInteger  := StrToInt(spnGrau.Text);
  Cmp_Padrao.ParamValues[7].AsBoolean  := chkZerados.Checked;

  Cmp_Padrao.ParamValues[8].AsString := '';
  Cmp_Padrao.ParamValues[11].AsString := '';
  Cmp_Padrao.ParamValues[12].AsInteger := cdsPeriodoFim.FieldByName('PEREXERCICIO').AsInteger;
  //Adicionando conta inicial e final
  Cmp_Padrao.ParamValues[13].AsString := cmpContaIni.Conta.Numero;
  Cmp_Padrao.ParamValues[14].AsString := cmpContaFim.Conta.Numero;
  cdsPlanoPrev.First;
  cdsPlanoPrev.DisableControls;
  while not cdsPlanoPrev.Eof do
  begin
    if trim(cdsPlanoPrev.FieldByName('MARCA').asString) = 'S' then
    begin
      Cmp_Padrao.ParamValues[8].AsString  := Cmp_Padrao.ParamValues[8].AsString +
                                             cdsPlanoPrev.FieldByName('IDPLANOPREV').asString + ',';
      Cmp_Padrao.ParamValues[10].AsString := Cmp_Padrao.ParamValues[10].AsString +
                                             cdsPlanoPrev.FieldByName('NOME').asString + ', ';
    end;
    cdsPlanoPrev.Next;
  end;
  cdsPlanoPrev.EnableControls;
  Cmp_Padrao.ParamValues[8].AsString := copy(Cmp_Padrao.ParamValues[8].AsString, 1, length(Cmp_Padrao.ParamValues[8].AsString)-1);
  Cmp_Padrao.ParamValues[10].AsString := copy(Cmp_Padrao.ParamValues[10].AsString, 1, length(Cmp_Padrao.ParamValues[10].AsString)-2);

  Cmp_Padrao.ParamValues[9].AsString := '';
  Cmp_Padrao.ParamValues[11].AsString := '';
  cdsPatrocinadora.First;
  cdsPatrocinadora.DisableControls;
  while not cdsPatrocinadora.Eof do
  begin
    if trim(cdsPatrocinadora.FieldByName('MARCA').asString) = 'S' then
    begin
      Cmp_Padrao.ParamValues[9].AsString  := Cmp_Padrao.ParamValues[9].AsString +
                                             cdsPatrocinadora.FieldByName('IDPESSOA').asString + ',';
      Cmp_Padrao.ParamValues[11].AsString := Cmp_Padrao.ParamValues[11].AsString +
                                             cdsPatrocinadora.FieldByName('NOME').asString + ', ';
    end;
    cdsPatrocinadora.Next;
  end;
  cdsPatrocinadora.EnableControls;
  Cmp_Padrao.ParamValues[9].AsString := copy(Cmp_Padrao.ParamValues[9].AsString, 1, length(Cmp_Padrao.ParamValues[9].AsString)-1);
  Cmp_Padrao.ParamValues[11].AsString := copy(Cmp_Padrao.ParamValues[11].AsString, 1, length(Cmp_Padrao.ParamValues[11].AsString)-2);



end;

procedure TfrmParamMapaEvolu.dblkExercicioExit(Sender: TObject);
begin
  inherited;
   if dblkExercicio.text <> '' then begin
      with sqlPeriodoIni do begin
         Prepare;
         ParamByName('IDPESSOA').asInteger     := Sistema.idEmpresa;
         ParamByName('PEREXERCICIO').asInteger := StrToInt(dblkExercicio.Text);
         Open;
      end;
   end;

end;

procedure TfrmParamMapaEvolu.dblkPeriodoIniExit(Sender: TObject);
Var
AnoSeguinte: integer;
begin
  inherited;
  //Quando escolher o periodo inicial carrega o periodo final com o mes do
  AnoSeguinte:=StrToInt(dblkExercicio.Text);
  AnoSeguinte:=AnoSeguinte+1;
    with sqlPeriodoFim do begin
      Prepare;
      ParamByName('MESINI').AsInteger := StrToInt(dblkPeriodoIni.lookupValue);
      ParamByName('ANO').AsInteger := StrToInt(dblkExercicio.Text);
      ParamByName('ANOSEGUINTE').AsInteger:= AnoSeguinte;

      Open;
    end;
end;

procedure TfrmParamMapaEvolu.dblkPeriodoFimChange(Sender: TObject);
begin
  inherited;
  //Trazer o IDPlanCentCusto pelo periodo passado.
  sqlIdPlanCentCust.Prepare;
  sqlIdPlanCentCust.ParamByName('DATA').AsString :=  (dblkPeriodoIni.LookupValue + '/' + dblkExercicio.Text ) ;
  sqlIdPlanCentCust.open;
  MontaSelectCCusto.Filtro.add('IDPLANCENTCUST = '+ IntToStr(cdsIdPlanCentCust.fieldbyname('IDPLANCENTCUST').AsInteger));
  mskCCustoIni.Text := '';

end;

procedure TfrmParamMapaEvolu.spdTodosPlanoClick(Sender: TObject);
begin
  inherited;
  cdsPlanoPrev.First;
  while not cdsPlanoPrev.Eof do
  begin
    with cdsPlanoPrev do
      begin
        DisableControls;
        edit;
        FieldByName('MARCA').AsString := 'S';
        post;
        Next;
      end;
    cdsPlanoPrev.EnableControls;

  end;

end;

procedure TfrmParamMapaEvolu.spdInverterPlanoClick(Sender: TObject);
begin
  inherited;
  cdsPlanoPrev.First;
  while not cdsPlanoPrev.eof do
  begin
    with cdsPlanoPrev do
    begin
      DisableControls;
      edit;

      if FieldByName('MARCA').AsString = 'S' then
         FieldByName('MARCA').AsString := 'N'
      else
         FieldByName('MARCA').AsString := 'S';

      Post;
      Next;
    end;
    cdsPlanoPrev.EnableControls;
  end;

end;

procedure TfrmParamMapaEvolu.spdTodosPatroClick(Sender: TObject);
begin
  inherited;
  cdsPatrocinadora.First;
  while not cdsPatrocinadora.Eof do
  begin
    with cdsPatrocinadora do
      begin
        DisableControls;
        edit;
        FieldByName('MARCA').AsString := 'S';
        post;
        Next;
      end;
    cdsPatrocinadora.EnableControls;
  end;
end;

procedure TfrmParamMapaEvolu.spdInvertePatroClick(Sender: TObject);
begin
  inherited;
  cdsPatrocinadora.First;
  while not cdsPatrocinadora.eof do
  begin
    with cdsPatrocinadora do
    begin
      DisableControls;
      edit;

      if FieldByName('MARCA').AsString = 'S' then
         FieldByName('MARCA').AsString := 'N'
      else
         FieldByName('MARCA').AsString := 'S';

      Post;
      Next;
    end;
    cdsPatrocinadora.EnableControls;
  end;
end;

end.
