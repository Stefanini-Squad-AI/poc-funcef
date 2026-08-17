{------------------------------------------------------------------------------------
Autor: Ewerton Beltramini
Data: 18/12/2020
Pendência: SIG104002
Descrição: Importação do Plano de Contas via arquivo.
------------------------------------------------------------------------------------}
unit FCadDeParaContasMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uCtrlContaContabil,uCtrlContab,uCtrlPlano, uCtrlPlanoDePara,FCadastroMT, StdCtrls,
  CMProcuraMask, wwdblook, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls,uCtrlListTerceiros,
  uCMTypes, ComCtrls, ComObj, DBTables, Wwquery;

type
  TfrmCadDeParaContasMT = class(TFrmCadastroMT)
    Panel1: TPanel;
    Label2: TLabel;
    lblCCustoOri: TLabel;
    dblkPlanoOri: TwwDBLookupCombo;
    dblkCCustoOri: TwwDBLookupCombo;
    Panel3: TPanel;
    Panel2: TPanel;
    Label3: TLabel;
    lblCCustoDes: TLabel;
    dblkPlanoDes: TwwDBLookupCombo;
    dblkCCustoDes: TwwDBLookupCombo;
    Panel4: TPanel;
    cmpContaIni: TCMProcuraMaskContabil;
    cmpContaFim: TCMProcuraMaskContabil;
    cdsPlanoIni: TCMClientDataSet;
    cdsPlanoFim: TCMClientDataSet;
    cdsCustoFim: TCMClientDataSet;
    cdsCustoIni: TCMClientDataSet;
    cdsContas: TCMClientDataSet;
    GroupBox1: TGroupBox;
    edtArqEventoCobranca: TEdit;
    btnProcurar: TBitBtn;
    btnLimpaPart: TBitBtn;
    BtnImportar: TBitBtn;
    Dialog: TOpenDialog;
    QryAux: TwwQuery;
    Qry: TwwQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure cmpContaIniExit(Sender: TObject);
    procedure cmpContaFimExit(Sender: TObject);
    procedure dblkPlanoOriExit(Sender: TObject);
    procedure dblkPlanoDesExit(Sender: TObject);
    procedure dblkPlanoOriCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblkPlanoDesCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure FormShow(Sender: TObject);
    procedure BtnImportarClick(Sender: TObject);
    procedure btnProcurarClick(Sender: TObject);
    procedure btnLimpaPartClick(Sender: TObject);
  private
    iSalvaPlano1, iSalvaPlano2 : LongInt; 
    CtrlContab    : TCtrlContab;
    CtrlPlano     : TCtrlPlano;
    CtrlPlanoDePara :TCtrlPlanoDePara;
    CtrlContaContabil : TCtrlContaContabil;
    CtrlListTerceiros : TCtrlListTerceiros;
  public
    { Public declarations }
    function ProcessaArquivo():boolean;
  end;

var
  frmCadDeParaContasMT: TfrmCadDeParaContasMT;

implementation

Uses uSistema, uMensErro, dBaseDados,uModulo, FProgresso;

var
   StlArqTexto :TStringList;

{$R *.DFM}

