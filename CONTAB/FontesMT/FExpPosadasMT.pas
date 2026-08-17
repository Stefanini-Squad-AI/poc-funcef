unit FExpPosadasMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, ComCtrls, wwdblook, Db, DBClient,
  uCtrlPeriodo, uCtrlPosadasExpBalancete, uCtrlContab;

type
  TfrmExpPosadasMT = class(TfrmSairAjuda)
    btnExportar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    Label3: TLabel;
    dblkExercicio: TwwDBLookupCombo;
    Label4: TLabel;
    dblkPeriodo: TwwDBLookupCombo;
    prbExportar: TProgressBar;
    cdsExercicio: TClientDataSet;
    cdsPeriodo: TClientDataSet;
    cdsExportaBal: TClientDataSet;
    GroupBox1: TGroupBox;
    cbGeraTNV: TCheckBox;
    cbConsideraCorTNV: TCheckBox;
    lblCaminho: TLabel;
    edCaminho: TEdit;
    mmStatus: TRichEdit;
    gbBalancete: TGroupBox;
    lblHoraIniBalM: TLabel;
    cbSoAnalitica: TCheckBox;
    cbDesconsideraEstatistica: TCheckBox;
    cbConsideraCorBalan: TCheckBox;
    cbGeraBalancete: TCheckBox;
    lblMensagens: TLabel;
    lblEmpresa: TLabel;
    edCodEmp: TEdit;
    Label1: TLabel;
    edCodEmpTNV: TEdit;
    cbGeraLanc: TCheckBox;
    procedure btnExportarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblkExercicioCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
  private
    { Private declarations }
    Periodo    : TCtrlPeriodo;
    PosadasExpBalancete : TCtrlPosadasExpBalancete;
    Contab : TCtrlContab;
    Procedure MensPeriodo(msg : String);
  public
    { Public declarations }
  end;

var
  frmExpPosadasMT: TfrmExpPosadasMT;

implementation

{$R *.DFM}

Uses uSistema, uCtrlParamIntegra,uMensErro, dBaseDados, uString,uFuncaoGeral,{$IFNDEF VERSAO0505} uCMTypes {$ENDIF};


procedure TfrmExpPosadasMT.btnExportarClick(Sender: TObject);
var sNomeArquivoLanc,sLinha,sMes,sNomeArquivoBalIni,sNomeArquivoBalMov, sNomeArquivoBalMes,sCaminho,sNomeArquivoTNV: String;
    ArquivoTextoLanc,ArquivoTextoBalIni,ArquivoTextoBalMov,ArquivoTextoBalMes,ArquivoTextoTNV : TextFile;
    bOK1,bOk2 : Boolean;
    cDec : Char;
    iPlnCodigo : Double;
