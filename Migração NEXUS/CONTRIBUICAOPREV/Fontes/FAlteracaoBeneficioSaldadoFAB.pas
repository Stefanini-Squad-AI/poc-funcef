//***************************************************************************************
//***********************-----HISTÓRICO DE ALTERAÇÕES-----*******************************
//***************************************************************************************

//***************************************************************************************
//Nº SIG:            27626.32406
//Data da Alteração: 28/07/2015
//Alteração Form:    utilização da PCK_BENEFSALDFAB.SP_ATUALIZASALDO
//Responsável:       William Santana/ Andre Imakawa
//Descrição:         Ajustes para chamada package pck.BenefSaldFab
//***************************************************************************************
//Nº SOL...........: 253577/18089
//Nº PPM...........: 1263812
//Data da Alteração: 28/01/2016
//Alteração Form...: (dfm) upd modifysql
//Responsável......: Edilaine Ferraresi
//Descrição........: o valor do benefício INSS não está sendo atualizado na carga inicial
//***************************************************************************************
//Nº SOL...........: 253577/18054
//Nº PPM...........: 1238438
//Data da Alteração: 14/01/2016
//Alteração Form...: bbtnConfirmarClick
//Responsável......: William Santana
//Descrição........: Ajuste na interface de Informações do Participante do Beneficio Saldado e FAB
//***************************************************************************************
//Nº SOL:            253577-17564
//Nº PPM             987196
//Data da Alteração: 28/07/2015
//Alteração Form:    (.dfm)
//Responsável:       Edilaine Ferraresi
//Descrição:         Ajustes para Equacionamento do Deficit
//***************************************************************************************
//Nº SOL:            145044
//Nº KINTANA         966308
//Data da Alteração: 12/05/2014
//Alteração Form:    Criação do form
//Responsável:       Tadeu Passos/ Douglas Siqueira / Higor Nayde / William Santana
//Descrição:         Benefício Saldado e FAB
//**************************************************************************************

unit FAlteracaoBeneficioSaldadoFAB;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,  UMensErro,
  TB97Tlbr, TB97, ExtCtrls, DBTables, Db, Wwquery, Mask, DBCtrls, dBaseDados, uSistema,
  TREdit, MskEdDlg, Math;     // edilaine - SOL 253577-17564 / PPM 987196

type
  TfrmAlteracaoBeneficioSaldadoFAB = class(TfrmOkCancelar)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    GroupBox2: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    GroupBox3: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    GroupBox4: TGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    GroupBox5: TGroupBox;
    Label18: TLabel;
    Label19: TLabel;
    Label21: TLabel;
    qryCargaBen: TwwQuery;
    dsCargaBen: TDataSource;
    upd: TUpdateSQL;
    dbtNomeCargo: TDBEdit;
    dbtCargoComiCod: TDBEdit;
    dbtCargoComiNome: TDBEdit;
    qryHistorico: TwwQuery;
    updHistorico: TUpdateSQL;
    qryHistoricoIDHSTALTBENEFSALDFAB: TFloatField;
    qryHistoricoIDPESSOA: TFloatField;
    qryHistoricoIDTITULAR: TFloatField;
    qryHistoricoTIPO: TStringField;
    qryHistoricoCAMPO: TStringField;
    qryHistoricoVALORANTERIOR: TStringField;
    qryHistoricoVALORALTERADO: TStringField;
    qryHistoricoMESREFERENCIA: TStringField;
    dbredSalario: TDBRealEdit;
    dbredBeneficioINSS: TDBRealEdit;
    dbredPBE: TDBRealEdit;
    dbredValorCargo: TDBRealEdit;
    dbredVALORAts: TDBRealEdit;
    dbredPercAts: TDBRealEdit;
    dbredVALORCARGOCOMIS: TDBRealEdit;
    dbredSenAdicTenp: TDBRealEdit;
    dbredTempServ: TDBRealEdit;
    dbredSalFunc: TDBRealEdit;
    dbredExBNH: TDBRealEdit;
    dbredIncorpJud: TDBRealEdit;
    dbredCOmpPerdFunc: TDBRealEdit;
    dbredIncorp: TDBRealEdit;
    dbredNotur: TDBRealEdit;
    dbredInsalubr: TDBRealEdit;
    dbredPericulosidade: TDBRealEdit;
    lblcsp: TLabel;
    dbredCSP: TDBRealEdit;
    qryUpdBenef: TwwQuery;
    lblBS: TLabel;
    dbredBeneficioSaldado: TcmMaskEditDlg;
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure AtualizaBSFAB;
    procedure AtualizaLabels;
    function Exec_SP_Atualiza_Benef_Sald_FAB(AtualizarTudo : Integer; AtualizarAte: TDateTime) : Boolean;
    procedure dbredBeneficioSaldadoBtnClick(Sender: TObject);
  private
    { Private declarations }
    // edilaine - SOL 253577-17564 / PPM 987196 - inicio
    bCalculaBS  : boolean;
    cSalPart    : currency;
    cBenefINSS  : currency;
    // edilaine - SOL 253577-17564 / PPM 987196 - fim

  public

  end;