procedure TfrmCadDeParaContasMT.FormCreate(Sender: TObject);
begin
  inherited;
  // *** Instancia a classe geral Ctrlcontab ****
  CtrlContab := TCtrlContab.Create;
  CtrlContab.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                    Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  If Not CtrlContab.SelecionaParametros(Sistema.IdEmpresa) Then
     MsgDlg(CtrlContab.MessageInfo,'Erro',MtError,[mbOk],0);

  //*** Instancia a classe de contas ***
  CtrlPlanoDePara  := TCtrlPlanoDePara.Create;
  CtrlPlanoDePara.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                            Sistema.ConnectionSide,Sistema.AppRemoteServer,False);

  CtrlPlanoDePara.CdsPlanoDePara := Cds;
  Cds.Data  := CtrlPlanoDePara.ListPlanoDePara(-1);

  //*** Instancia a classe de contas ***
  CtrlPlano  := TCtrlPlano.Create;
  CtrlPlano.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                            Sistema.ConnectionSide,Sistema.AppRemoteServer,False);

  CdsPlanoIni.Data     := CtrlPlano.ListPlano(0);
  CdsPlanoFim.Data     := CtrlPlano.ListPlano(0);

  //*** Instancia a classe de contas ***
  CtrlContaContabil        := TCtrlContaContabil.Create;
  CtrlContaContabil.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                     Sistema.ConnectionSide,Sistema.AppRemoteServer,False);


  //Atribui a máscara da conta contábil e o filtro de plano ao MontaSelect
  MontaSelect.Mascaras[1] := modulo.sMascaraContas + ';0; ';
  MontaSelect.Mascaras[3] := modulo.sMascaraContas + ';0; ';

    StlArqTexto := TStringList.Create;


end;

procedure TfrmCadDeParaContasMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlContab.free;
  CtrlPlano.free;
  CtrlPlanoDePara.free;
  CtrlListTerceiros.free;
  CtrlContaContabil.free;
end;

procedure TfrmCadDeParaContasMT.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  if dblkPlanoOri.canfocus then dblkPlanoOri.SetFocus;

end;

procedure TfrmCadDeParaContasMT.CmeCadastroAfterConfirma(Sender: TObject);
begin
   Cds.Data := CtrlPlanoDePara.ListPlanoDePara(Cds.FieldByName('IDPLANODEPARA').asInteger);

end;

procedure TfrmCadDeParaContasMT.CmeCadastroFind(Sender: TObject);
var
  iIndice  :integer;
  sTipo :string;
begin
  inherited;
    If MontaSelect.RetornouValor then
    Begin

       //Se houve busca, abre a query principal apenas com o registro buscado
       iIndice := StrToInt(MontaSelect.ValoresChave[0]);

       cds.Data := CtrlPlanoDePara.ListPlanoDePara(iIndice);

      //=== busca outros dados da conta ===
      cdsContas.Data :=  CtrlContaContabil.ListContas(cds.FieldByName('PLANO1').asFloat,tcAmbasC,True,cds.FieldByName('CONTA1').AsString);

      sTipo := cdsContas.FieldByName('PLATIPO').asString;

      if sTipo = 'S' then
      begin

         dblkCCustoOri.enabled := true;
         dblkCCustoOri.color   := clWindow;
         lblCCustoOri.enabled  := true;
         cmpContaIni.Enabled   := True;
         cdsCustoIni.Data      := CtrlContaContabil.ListContasxCC(cds.FieldByName('PLANO1').asInteger,Sistema.idEmpresa,
                                  cmpContaIni.Conta.Numero,'',tccAmbasCC,toCodigo);

      end else begin
         cmpContaIni.Enabled   := False;
         dblkCCustoOri.text    := '';
         dblkCCustoOri.enabled := false;
         dblkCCustoOri.color   := clBtnFace;
         lblCCustoOri.enabled  := false;
         cdsCustoIni.Data      := CtrlContaContabil.ListContasxCC(-1,-1,'','',tccAmbasCC,toCodigo);
     end;

      cdsContas.Data :=  CtrlContaContabil.ListContas(cds.FieldByName('PLANO2').asFloat,tcAmbasC,True,cds.FieldByName('CONTA2').AsString);
      sTipo := cdsContas.FieldByName('PLATIPO').asString;

      if sTipo = 'S' then begin
         cmpContaFim.Enabled   := True;
         dblkCCustoDes.enabled := true;
         dblkCCustoDes.color   := clWindow;
         lblCCustoDes.enabled  := true;

         cdsCustoFim.Data :=  CtrlContaContabil.ListContasxCC(cds.FieldByName('PLANO2').asInteger,Sistema.idEmpresa,
                              cmpContaFim.Conta.Numero,'',tccAmbasCC,toCodigo);
      end else begin
         cmpContaFim.Enabled   := False;
         dblkCCustoDes.text    := '';
         dblkCCustoDes.enabled := false;
         dblkCCustoDes.color   := clBtnFace;
         lblCCustoDes.enabled  := false;
         cdsCustoFim.Data :=  CtrlContaContabil.ListContasxCC(-1,-1,'','',tccAmbasCC,toCodigo);
      end;
      dblkPlanoOri.OnExit(self);
      dblkPlanoDes.OnExit(self);

   end;