begin
   inherited;
   Periodo.Exercicio := StrToIntDef(dblkExercicio.LookUpValue,0);
   Periodo.Periodo   := StrToIntDef(dblkPeriodo.LookUpValue,0);
   bOK1 := False;
   bOK2 := False;
   if not Contab.SelecionaParametros(Sistema.idEmpresa) then begin
      MsgDlg(Contab.MessageInfo,'Erro',mtError,[mbOk],0);
      dblkExercicio.SetFocus;
      Exit;
   end;
   if not Periodo.ValidaExercicio then begin
      MsgDlg(Periodo.MessageInfo,'Erro',mtError,[mbOk],0);
      dblkExercicio.SetFocus;
      Exit;
   end;
   if not Periodo.ValidaPeriodo then begin
      MsgDlg(Periodo.MessageInfo,'Erro',mtError,[mbOk],0);
      dblkPeriodo.SetFocus;
      Exit;
   end;
   if trim(edCodEmp.Text) = '' then begin
      MsgDlg('Obrigatório preencher o código da empresa','Erro',mtError,[mbOk],0);
      edCodEmp.SetFocus;
      Exit;
   end;
   if trim(edCaminho.Text) = '' then begin
      MsgDlg('Obrigatório preencher o caminho','Erro',mtError,[mbOk],0);
      edCaminho.SetFocus;
      Exit;
   end;
   if (cbGeraTNV.Checked) and (trim(edCodEmpTNV.Text) = '') then begin
      MsgDlg('Obrigatório preencher o código da empresa para gerar o TNV','Erro',mtError,[mbOk],0);
      edCodEmpTNV.SetFocus;
      Exit;
   end;
   if copy(trim(edCaminho.Text),length(trim(edCaminho.Text)),1) <> '\' then
      sCaminho := trim(edCaminho.Text)+'\'
   else
      sCaminho := trim(edCaminho.Text);
   if Periodo.Periodo < 10 then
      sMes := '0'+trim(IntToStr(Periodo.Periodo))
   else
      sMes := trim(IntToStr(Periodo.Periodo));
   mmStatus.Lines.Clear;
   btnExportar.Enabled := False;
   cDec := DecimalSeparator;
   DecimalSeparator := '.';
   Try
      //
      if cbGeraBalancete.Checked then begin
         mmStatus.Lines.Add('Exportando Balancete');
         mmStatus.Lines.Add('Inicio :'+TimeToStr(Time));
         Application.ProcessMessages;
         cdsExportaBal.Data := PosadasExpBalancete.ListaBalancete(ParamIntegra.Plano,Sistema.idEmpresa,
                                                                  Periodo.Periodo,Periodo.Exercicio,
                                                                  cbSoAnalitica.Checked,cbDesconsideraEstatistica.Checked,
                                                                  cbConsideraCorBalan.Checked);
         prbExportar.Position := 0;
         prbExportar.Max      := cdsExportaBal.RecordCount;
         if cdsExportaBal.IsEmpty then begin
            mmStatus.Lines.Add('Não existe Balancete a ser exportado');
         end else begin
            bOK1 := true;
            sNomeArquivoBalIni := sCaminho+trim(edCodEmp.Text)+'INI'+sMes+'.TXT';
            AssignFile(ArquivoTextoBalIni, sNomeArquivoBalIni);
            ReWrite(ArquivoTextoBalIni);
            //
            sNomeArquivoBalMov := sCaminho+trim(edCodEmp.Text)+'MOV'+sMes+'.TXT';
            AssignFile(ArquivoTextoBalMov, sNomeArquivoBalMov);
            ReWrite(ArquivoTextoBalMov);
            //
            sNomeArquivoBalMes := sCaminho+trim(edCodEmp.Text)+'MES'+sMes+'.TXT';
            AssignFile(ArquivoTextoBalMes, sNomeArquivoBalMes);
            ReWrite(ArquivoTextoBalMes);
            //
            screen.cursor := crHourglass;
            cdsExportaBal.First;
            while not cdsExportaBal.Eof do begin
               prbExportar.Position := prbExportar.Position + 1;
               sLinha := '';
               sLinha := sLinha + Espaco(cdsExportaBal.FieldByName('CONTA').asString,11);
               sLinha := sLinha + Espaco('Saldos Iniciais de '+dblkPeriodo.Text,30);
               sLinha := sLinha + FormatFloat('0.00', cdsExportaBal.FieldByName('SALDOANT').AsFloat)+cdsExportaBal.FieldByName('SALDOANTDC').asString;
               WriteLn(ArquivoTextoBalIni, sLinha);
               //
               if cdsExportaBal.FieldByName('MOVDEB').AsFloat <> 0 then begin
                  sLinha := '';
                  sLinha := sLinha + Espaco(cdsExportaBal.FieldByName('CONTA').asString,11);
                  sLinha := sLinha + Espaco('Saldos de INM de '+dblkPeriodo.Text,30);
                  sLinha := sLinha + FormatFloat('0.00', cdsExportaBal.FieldByName('MOVDEB').AsFloat)+'a';
                  WriteLn(ArquivoTextoBalMov, sLinha);
               end;
               //
               if cdsExportaBal.FieldByName('MOVCRE').AsFloat <> 0 then begin
                  sLinha := '';
                  sLinha := sLinha + Espaco(cdsExportaBal.FieldByName('CONTA').asString,11);
                  sLinha := sLinha + Espaco('Saldos de INM de '+dblkPeriodo.Text,30);
                  sLinha := sLinha + FormatFloat('0.00', cdsExportaBal.FieldByName('MOVCRE').AsFloat)+'c';
                  WriteLn(ArquivoTextoBalMov, sLinha);
               end;
               //
               sLinha := '';
               sLinha := sLinha + Espaco(cdsExportaBal.FieldByName('CONTA').asString,11);
               sLinha := sLinha + Espaco('Saldos do Mês de '+dblkPeriodo.Text,30);
               sLinha := sLinha + FormatFloat('0.00', cdsExportaBal.FieldByName('MOV').AsFloat)+ cdsExportaBal.FieldByName('MOVDC').asString;
               WriteLn(ArquivoTextoBalMes, sLinha);
               //
               cdsExportaBal.Next;
            end;
            CloseFile(ArquivoTextoBalIni);
            CloseFile(ArquivoTextoBalMes);
            CloseFile(ArquivoTextoBalMov);
            screen.cursor := crDefault;
            mmStatus.Lines.Add('Gerados os arquivos '+sNomeArquivoBalIni+', '+sNomeArquivoBalMes+' e '+sNomeArquivoBalMov);
         end;
         mmStatus.Lines.Add('Final :'+TimeToStr(Time));
         Application.ProcessMessages;
         //
      end;
      if cbGeraLanc.Checked then begin
         mmStatus.Lines.Add('Exportando Lançamentos');
         mmStatus.Lines.Add('Inicio :'+TimeToStr(Time));
         Application.ProcessMessages;
         cdsExportaBal.Data := PosadasExpBalancete.ListaTotLancamentos(ParamIntegra.Plano,Sistema.idEmpresa,
                                                                  Periodo.Periodo,Periodo.Exercicio);
         prbExportar.Position := 0;
         prbExportar.Max      := cdsExportaBal.RecordCount;
         if cdsExportaBal.IsEmpty then begin
            mmStatus.Lines.Add('Não existem Lançamentos a serem exportados');
         end else begin
            bOK1 := true;
            sNomeArquivoLanc := sCaminho+trim(edCodEmp.Text)+'LANC'+sMes+'.TXT';
            AssignFile(ArquivoTextoLanc, sNomeArquivoLanc);
            ReWrite(ArquivoTextoLanc);
            //Grava o total de planilhas
            sLinha := cdsExportaBal.FieldByName('TOTLANC').asString;
            WriteLn(ArquivoTextoLanc, sLinha);
            cdsExportaBal.Data := PosadasExpBalancete.ListaLancamentos(ParamIntegra.Plano,Sistema.idEmpresa,
                                                                        Periodo.Periodo,Periodo.Exercicio,
                                                                        cbConsideraCorBalan.Checked);
            //
            iPlnCodigo := -222;
            screen.cursor := crHourglass;
            cdsExportaBal.First;
            while not cdsExportaBal.Eof do begin
               if (iPlnCodigo <> cdsExportaBal.FieldByName('PLNCODIGO').asFloat) then begin
                  iPlnCodigo := cdsExportaBal.FieldByName('PLNCODIGO').asFloat;
                  sLinha := '';
                  sLinha := sLinha + Espaco(cdsExportaBal.FieldByName('PLNPLANIL').asString,7);
                  sLinha := sLinha + Espaco(cdsExportaBal.FieldByName('TIPDESCRICAO').asString,40);
                  sLinha := sLinha + Espaco(cdsExportaBal.FieldByName('DATALANC').asString,6);
                  WriteLn(ArquivoTextoLanc, sLinha);
               end;
               prbExportar.Position := prbExportar.Position + 1;
               sLinha := '';
               sLinha := sLinha + Espaco(cdsExportaBal.FieldByName('CONTA').asString,11);
               sLinha := sLinha + Espaco(Copy(cdsExportaBal.FieldByName('LACHIST1').asString,1,30),30);
               sLinha := sLinha + FormatFloat('0.00', cdsExportaBal.FieldByName('VALORLANC').AsFloat)+ cdsExportaBal.FieldByName('MOVDC').asString;
               WriteLn(ArquivoTextoLanc, sLinha);
               cdsExportaBal.Next;
               if (iPlnCodigo <> cdsExportaBal.FieldByName('PLNCODIGO').asFloat) or (cdsExportaBal.Eof) then begin
                  sLinha := '@';
                  WriteLn(ArquivoTextoLanc, sLinha);
               end;
            end;
            CloseFile(ArquivoTextoLanc);
            screen.cursor := crDefault;
            mmStatus.Lines.Add('Gerado o arquivo '+sNomeArquivoLanc);
         end;
         mmStatus.Lines.Add('Final :'+TimeToStr(Time));
         Application.ProcessMessages;
         //
      end;
      if cbGeraTNV.Checked then begin
         mmStatus.Lines.Add('Exportando TNV');
         mmStatus.Lines.Add('Inicio :'+TimeToStr(Time));
         Application.ProcessMessages;
         cdsExportaBal.Data := PosadasExpBalancete.ListaTNV(ParamIntegra.Plano,Sistema.idEmpresa,
                                                                  Periodo.Periodo,Periodo.Exercicio,
                                                                  False,False,cbConsideraCorTNV.Checked);
         prbExportar.Position := 0;
         prbExportar.Max      := cdsExportaBal.RecordCount;
         if cdsExportaBal.IsEmpty then begin
            mmStatus.Lines.Add('Não existe TNV a ser exportado');
         end else begin
            //
            bOK2 := true;
            sNomeArquivoTNV := sCaminho+'T'+trim(edCodEmpTNV.Text)+Copy(cdsPeriodo.FieldByName('PERNOMEOUTLING').AsString,1,3)+'.TXT';
            AssignFile(ArquivoTextoTNV, sNomeArquivoTNV);
            ReWrite(ArquivoTextoTNV);
            //
            screen.cursor := crHourglass;
            cdsExportaBal.First;
            while not cdsExportaBal.Eof do begin
               prbExportar.Position := prbExportar.Position + 1;
               sLinha := 'P'+sMes+CHR(09);
               sLinha := sLinha + trim(edCodEmpTNV.Text)+CHR(09);
               sLinha := sLinha + Espaco(cdsExportaBal.FieldByName('CONTA').asString,20)+CHR(09);
               sLinha := sLinha + FuncaoGeral.AD(FormatFloat('0.00', cdsExportaBal.FieldByName('MOV').AsFloat), 20);
               WriteLn(ArquivoTextoTNV, sLinha);
               cdsExportaBal.Next;
            end;
            CloseFile(ArquivoTextoTNV);
            screen.cursor := crDefault;
            mmStatus.Lines.Add('Gerado o arquivo '+sNomeArquivoTNV);
         end;
         mmStatus.Lines.Add('Final :'+TimeToStr(Time));
         mmStatus.Lines.Add('    ');
         Application.ProcessMessages;
      end;
      if bOK1 and bOK2 then
         MsgDlg('Exportação dos Arquivos efetuada com sucesso!','Aviso',mtWarning,[mbOk],0)
      else
         if bOK1 then
            MsgDlg('Exportação do Balancete efetuada com sucesso!','Aviso',mtWarning,[mbOk],0)
         else
            if bOK2 then
               MsgDlg('Exportação do TNV efetuada com sucesso!','Aviso',mtWarning,[mbOk],0)
            else
               MsgDlg('Nada foi Exportado!','Aviso',mtWarning,[mbOk],0);
   Finally
      DecimalSeparator := cDec;
      btnExportar.Enabled := True;
   end;