var
  frmAlteracaoBeneficioSaldadoFAB: TfrmAlteracaoBeneficioSaldadoFAB;

implementation

uses FBeneficioSaldadoFAB,  FProgresso;

{$R *.DFM}

procedure TfrmAlteracaoBeneficioSaldadoFAB.FormShow(Sender: TObject);
begin
  inherited;
  frmBeneficioSaldadoFAB.WindowState := wsMaximized;
  WindowState := wsNormal;
  qryCargaBen.ParamByName('IDPESSOA').AsInteger := StrToInt(frmBeneficioSaldadoFAB.MontaSelectPart.ValoresChave[0]);
  qryCargaBen.ParamByName('IDTITULAR').AsInteger := StrToInt(frmBeneficioSaldadoFAB.MontaSelectPart.ValoresChave[0]);
  qryCargaBen.Open;

  // edilaine - SOL 253577-17564 / PPM 987196 - inicio
  bCalculaBS := true;
  cSalPart   := qryCargaBen.FieldByName('SALPART').AsCurrency;
  cBenefINSS := qryCargaBen.FieldByName('BINSS').AsCurrency;
  // edilaine - SOL 253577-17564 / PPM 987196 - fim


  if not(qryCargaBen.State in [dsEdit]) then qryCargaBen.Edit;

  dbredBeneficioSaldado.OnBtnClick(self);//Andre Imakawa - SIG 27626.32406
end;

procedure TfrmAlteracaoBeneficioSaldadoFAB.bbtnConfirmarClick(Sender: TObject);
var
  i : Integer;
  bReprocessa : Boolean;