end;

procedure TfrmCadDeParaContasMT.cmpContaIniExit(Sender: TObject);
var
  sTipo :string;
begin
  inherited;
   if cmpContaIni.Conta.Numero <> '' then
   begin
      if dblkPlanoOri.text <> '' then
      begin

         sTipo := '';
         cdsContas.Data :=  CtrlContaContabil.ListContas(StrToInt(dblkPlanoOri.lookupValue),tcAmbasC,True,cmpContaIni.Conta.Numero);
         sTipo := cdsContas.FieldByName('PLACCUST').asString;

         if sTipo = 'S' then
         begin
            dblkCCustoOri.enabled := true;
            dblkCCustoOri.color   := clWindow;
            lblCCustoOri.enabled  := true;

            cdsCustoIni.Data :=  CtrlContaContabil.ListContasxCC(StrToInt(dblkPlanoOri.lookupValue),Sistema.idEmpresa,
                                 cmpContaIni.Conta.Numero,'',tccAmbasCC,toCodigo);
         end else begin
            dblkCCustoOri.text    := '';
            dblkCCustoOri.enabled := false;
            dblkCCustoOri.color   := clBtnFace;
            lblCCustoOri.enabled  := false;

            cdsCustoIni.Data :=  CtrlContaContabil.ListContasxCC(-1,-1,' ','',tccAmbasCC,toCodigo);
         end;
      end else begin
         MsgDlg('Plano de Origem não selecionado.','Aviso',mtWarning,[mbOk],0);
         dblkPlanoOri.SetFocus;
         cmpContaIni.Clear;
      end;
   end;

end;

procedure TfrmCadDeParaContasMT.cmpContaFimExit(Sender: TObject);
var
  sTipo :string;
begin
  inherited;
   if cmpContaFim.Conta.Numero <> '' then
   begin
      if dblkPlanoDes.text <> '' then
      begin
         sTipo := '';

         sTipo := '';
         cdsContas.Data :=  CtrlContaContabil.ListContas(StrToInt(dblkPlanoDes.lookupValue),tcAmbasC,True,cmpContaFim.Conta.Numero);
         sTipo := cdsContas.FieldByName('PLACCUST').asString;

         if sTipo = 'S' then begin
            dblkCCustoDes.enabled := true;
            dblkCCustoDes.color   := clWindow;
            lblCCustoDes.enabled  := true;

            cdsCustoFim.Data :=  CtrlContaContabil.ListContasxCC(StrToInt(dblkPlanoDes.lookupValue),Sistema.idEmpresa,
                                 cmpContaFim.Conta.Numero,'',tccAmbasCC,toCodigo);

         end else begin
            dblkCCustoDes.text    := '';
            dblkCCustoDes.enabled := false;
            dblkCCustoDes.color   := clBtnFace;
            lblCCustoDes.enabled  := false;

            cdsCustoFim.Data :=  CtrlContaContabil.ListContasxCC(-1,-1,' ','',tccAmbasCC,toCodigo);

         end;
      end else begin
         MsgDlg('Plano de Destino não selecionado.','Aviso',mtWarning,[mbOk],0);
         dblkPlanoDes.SetFocus;
         cmpContaFim.Clear;
      end;
   end;

end;