end;

procedure TfrmExpPosadasMT.FormActivate(Sender: TObject);
begin
  inherited;
  cdsExercicio.Data := Periodo.ListExercicios(Sistema.idEmpresa,False);
  cdsPeriodo.Data   := Periodo.ListPeriodo(Sistema.idEmpresa,tbpSoBloq,0,0);
end;

procedure TfrmExpPosadasMT.FormCreate(Sender: TObject);
begin
  inherited;
  //Criação da Classe de Negócio
  Periodo := TCtrlPeriodo.Create;
  Periodo.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,True,MensPeriodo);

  Contab := TCtrlContab.Create;
  Contab.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,False);

  PosadasExpBalancete := TCtrlPosadasExpBalancete.Create;
  PosadasExpBalancete.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,False);
end;

procedure TfrmExpPosadasMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Periodo.Free;
  Contab.Free;
  PosadasExpBalancete.Free;
end;


procedure TfrmExpPosadasMT.dblkExercicioCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if modified and (dblkExercicio.Text <> '') then begin
     cdsPeriodo.Filtered := False;
     cdsPeriodo.Filter   := 'PEREXERCICIO = '+dblkExercicio.LookupValue;
     cdsPeriodo.Filtered := True;
  end;
end;


procedure TfrmExpPosadasMT.MensPeriodo(msg: String);
begin
   mmStatus.Lines.Add(msg);
   Application.ProcessMessages;
end;

end.