begin
  Try

     // edilaine - SOL 253577-17564 / PPM 987196 - inicio
     if dbredBeneficioSaldado.text = '' then dbredBeneficioSaldado.text := '0';

     {if (StrToFloat(dbredBeneficioSaldado.text) <= 0) then
     begin
        MsgDlg('É necessário recalcular o Benefício Saldado.','Atenção',mtInformation,[mbOk],0);
        //qryCargaBen.CancelUpdates;   // edilaine - SOL 253577-17564 / PPM 987196 - comentado
        abort;
    end; }

    {RN027 - se o valor do Benefício INSS e/ou Salário de Participação forem alterados e o valor do BS não tenha sido recalculado
             através da seleção da calculadora o sistema apresenta crítica}
    if (qryCargaBen.FieldByName('SALPART').AsCurrency <> cSalPart) or
        (qryCargaBen.FieldByName('BINSS').AsCurrency <> cBenefINSS) or
        (StrToFloat(dbredBeneficioSaldado.text) <= 0) {and (bCalculaBS)} then
    begin
      MsgDlg('É necessário recalcular o Benefício Saldado.','Atenção',mtInformation,[mbOk],0);
      abort;
    end;
    // edilaine - SOL 253577-17564 / PPM 987196 - fim


    bReprocessa := false;

    if not dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.StartTransaction;

      qryCargaBen.ApplyUpdates;

      // Granvando Histórico
      qryHistorico.Open;
      for i := 0 to qryCargaBen.Fields.Count - 1 do
        begin
          if Trim(VarToStr(qryCargaBen.Fields[i].OldValue)) <> Trim(VarToStr(qryCargaBen.Fields[i].NewValue)) then
            begin
              qryHistorico.Insert;
              qryHistoricoIDPESSOA.AsInteger  := qryCargaBen.FieldByName('IDPESSOA').AsInteger;       // edilaine - SOL 253577-17564 / PPM 987196
              qryHistoricoIDTITULAR.AsInteger := qryCargaBen.FieldByName('IDTITULAR').AsInteger;      // edilaine - SOL 253577-17564 / PPM 987196
              qryHistoricoTIPO.AsString  := 'A'; // "A" de Alteração
              qryHistoricoCAMPO.AsString := qryCargaBen.Fields[i].DisplayName;
              qryHistoricoVALORANTERIOR.AsString := Trim(VarToStr(qryCargaBen.Fields[i].OldValue));
              qryHistoricoVALORALTERADO.AsString := Trim(VarToStr(qryCargaBen.Fields[i].NewValue));
              //qryHistoricoMESREFERENCIA.AsString := FormatDateTime('mm/yyyy',Date);         // edilaine - SOL 253577-17564 / PPM 987196 - comentado
              qryHistoricoMESREFERENCIA.AsString := FormatDateTime('yyyy/mm',Date);           // edilaine - SOL 253577-17564 / PPM 987196

              qryHistorico.Post;

              bReprocessa := true;
            end;
        end;



     if bReprocessa then
     begin
      qryUpdBenef.Close;
      // edilaine - SOL 253577-17564 / PPM 987196 - inicio
      //qryUpdBenef.ParamByName('BENEFSALDADO').AsFloat     := qryCargaBen.FieldByName('BENEFICIOSALDADO').AsInteger;
      qryUpdBenef.ParamByName('BENEFSALDADO').AsFloat     := StrToFloat(dbredBeneficioSaldado.Text);
      qryUpdBenef.ParamByName('IDCARGAARQUIVO').AsInteger := qryCargaBen.FieldByName('IDCARGAARQUIVO').AsInteger;
      qryUpdBenef.ParamByName('IDPESSOA').AsInteger       := qryCargaBen.FieldByName('IDPESSOA').AsInteger;
      qryUpdBenef.ParamByName('IDTITULAR').AsInteger      := qryCargaBen.FieldByName('IDTITULAR').AsInteger;
      // edilaine - SOL 253577-17564 / PPM 987196 - fim
      qryUpdBenef.ExecSQL;
     end;

      qryHistorico.ApplyUpdates;
     //implementar atualização no benefsaldfab, campo benefsaldado
    if dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.Commit;
  except
    if dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.Rollback;
  end;

  if bReprocessa then
  begin
    if MsgDlg('Deseja executar a atualização do BS-FAB ?','Informação',mtInformation,[mbYes,mbNo],0) = mrYes then
    begin    // edilaine - SOL 253577-17564 / PPM 987196 - inicio
       AtualizaBSFAB;
    //Início - William Santana - SOL 253577.18054 PPM 1238438
    end;
       AtualizaLabels;
       //frmBeneficioSaldadoFAB.AbreQueries(StrToInt(frmBeneficioSaldadoFAB.MontaSelectPart.ValoresChave[0]),StrToInt(frmBeneficioSaldadoFAB.MontaSelectPart.ValoresChave[32]),StrToInt(frmBeneficioSaldadoFAB.MontaSelectPart.ValoresChave[31])); //William Santana - SIG 27626.32406
       frmBeneficioSaldadoFAB.AbreQueries(frmBeneficioSaldadoFAB.iIdPessoa,frmBeneficioSaldadoFAB.iIdTitular);   //William Santana - SIG 27626.32406
       Close;
   // end
   // else
   // begin
   //    AtualizaLabels;
    //   Close;
   // end;
   //Término - William Santana - SOL 253577.18054 PPM 1238438
  end;



  //Close;    // edilaine - SOL 253577-17564 / PPM 987196- fim
end;

procedure TfrmAlteracaoBeneficioSaldadoFAB.bbtnCancelarClick(
  Sender: TObject);
begin
  inherited;
  qryCargaBen.CancelUpdates;
end;

procedure TfrmAlteracaoBeneficioSaldadoFAB.AtualizaBSFAB;
begin

  try
   if not dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.StartTransaction;
    //Início - William Santana - SIG 27626.32406
    //frmBeneficioSaldadoFAB.qryDesfazer.close;