procedure TfrmCadDeParaContasMT.dblkPlanoOriExit(Sender: TObject);
begin
  inherited;
   if dblkPlanoOri.text <> '' then
   begin
      cmpContaIni.Enabled := True;
      iSalvaPlano1 := StrToInt(dblkPlanoOri.LookUpValue);
      cmpContaIni.Plano    := iSalvaPlano1;
      cmpContaIni.Mascara  := cdsPlanoIni.FieldByName('MASCARA').asString;
   end else
   begin
      cmpContaIni.Enabled := False;
   end;

end;

procedure TfrmCadDeParaContasMT.dblkPlanoDesExit(Sender: TObject);
begin
  inherited;
   if dblkPlanoDes.text <> '' then
   begin
      cmpContaFim.Enabled := True;

      iSalvaPlano2 := StrToInt(dblkPlanoDes.LookUpValue);

      cmpContaFim.Plano    := iSalvaPlano2;
      cmpContaFim.Mascara  := cdsPlanoFim.FieldByName('MASCARA').asString;
   end else
   begin
      cmpContaFim.Enabled := False;

   end;

end;

procedure TfrmCadDeParaContasMT.dblkPlanoOriCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
   if dblkPlanoOri.text <> '' then
   begin
      cmpContaIni.Enabled := True;
      iSalvaPlano1 := StrToInt(dblkPlanoOri.LookUpValue);
      cmpContaIni.Plano    := iSalvaPlano1;
      cmpContaIni.Mascara  := cdsPlanoIni.FieldByName('MASCARA').asString;
   end else
   begin
      cmpContaIni.Enabled := False;
   end;
end;

procedure TfrmCadDeParaContasMT.dblkPlanoDesCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
   if dblkPlanoDes.text <> '' then
   begin
      cmpContaFim.Enabled := True;

      iSalvaPlano2 := StrToInt(dblkPlanoDes.LookUpValue);

      cmpContaFim.Plano    := iSalvaPlano2;
      cmpContaFim.Mascara  := cdsPlanoFim.FieldByName('MASCARA').asString;
   end else
   begin
      cmpContaFim.Enabled := False;

   end;
end;

procedure TfrmCadDeParaContasMT.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
   iSalvaPlano1 := 0;
   iSalvaPlano2 := 0;

   dblkPlanoOri.text := '';
   dblkPlanoDes.text := '';

   dblkCCustoOri.text    := '';
   dblkCCustoDes.text    := '';
   dblkCCustoOri.enabled := false;
   dblkCCustoDes.enabled := false;
   dblkCCustoOri.color   := clBtnFace;
   dblkCCustoDes.color   := clBtnFace;
   lblCCustoOri.enabled  := false;
   lblCCustoDes.enabled  := false;

   cmpContaIni.Clear;
   cmpContaFim.Clear;
end;

procedure TfrmCadDeParaContasMT.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;

  If Cds.State in [dsInsert, dsEdit]  Then
  Begin
     if (dblkPlanoOri.Text = '') then begin
         MsgDlg('Plano de Origem não selecionado.','Aviso',mtWarning,[mbOk],0);
         dblkPlanoOri.SetFocus;
         Accept := False;
     end;

     if (cmpContaIni.Conta.Numero = '') then begin
         MsgDlg('Conta de Origem não preenchida.','Aviso',mtWarning,[mbOk],0);
         cmpContaIni.SetFocus;
         Accept := False;
     end;

     if (dblkPlanoDes.Text = '') then begin
         MsgDlg('Plano de Destino não selecionado.','Aviso',mtWarning,[mbOk],0);
         dblkPlanoDes.SetFocus;
         Accept := False;
     end;

     if (cmpContaFim.Conta.Numero = '') then begin
         MsgDlg('Conta de Destino não preenchida.','Aviso',mtWarning,[mbOk],0);
         cmpContaFim.SetFocus;
         Accept := False;
     end;

      cds.FieldByName('CONTA1').asString := cmpContaIni.Conta.Numero;
      cds.FieldByName('CONTA2').asString := cmpContaFim.Conta.Numero;

      if dblkCCustoOri.text <> '' then begin
         cds.FieldByName('IDEMPRESA1').asInteger := sistema.idEmpresa;
      end;

      if dblkCCustoDes.text <> '' then begin
         cds.FieldByName('IDEMPRESA2').asInteger := sistema.idEmpresa;
      end;

  End;

end;

procedure TfrmCadDeParaContasMT.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
   //Abre a query principal contendo zero registros
   cds.FieldByName('PLANO1').asInteger := iSalvaPlano1;
   cds.FieldByName('PLANO2').asInteger := iSalvaPlano2;

end;

procedure TfrmCadDeParaContasMT.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  accept := CtrlPlanoDePara.Gravar;
end;

procedure TfrmCadDeParaContasMT.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  accept := CtrlPlanoDePara.Gravar;

end;

procedure TfrmCadDeParaContasMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  accept := CtrlPlanoDePara.Gravar;

end;

procedure TfrmCadDeParaContasMT.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  If CtrlPlanoDePara.MessageInfo  <>  '' Then
     MsgDlg(CtrlPlanoDePara.MessageInfo, 'Erro', mtError, [mbOk], 0);

end;

procedure TfrmCadDeParaContasMT.FormShow(Sender: TObject);
begin
  inherited;
   iSalvaPlano1 := 0;
   iSalvaPlano2 := 0;

   BtnImportar.Enabled := True;
   btnProcurar.Enabled := True;
   btnLimpaPart.Enabled := True;


end;
//Ewerton Beltramini SIG 104002 - Inicio...
procedure TfrmCadDeParaContasMT.BtnImportarClick(Sender: TObject);
var sMSG : String;
begin
  inherited;

  sMSG := '';
  if (Dialog.FileName = '' )     then sMSG := 'É obrigatório informar o Arquivo a ser importado!';

  if sMSG <> '' then begin
     MsgDlg(sMSG , Caption, mtInformation , [mbOk], 0);
     exit;
  end;

  if (ProcessaArquivo) then
      MsgDlg('Processo realizado com sucesso!','Informação',mtInformation,[mbOk],0);

  btnLimpaPartClick(Sender);

end;
//Ewerton Beltramini SIG 104002 - Fim.

//Ewerton Beltramini SIG 104002 - Inicio...
function TfrmCadDeParaContasMT.ProcessaArquivo():boolean;
var
    Excel : Variant;
    linha, numRegs, cont: integer;

        sIdplanodepara,
        sPlano1,
        sConta1,
        sPlano2,
        sConta2,
        sTrgdtinclusao,
        sTrguserinclusao,
        sIdempresa1,
        sCentrocusto1,
        sIdempresa2,
        sCentrocusto2   : string;

    sSeq, sSeqApagar : String;
    bApagarRegistro : Boolean;