//    frmBeneficioSaldadoFAB.qryDesfazer.ParamByName('IDPESSOA').AsInteger := StrToInt(frmBeneficioSaldadoFAB.MontaSelectPart.ValoresChave[0]);
//    frmBeneficioSaldadoFAB.qryDesfazer.ParamByName('IDTITULAR').AsInteger := StrToInt(frmBeneficioSaldadoFAB.MontaSelectPart.ValoresChave[0]);
//    frmBeneficioSaldadoFAB.qryDesfazer.Open;
//
//    frmBeneficioSaldadoFAB.qryDesfazerBenef.close;
//    frmBeneficioSaldadoFAB.qryDesfazerBenef.ParamByName('IDPESSOA').AsInteger := StrToInt(frmBeneficioSaldadoFAB.MontaSelectPart.ValoresChave[0]);
//    frmBeneficioSaldadoFAB.qryDesfazerBenef.ParamByName('IDTITULAR').AsInteger := StrToInt(frmBeneficioSaldadoFAB.MontaSelectPart.ValoresChave[0]);
//    frmBeneficioSaldadoFAB.qryDesfazerBenef.ExecSQl;
//
//    frmBeneficioSaldadoFAB.qryDesfazerCarga.close;
//    frmBeneficioSaldadoFAB.qryDesfazerCarga.ParamByName('IDPESSOA').AsInteger := StrToInt(frmBeneficioSaldadoFAB.MontaSelectPart.ValoresChave[0]);
//    frmBeneficioSaldadoFAB.qryDesfazerCarga.ParamByName('IDTITULAR').AsInteger := StrToInt(frmBeneficioSaldadoFAB.MontaSelectPart.ValoresChave[0]);
//    frmBeneficioSaldadoFAB.qryDesfazerCarga.ExecSQl;

    frmBeneficioSaldadoFAB.qryDesfazer.close;
    frmBeneficioSaldadoFAB.qryDesfazer.ParamByName('IDPESSOA').AsInteger := frmBeneficioSaldadoFAB.iIdPessoa;//William Santana - SIG 27626.32406
    frmBeneficioSaldadoFAB.qryDesfazer.ParamByName('IDTITULAR').AsInteger := frmBeneficioSaldadoFAB.iIdTitular;//William Santana - SIG 27626.32406
    frmBeneficioSaldadoFAB.qryDesfazer.Open;

    frmBeneficioSaldadoFAB.qryDesfazerBenef.close;
    frmBeneficioSaldadoFAB.qryDesfazerBenef.ParamByName('IDPESSOA').AsInteger := frmBeneficioSaldadoFAB.iIdPessoa;//William Santana - SIG 27626.32406
    frmBeneficioSaldadoFAB.qryDesfazerBenef.ParamByName('IDTITULAR').AsInteger := frmBeneficioSaldadoFAB.iIdTitular;//William Santana - SIG 27626.32406
    frmBeneficioSaldadoFAB.qryDesfazerBenef.ExecSQl;

    frmBeneficioSaldadoFAB.qryDesfazerCarga.close;
    frmBeneficioSaldadoFAB.qryDesfazerCarga.ParamByName('IDPESSOA').AsInteger := frmBeneficioSaldadoFAB.iIdPessoa;//William Santana - SIG 27626.32406
    frmBeneficioSaldadoFAB.qryDesfazerCarga.ParamByName('IDTITULAR').AsInteger := frmBeneficioSaldadoFAB.iIdTitular;//William Santana - SIG 27626.32406
    frmBeneficioSaldadoFAB.qryDesfazerCarga.ExecSQl;
    //Término - William Santana - SIG SIG 27626.32406

    frmBeneficioSaldadoFAB.qryAux.Close;
    frmBeneficioSaldadoFAB.qryAux.SQL.Clear;
    frmBeneficioSaldadoFAB.qryAux.SQL.Add('DELETE FROM BENEFSALD_TEMP');
    frmBeneficioSaldadoFAB.qryAux.ExecSQL;

    frmBeneficioSaldadoFAB.qryAux.Close;
    frmBeneficioSaldadoFAB.qryAux.SQL.Clear;
    //frmBeneficioSaldadoFAB.qryAux.SQL.Add('INSERT INTO BENEFSALD_TEMP VALUES ('+quotedstr(frmBeneficioSaldadoFAB.lblMatricula.Caption)+')'); //William Santana - SIG 27626.32406
    frmBeneficioSaldadoFAB.qryAux.SQL.Add('INSERT INTO BENEFSALD_TEMP VALUES ('+quotedstr(frmBeneficioSaldadoFAB.qryInformacoes.FieldByName('MATRICULA').AsString)+')'); //William Santana - SIG 27626.32406
    frmBeneficioSaldadoFAB.qryAux.ExecSQL;



    Screen.Cursor := crHourGlass;
    if Exec_SP_Atualiza_Benef_Sald_FAB(0,Date()) then
      MsgDlg('Atualização Concluída.','Atenção',mtInformation,[mbOk],0)
    else
     MsgDlg('Ocorreu um erro, a atualização não foi concluída.','Atenção',mtInformation,[mbOk],0);
    Screen.Cursor := crDefault;
   
    if dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.Commit;
  except
    if dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.Rollback;
  end;

end;

function TfrmAlteracaoBeneficioSaldadoFAB.Exec_SP_Atualiza_Benef_Sald_FAB(AtualizarTudo : Integer; AtualizarAte: TDateTime) : Boolean;
var
  SP_PROC : TStoredProc;
begin
  frmProgresso.MostraFormProgresso('Atualizando Benefício Saldado e FAB, por favor, aguarde.', True, False,False);
  frmProgresso.lblContador.Caption := '';
  frmProgresso.btnCancelar.Visible := False;
  frmProgresso.Panel1.Visible := False;
  frmProgresso.Refresh;

  try

    try
      SP_PROC := TStoredProc.Create(Self);
      SP_PROC.DatabaseName  := 'BaseDados';
      //SP_PROC.StoredProcName := 'CM."SP_ATUALIZA_BENEF_SALD_FAB"';   //William Santana - SIG 27626.32406
      SP_PROC.StoredProcName  := 'CM.PCK_BENEFSALDFAB.SP_ATUALIZASALDO';  //William Santana - SIG 27626.32406

      //Criando os parametros
      SP_PROC.Params.CreateParam(ftInteger, 'pAtualizarTudo', ptInput);
      SP_PROC.Params.CreateParam(ftDateTime, 'pAtualizarAte', ptInput);

      //Passandos os parâmetros
      SP_PROC.ParamByName('pAtualizarTudo').AsInteger := AtualizarTudo;
      SP_PROC.ParamByName('pAtualizarAte').AsDate     := AtualizarAte ;

      if not SP_PROC.Prepared then
         SP_PROC.Prepare;

      SP_PROC.Close;
      SP_PROC.ExecProc;
      Result := True;
      SP_PROC.Close;

    except
       Result := False;          
    end;
     
  finally
    FreeAndNil(SP_PROC);
    frmProgresso.EscondeFormProgresso;
  end;
end;

procedure TfrmAlteracaoBeneficioSaldadoFAB.AtualizaLabels;
begin
   //Início - William Santana - SIG 27626.32406