begin


     try

           Excel := CreateOleObject('Excel.application');
           Excel.Visible := False;
           Excel.WorkBooks.Open(ExpandUNCFileName(Dialog.FileName),1);

          if not dtmBaseDados.dbBaseDados.InTransaction then
                 dtmBaseDados.dbBaseDados.StartTransaction;

          //pega numero total de regitros no aquivo excel
          numRegs := 0;
          while (Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[numRegs+2, 1].Value)) <> '') do
                inc(numRegs);

          if numRegs = 0 then
          begin
               MsgDlg('Não foram localizados registros no arquivo selecionado!' , Caption, mtInformation , [mbOk], 0);
               Exit;
          end;

          frmProgresso.MostraFormProgresso('Processando Arquivo...', True, True, True, 0, numRegs );
          frmProgresso.btnCancelar.Visible := true;
          frmProgresso.Refresh;

          //processa arquivo...
          try
              bApagarRegistro := False;
              linha := 2;
              while (linha-1 <= numRegs ) do
              begin

                   if frmProgresso.Cancelou then
                   begin
                       //MsgDlg('Processo cancelado pelo usuário!','Informação',mtInformation,[mbOk],0);
                         Exit;
                   end;

                   sIdplanodepara       := '';
                   sPlano1              := '';
                   sConta1              := '';
                   sPlano2              := '';
                   sConta2              := '';
                   sTrgdtinclusao       := '';
                   sTrguserinclusao     := '';
                   sIdempresa1          := '';
                   sCentrocusto1        := '';
                   sIdempresa2          := '';
                   sCentrocusto2        := '';

                   //sIdplanodepara      := Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 1].Value));
                   sPlano1             := Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 1].Value));
                   sConta1             := Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 2].Value));
                   sPlano2             := Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 3].Value));
                   sConta2             := Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 4].Value));
                   //sTrgdtinclusao      := Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 6].Value));
                   //sTrguserinclusao    := Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 7].Value));
                   //sIdempresa1         := Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 8].Value));
                   //sCentrocusto1       := Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 9].Value));
                   //sIdempresa2         := Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha,10].Value));
                   //sCentrocusto2       := Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha,11].Value));


                   if  sIdplanodepara    = '' then   sIdplanodepara     := 'NULL';
                   if  sPlano1           = '' then   sPlano1            := 'NULL';
                   if  sConta1           = '' then   sConta1            := 'NULL';
                   if  sPlano2           = '' then   sPlano2            := 'NULL';
                   if  sConta2           = '' then   sConta2            := 'NULL';
                   if  sTrgdtinclusao    = '' then   sTrgdtinclusao     := 'NULL';
                   if  sTrguserinclusao  = '' then   sTrguserinclusao   := 'NULL';
                   if  sIdempresa1       = '' then   sIdempresa1        := 'NULL';
                   if  sCentrocusto1     = '' then   sCentrocusto1      := 'NULL';
                   if  sIdempresa2       = '' then   sIdempresa2        := 'NULL';
                   if  sCentrocusto2     = '' then   sCentrocusto2      := 'NULL';

                   QryAux.Close;
                   QryAux.SQL.Clear;
                   QryAux.SQL.Add('SELECT * FROM PLANODEPARA');
                   QryAux.SQL.Add('WHERE PLANO1 = ' + QuotedStr(sPlano1) );
                   QryAux.SQL.Add('  AND CONTA1 = ' + QuotedStr(sConta1) );
                   QryAux.SQL.Add('  AND PLANO2 = ' + QuotedStr(sPlano2) );
                   QryAux.SQL.Add('  AND CONTA2 = ' + QuotedStr(sConta2) );
                   QryAux.Open;  

                   if not QryAux.IsEmpty then
                   begin
                       if (bApagarRegistro = False) then
                       begin
                           if MsgDlg('Registro já cadastrado para os dados informados: '
                                     + #13 + 'DE: Plano1: ' + sPlano1 + ' Conta 1: ' + sConta1 + ' PARA: Plano2:' + sPlano2 + ' Conta 2: ' + sConta2
                                     + #13 + 'Para continuar, todos os registros deste DE/PARA do Plano 1 para o Plano 2 serão apagados!'
                                     + #13 + 'Deseja continuar?', Caption, mtInformation , [mbYes,mbNo], 0) = mrYes then
                           begin
                                 bApagarRegistro := True;
                           end
                           else
                           Exit;
                       end;

                       try
                           QryAux.Close;
                           QryAux.SQL.Clear;
                           QryAux.SQL.Add('DELETE FROM PLANODEPARA');
                           QryAux.SQL.Add('WHERE PLANO1 = ' + sPlano1 );
                           QryAux.SQL.Add('  AND PLANO2 = ' + sPlano2 );
                           QryAux.ExecSql;

                           if QryAux.RowsAffected > 0 then
                           begin
                                 MsgDlg('Registros apagados com sucesso!' + #13 + '--> DE: Plano1:' + sPlano1 + ' --> PARA: Plano2:' + sPlano2, Caption, mtInformation , [mbOk], 0);
                           end;
                       except
                           MsgDlg('Erro ao tentar realizar a exclusão dos Registros do DE/PARA' + #13 + '--> DE: Plano1:' + sPlano1 + ' --> PARA: Plano2:' + sPlano2 , Caption, mtInformation , [mbOk], 0);
                           exit;
                       end;
                   end;

                   if linha = 1203 then
                      Linha:= Linha;

                   QryAux.Close;
                   QryAux.SQL.Clear;
                   QryAux.SQL.Add('SELECT MAX(IDPLANODEPARA) + 1 AS IDPLANODEPARA FROM PLANODEPARA');
                   QryAux.Open;
                   //Carrega a sequencia a ser utilizada....
                   sSeq :=  QryAux.FieldByName('IDPLANODEPARA').AsString;

                   //Salvando na tabela...
                   Qry.Close;
                   Qry.SQL.Clear;
                   Qry.SQL.Add(' INSERT INTO PLANODEPARA (IDPLANODEPARA, PLANO1, CONTA1, PLANO2, CONTA2, TRGDTINCLUSAO, TRGUSERINCLUSAO, IDEMPRESA1, CENTROCUSTO1, IDEMPRESA2, CENTROCUSTO2) ');
                   Qry.SQL.Add(' VALUES (' );
                   Qry.SQL.Add( sSeq + ',');
                   Qry.SQL.Add( sPlano1 + ',');
                   Qry.SQL.Add( QuotedStr(sConta1) + ',');
                   Qry.SQL.Add( sPlano2 + ',');
                   Qry.SQL.Add( QuotedStr(sConta2) + ',');
                   Qry.SQL.Add( QuotedStr(formatdatetime('ddmmyyy',date)) + ',');
                   Qry.SQL.Add( QuotedStr(IntToStr(Sistema.IdUsuario)) + ',');
                   Qry.SQL.Add( sIdempresa1 + ',');
                   Qry.SQL.Add( sCentrocusto1 + ',');
                   Qry.SQL.Add( sIdempresa2 + ',');
                   Qry.SQL.Add( sCentrocusto2 + ')');
                   Qry.ExecSql; 

                   inc(linha);
                   frmProgresso.AndaFormProgresso(linha);
                   frmProgresso.Refresh;
              end;

              if dtmBaseDados.dbBaseDados.InTransaction then
                 dtmBaseDados.dbBaseDados.Commit;
                 result := true;

            except
            begin
                  if dtmBaseDados.dbBaseDados.InTransaction then
                     dtmBaseDados.dbBaseDados.Rollback;
                     result := false;

                  MsgDlg('Erro ao Realizar a Importação!' + #13 + 'Verifique se os dados na planilha estão dispostos de forma correta segundo o Layout!' , Caption, mtInformation , [mbOk], 0);
            end

            end;

     finally
      Excel.ActiveWorkBook.Saved:= 1;
      Excel.DisplayAlerts:= 0;
      Excel.ActiveWorkBook.Close(SaveChanges:= 0);
      Excel.Workbooks.Close;
      Excel.Quit;
      Excel := Unassigned;

      frmProgresso.EscondeFormProgresso;

     end;
end;

procedure TfrmCadDeParaContasMT.btnProcurarClick(Sender: TObject);
begin
  inherited;
  dialog.Filter := '*.xls|*.xlsx';
  if not dialog.Execute then
    Exit
  else
      edtArqEventoCobranca.Text := ExtractFileName(Dialog.FileName);
end;

procedure TfrmCadDeParaContasMT.btnLimpaPartClick(Sender: TObject);
begin
  inherited;
  edtArqEventoCobranca.text := '';
  Dialog.FileName := '';

end;
//Ewerton Beltramini SIG 104002 - fim.

end.