//   frmBeneficioSaldadoFAB.lblCargo.Caption       := qryCargaBen.FieldByName('NOMECARGO').AsString;
//   frmBeneficioSaldadoFAB.lblFuncaoCC.Caption    := CurrToStrF( qryCargaBen.FieldByName('VALORCARGOCOMIS').AsFloat , ffCurrency, 2);
//   frmBeneficioSaldadoFAB.lblAts.Caption         := CurrToStrF( qryCargaBen.FieldByName('VALORATS').AsFloat, ffCurrency, 2);
//   frmBeneficioSaldadoFAB.lblSPEm.Caption        := CurrToStrF( qryCargaBen.FieldByName('SALPART').AsFloat, ffCurrency, 2);
//   //frmBeneficioSaldadoFAB.lblBSEm.Caption        := CurrToStrF( qryCargaBen.FieldByName('BENEFICIOSALDADO').AsFloat , ffCurrency, 2);  // edilaine - SOL 253577-17564 / PPM 987196
//   frmBeneficioSaldadoFAB.lblBSEm.Caption        := CurrToStrF( StrToFloat(dbredBeneficioSaldado.Text) , ffCurrency, 2);                 // edilaine - SOL 253577-17564 / PPM 987196
//
//
//   frmBeneficioSaldadoFAB.lblAdicionais.Caption  := CurrToStrF( qryCargaBen.FieldByName('VPGRATSEMADICTEMPSERV').AsFloat  +
//                                                                qryCargaBen.FieldByName('VPGIPTEMPOSERV').AsFloat  +
//                                                                qryCargaBen.FieldByName('VPGIPSEMSALCOMFUNC').AsFloat  +
//                                                                qryCargaBen.FieldByName('VPEXBH').AsFloat  +
//                                                                qryCargaBen.FieldByName('ADICCOMP').AsFloat  +
//                                                                qryCargaBen.FieldByName('ADICINCORP').AsFloat  +
//                                                                qryCargaBen.FieldByName('ADICNOTURNO').AsFloat  +
//                                                                qryCargaBen.FieldByName('ADICINSALU').AsFloat  +
//                                                                qryCargaBen.FieldByName('ADICPERI').AsFloat  +
//                                                                qryCargaBen.FieldByName('INCORPJUD').AsFloat  +
//                                                                qryCargaBen.FieldByName('COMPSALPADRAO').AsFloat , ffCurrency, 2);

   frmBeneficioSaldadoFAB.AbreQueries(frmBeneficioSaldadoFAB.iIdPessoa,frmBeneficioSaldadoFAB.iIdTitular);
   //Término - William Santana - SIG 27626.32406

end;


// edilaine - SOL 253577-17564 / PPM 987196 - inicio
procedure TfrmAlteracaoBeneficioSaldadoFAB.dbredBeneficioSaldadoBtnClick(Sender: TObject);
var
  rBS  : double;
  fIDC : double;
begin
  { = ( (( SP*1,02854347539058)*1,015^i - BINSS) * (IDC - 18)/TS)*1,1079  }

//Início - William Santana - SIG 27626.32406
//  if frmBeneficioSaldadoFAB.rdados.TS = 0 then
//     frmBeneficioSaldadoFAB.rdados.TS := 1;
//     
//  fIDC := (frmBeneficioSaldadoFAB.rdados.IdadeC - frmBeneficioSaldadoFAB.rdados.IdadeIni) / frmBeneficioSaldadoFAB.rdados.TS;
//  if fIDC > 1 then
//     fIDC := 1;
//
//  rBS := (((dbredSalario.Value * 1.02854347539058) * power( 1.015, frmBeneficioSaldadoFAB.rdados.Indice) - dbredBeneficioINSS.value) * fIDC) * 1.1079;
//
//  dbredBeneficioSaldado.Text := FormatFloat('#0.00', rBS);
   frmBeneficioSaldadoFAB.qryAux.Close;
   frmBeneficioSaldadoFAB.qryAux.SQL.Clear;
   frmBeneficioSaldadoFAB.qryAux.SQL.Add('SELECT CM.PCK_BENEFSALDFAB.FN_CALCULABS(:IDPESSOA, :SALPART, :BNINSS, :PBE) BS FROM DUAL');
   frmBeneficioSaldadoFAB.qryAux.ParamByName('IDPESSOA').AsInteger := qryCargaBen.FieldByName('IDPESSOA').AsInteger ;
   frmBeneficioSaldadoFAB.qryAux.ParamByName('SALPART').AsFloat := qryCargaBen.FieldByName('SALPART').AsFloat;
   frmBeneficioSaldadoFAB.qryAux.ParamByName('BNINSS').AsFloat := qryCargaBen.FieldByName('BINSS').AsFloat;
   frmBeneficioSaldadoFAB.qryAux.ParamByName('PBE').AsFloat := qryCargaBen.FieldByName('PERCENTPBE').AsFloat;
   frmBeneficioSaldadoFAB.qryAux.Open;

   dbredBeneficioSaldado.Text := frmBeneficioSaldadoFAB.qryAux.FieldByName('BS').AsString;
//Término - William Santana - SIG 27626.32406

  qryCargaBen.FieldByName('BENEFICIOSALDADO').AsFloat := StrToFloat(dbredBeneficioSaldado.Text);

  cSalPart   := qryCargaBen.FieldByName('SALPART').AsCurrency;
  cBenefINSS := qryCargaBen.FieldByName('BINSS').AsCurrency;
end;
// edilaine - SOL 253577-17564 / PPM 987196 - fim


end.
