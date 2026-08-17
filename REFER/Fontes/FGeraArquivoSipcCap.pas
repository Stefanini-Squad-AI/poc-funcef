unit FGeraArquivoSipcCap;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, ComCtrls, BfDialogs, BrowseFolder, uProcuraDir, StdCtrls,
  ExtCtrls, TREdit, wwdblook, Db, DBClient, uCMClientDataSet, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, Grids, Wwdbigrd,
  Wwdbgrid, Wwdatsrc, uCtrlContab, wwclient, uMensErro, uCmSqlParams, uCtrlPeriodo, uCtrlPadroes, uSistema;

type
  TFrmGeraArquivoSipcCap = class(TfrmOkCancelar)
    cdsExercicio: TCMClientDataSet;
    Label3: TLabel;
    dblkExercicio: TwwDBLookupCombo;
    dblkPeriodo: TwwDBLookupCombo;
    Label4: TLabel;
    edtEntidade: TEdit;
    Label1: TLabel;
    edtPlanoContas: TDBRealEdit;
    Label2: TLabel;
    rgTotalizacao: TRadioGroup;
    ProcuraDir: TProcuraDirDlg;
    Label6: TLabel;
    edtPath: TEdit;
    btnSelecionar: TBitBtn;
    pgbStatus: TProgressBar;
    sqlPlanoPrevG: TCMSqlParams;
    cdsPlanoPrevG: TwwClientDataSet;
    dsPatroG: TwwDataSource;
    dsPlanoPrevG: TwwDataSource;
    cdsPatroG: TwwClientDataSet;
    sqlPatroG: TCMSqlParams;
    Label5: TLabel;
    Label7: TLabel;
    SqlBalancete: TCMSqlParams;
    sqlPorPlano: TCMSqlParams;
    pnlGrids: TPanel;
    dbgrPlanoPrev: TwwDBGrid;
    dbgrPatro: TwwDBGrid;
    cdsPeriodo: TCMClientDataSet;
    cdsEntidade: TCMClientDataSet;
    edtPlanoBenef: TDBRealEdit;
    cdsBalancete: TCMClientDataSet;
    SqlEntidade: TCMSqlParams;
    procedure bbtnConfirmarClick(Sender: TObject);
//    procedure Label7Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSelecionarClick(Sender: TObject);
    procedure ProcuraDirSelectionChanged(Sender: TObject; Wnd: HWND;
      Path: String; var ShowText: String; var OKButtonEnabled: Boolean);
    procedure rgTotalizacaoClick(Sender: TObject);
    procedure dblkExercicioCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);



  private
    { Private declarations }
    CtrlPeriodo        : TCtrlPeriodo;
    CtrlContab         : TCtrlContab;
    

   function  VerificaPreenchimento: Boolean;
   function  ExistePatroSelecionada: Boolean;

  public
    { Public declarations }
  end;




var
  FrmGeraArquivoSipcCap: TFrmGeraArquivoSipcCap;



implementation

{$R *.DFM}



procedure TFrmGeraArquivoSipcCap.bbtnConfirmarClick(Sender: TObject);
var
   i,iTamanho :integer;
   ArquivoTexto : TextFile;
   sNomeArquivo,sLinha,sCodigo,sEspacos,
   sPlanoPrevIn,sPatroIn,sCaminho,
   sCodSPCPlanoContas,sCodSPCPlanoBeneficios: string;




begin
   if VerificaPreenchimento then
   begin
      sNomeArquivo       := 'BALANCETE.TXT';
      sCaminho           := edtPath.Text;
      sCodSPCPlanoContas := FloatToStr(edtPlanoContas.Value);


      //=== Codigo da Entidade ===
      sCodigo := edtEntidade.Text;

      //======================================================================


      case rgTotalizacao.ItemIndex of

      // Consolidado
      0: begin
            sCodSPCPlanoBeneficios := '000';


            SqlBalancete.SQL.Clear;
            SqlBalancete.Prepare;
            SqlBalancete.SQL.Add('SELECT');
            SqlBalancete.SQL.Add('   /*+RULE*/');
            SqlBalancete.SQL.Add('   C.PLANO, C.PLACONTA, C.PLANATUREZA,');
            SqlBalancete.SQL.Add('   SUM(S.DEB) AS DEB,');
            SqlBalancete.SQL.Add('   SUM(S.CRED) AS CRED,');
            SqlBalancete.SQL.Add('   SUM(SA.SALDOANT) AS SALDOANT');
            SqlBalancete.SQL.Add('FROM');
            SqlBalancete.SQL.Add('   PLANOCONTA C,');
            SqlBalancete.SQL.Add('   (SELECT');
            SqlBalancete.SQL.Add('       PLACONTA,');
            SqlBalancete.SQL.Add('       SUM(NVL(PLSDEBITOCORRENTE,0)) AS DEB,');
            SqlBalancete.SQL.Add('       SUM(NVL(PLSCREDITOCOR,0)) AS CRED');
            SqlBalancete.SQL.Add('    FROM PLANOSALDO');

            SqlBalancete.SQL.Add('    WHERE (PLANO        = ' + IntToStr(CtrlContab.PlanoParam)  + ') AND ');
            SqlBalancete.SQL.Add('          (PEREXERCICIO = ' + dblkExercicio.LookupValue        + ')  AND');
            SqlBalancete.SQL.Add('          (PERNUMERO    = ' + dblkPeriodo.LookupValue          + ')  AND');
            SqlBalancete.SQL.Add('          (IDPESSOA     = ' + IntToStr(Sistema.IdEmpresa)      + ')');


            SqlBalancete.SQL.Add('    GROUP BY PLACONTA) S,');
            SqlBalancete.SQL.Add('   (SELECT');
            SqlBalancete.SQL.Add('       PLACONTA, SUM(NVL(PLSDEBITOCORRENTE, 0) - NVL(PLSCREDITOCOR, 0)) AS SALDOANT');
            SqlBalancete.SQL.Add('    FROM PLANOSALDO');


            SqlBalancete.SQL.Add('    WHERE (PLANO        = ' + IntToStr(CtrlContab.PlanoParam)  + ') AND ');
            SqlBalancete.SQL.Add('          (PEREXERCICIO = ' + dblkExercicio.LookupValue        + ')  AND');
            SqlBalancete.SQL.Add('          ((PERNUMERO   < ' + dblkPeriodo.LookupValue + ') OR (PERNUMERO IS NULL))  AND');
            SqlBalancete.SQL.Add('          (IDPESSOA     = ' + IntToStr(Sistema.IdEmpresa)      + ')');
            SqlBalancete.SQL.Add('    GROUP BY PLACONTA ) SA');
            SqlBalancete.SQL.Add('WHERE');
            SqlBalancete.SQL.Add('    (S.PLACONTA(+) = C.PLACONTA) AND');
            SqlBalancete.SQL.Add('    (SA.PLACONTA(+) = C.PLACONTA) AND');
            SqlBalancete.SQL.Add('    (C.PLASECRETARIA = ''S'') AND');
            SqlBalancete.SQL.Add('    (C.PLANO = '+  IntToStr(CtrlContab.PlanoParam) +') AND');

            SqlBalancete.SQL.Add('    ((S.DEB <> 0) OR (S.CRED <> 0) OR (SA.SALDOANT <> 0))');
            SqlBalancete.SQL.Add('GROUP BY C.PLANO, C.PLACONTA, C.PLANATUREZA');
            SqlBalancete.SQL.Add('ORDER BY PLACONTA');
            SqlBalancete.Open;

         end;

            


      // Plano de benefícios
      1: begin
            sPlanoPrevIn := '';
            sPatroIn     := '';
            sCodSPCPlanoBeneficios := FloatToStr(edtPlanoBenef.Value);


            //  Varre o cds cdsPlanoPrevG
            cdsPlanoPrevG.DisableControls;
            cdsPlanoPrevG.First;

            while not cdsPlanoPrevG.Eof do
            begin
               if (cdsPlanoPrevG.FieldByName('MARCA').AsString = 'S') then
               begin
                  sPlanoPrevIn := sPlanoPrevIn + cdsPlanoPrevG.FieldByName('IDPLANOPREV').AsString;
                  cdsPlanoPrevG.Next;
                  if not ((cdsPlanoPrevG.Eof) or (cdsPlanoPrevG.FieldByName('MARCA').AsString = 'N')) then
                     sPlanoPrevIn := sPlanoPrevIn + ',';
               end
               else
                  cdsPlanoPrevG.Next;

            end;
            cdsPlanoPrevG.EnableControls;




            //  Varre o cds sqlPatroG
            cdsPatroG.DisableControls;
            cdsPatroG.First;

            while not cdsPatroG.Eof do
            begin
               if (cdsPatroG.FieldByName('MARCA').AsString = 'S') then
                 sPatroIn := sPatroIn + cdsPatroG.FieldByName('IDPESSOA').AsString;

               cdsPatroG.Next;
               if ((sPatroIn <> '') and (cdsPatroG.FieldByName('MARCA').AsString = 'S') and (not cdsPatroG.Eof)) then
                  sPatroIn := sPatroIn + ',';

               
            end;
            cdsPatroG.EnableControls;


           {SqlBalancete.SQL.Clear;
            SqlBalancete.Prepare;
            SqlBalancete.SQL.Add('SELECT');
            SqlBalancete.SQL.Add('  /*+RULE*/');
            SqlBalancete.SQL.Add('  PLANO.PLANO, PLANO.PLACONTA, PLANO.PLANATUREZA,');
            SqlBalancete.SQL.Add('  SUM(S.DEB) AS DEB,');
            SqlBalancete.SQL.Add('  SUM(S.CRED) AS CRED,');
            SqlBalancete.SQL.Add('  SUM(SA.SALDOANT) AS SALDOANT');
            SqlBalancete.SQL.Add('FROM');
            SqlBalancete.SQL.Add('  (SELECT C.PLANO, C.PLACONTA, C.PLANATUREZA, PPC.IDPLANOPREV, PPC.IDPATRO');
            SqlBalancete.SQL.Add('   FROM PLANOCONTA C, PLANPREVCONTABPATRO PPC');
            SqlBalancete.SQL.Add('   WHERE (C.PLANO = '+ IntToStr(CtrlContab.PlanoParam) +') AND (C.PLASECRETARIA = ''S''))  PLANO,');
            SqlBalancete.SQL.Add('  (SELECT');
            SqlBalancete.SQL.Add('      IDPLANOPREV,');
            SqlBalancete.SQL.Add('      IDPATRO,');
            SqlBalancete.SQL.Add('      PLACONTA,');
            SqlBalancete.SQL.Add('      SUM(NVL(PLSDEBITOCORRENTE,0)) AS DEB,');
            SqlBalancete.SQL.Add('      SUM(NVL(PLSCREDITOCOR,0)) AS CRED');
            SqlBalancete.SQL.Add('   FROM PLANOSALDO');


            SqlBalancete.SQL.Add('   WHERE (PEREXERCICIO = ' + dblkExercicio.LookupValue        + ')  AND');
            SqlBalancete.SQL.Add('         (PERNUMERO    = ' + dblkPeriodo.LookupValue          + ')  AND');
            SqlBalancete.SQL.Add('         (IDPESSOA     = ' + IntToStr(Sistema.IdEmpresa)      + ')  AND');
            SqlBalancete.SQL.Add('         (IDPATRO IN ('    + sPatroIn     + '))');


            if sPlanoPrevIn <> '' then
            SqlBalancete.SQL.Add('   AND   (IDPLANOPREV   IN ('    + sPlanoPrevIn + '))');


            SqlBalancete.SQL.Add('   GROUP BY PLACONTA, IDPLANOPREV, IDPATRO) S,');
            SqlBalancete.SQL.Add('  (SELECT');
            SqlBalancete.SQL.Add('      IDPLANOPREV,IDPATRO,');
            SqlBalancete.SQL.Add('      PLACONTA, DECODE(SIGN(SUM(NVL(PLSDEBITOCORRENTE,0) - NVL(PLSCREDITOCOR,0))),-1,');
            SqlBalancete.SQL.Add('                            SUM(NVL(PLSCREDITOCOR,0)     - NVL(PLSDEBITOCORRENTE,0)),');
            SqlBalancete.SQL.Add('                            SUM(NVL(PLSDEBITOCORRENTE,0) - NVL(PLSCREDITOCOR,0))) AS SALDOANT');




            SqlBalancete.SQL.Add('   FROM PLANOSALDO');



            SqlBalancete.SQL.Add('   WHERE (PEREXERCICIO = ' + dblkExercicio.LookupValue  + ')  AND');

            if ((StrToInt(dblkPeriodo.LookupValue) - 1) = 0) then
               SqlBalancete.SQL.Add('      (PERNUMERO IS NULL) AND')
            else
               SqlBalancete.SQL.Add('      (PERNUMERO    = ' + IntToStr(StrToInt(dblkPeriodo.LookupValue) - 1)    + ')  AND');



            SqlBalancete.SQL.Add('         (IDPESSOA     = ' + IntToStr(Sistema.IdEmpresa)+ ')  AND');
            SqlBalancete.SQL.Add('         (IDPATRO IN ('    + sPatroIn     + '))');


            if sPlanoPrevIn <> '' then
            SqlBalancete.SQL.Add('   AND   (IDPLANOPREV   IN ('    + sPlanoPrevIn + '))');




            SqlBalancete.SQL.Add('   GROUP BY PLACONTA, IDPLANOPREV, IDPATRO ) SA');
            SqlBalancete.SQL.Add('WHERE');
            SqlBalancete.SQL.Add('   (PLANO.PLACONTA        = S.PLACONTA(+))');
            SqlBalancete.SQL.Add('   AND (PLANO.IDPLANOPREV = S.IDPLANOPREV(+))');
            SqlBalancete.SQL.Add('   AND (PLANO.IDPATRO     = S.IDPATRO(+))');
            SqlBalancete.SQL.Add('   AND (PLANO.PLACONTA    = SA.PLACONTA(+))');
            SqlBalancete.SQL.Add('   AND (PLANO.IDPLANOPREV = SA.IDPLANOPREV(+))');
            SqlBalancete.SQL.Add('   AND (PLANO.IDPATRO     = SA.IDPATRO(+))');
            SqlBalancete.SQL.Add('   AND ((S.DEB <> 0) OR (S.CRED <> 0) OR (SA.SALDOANT <> 0))');
            SqlBalancete.SQL.Add('GROUP BY PLANO.PLANO, PLANO.PLACONTA, PLANO.PLANATUREZA');
            SqlBalancete.SQL.Add('ORDER BY PLACONTA');}



            SqlBalancete.SQL.Clear;
            SqlBalancete.Prepare;
            SqlBalancete.SQL.Add('SELECT');
            SqlBalancete.SQL.Add('  /*+RULE*/');
            SqlBalancete.SQL.Add('  PLANO.PLANO, PLANO.PLACONTA, PLANO.PLANATUREZA,');
            SqlBalancete.SQL.Add('  SUM(S.DEB) AS DEB,');
            SqlBalancete.SQL.Add('  SUM(S.CRED) AS CRED,');
            SqlBalancete.SQL.Add('  SUM(SA.SALDOANT) AS SALDOANT');
            SqlBalancete.SQL.Add('FROM');
            SqlBalancete.SQL.Add('  (SELECT C.PLANO, C.PLACONTA, C.PLANATUREZA, PT.IDPESSOA AS IDPATRO');
            SqlBalancete.SQL.Add('   FROM PLANOCONTA C, PATRO PT');
            SqlBalancete.SQL.Add('   WHERE (C.PLANO = '+ IntToStr(CtrlContab.PlanoParam) +') AND (C.PLASECRETARIA = ''S'')');

            SqlBalancete.SQL.Add('  AND (PT.IDPESSOA IN (' + sPatroIn + '))) PLANO,');

            SqlBalancete.SQL.Add('  (SELECT');
            SqlBalancete.SQL.Add('      IDPATRO,');
            SqlBalancete.SQL.Add('      PLACONTA,');
            SqlBalancete.SQL.Add('      SUM(NVL(PLSDEBITOCORRENTE,0)) AS DEB,');
            SqlBalancete.SQL.Add('      SUM(NVL(PLSCREDITOCOR,0)) AS CRED');
            SqlBalancete.SQL.Add('   FROM PLANOSALDO');


            SqlBalancete.SQL.Add('   WHERE (PEREXERCICIO = ' + dblkExercicio.LookupValue        + ')  AND');
            SqlBalancete.SQL.Add('         (PERNUMERO    = ' + dblkPeriodo.LookupValue          + ')  AND');
            SqlBalancete.SQL.Add('         (IDPESSOA     = ' + IntToStr(Sistema.IdEmpresa)      + ')  AND');
            SqlBalancete.SQL.Add('         (IDPATRO IN ('    + sPatroIn     + '))');


            if sPlanoPrevIn <> '' then
            SqlBalancete.SQL.Add('   AND   (IDPLANOPREV   IN ('    + sPlanoPrevIn + '))');


            SqlBalancete.SQL.Add('   GROUP BY PLACONTA,IDPATRO) S,');
            SqlBalancete.SQL.Add('  (SELECT');
            SqlBalancete.SQL.Add('      IDPATRO,');
            SqlBalancete.SQL.Add('      PLACONTA,');
            SqlBalancete.SQL.Add('      SUM(NVL(PLSDEBITOCORRENTE,0) - NVL(PLSCREDITOCOR,0)) AS SALDOANT');  

            SqlBalancete.SQL.Add('   FROM PLANOSALDO');


            SqlBalancete.SQL.Add('   WHERE (PEREXERCICIO = ' + dblkExercicio.LookupValue  + ')  AND');

            SqlBalancete.SQL.Add('         ((PERNUMERO IS NULL) OR (PERNUMERO < '+ dblkPeriodo.LookupValue +')) AND');
            SqlBalancete.SQL.Add('         (PLANO        = ' + IntToStr(CtrlContab.PlanoParam) + ')  AND');
            SqlBalancete.SQL.Add('         (IDPESSOA     = ' + IntToStr(Sistema.IdEmpresa)+ ')  AND');
            SqlBalancete.SQL.Add('         (IDPATRO IN ('    + sPatroIn     + '))');


            if sPlanoPrevIn <> '' then
            SqlBalancete.SQL.Add('   AND   (IDPLANOPREV   IN ('    + sPlanoPrevIn + '))');



            SqlBalancete.SQL.Add('   GROUP BY PLACONTA,IDPATRO) SA');
            SqlBalancete.SQL.Add('WHERE');
            SqlBalancete.SQL.Add('       (PLANO.PLACONTA    = S.PLACONTA(+))');
            SqlBalancete.SQL.Add('   AND (PLANO.IDPATRO     = S.IDPATRO(+))');
            SqlBalancete.SQL.Add('   AND (PLANO.IDPATRO     = SA.IDPATRO(+))');
            SqlBalancete.SQL.Add('   AND (PLANO.PLACONTA    = SA.PLACONTA(+))');
            SqlBalancete.SQL.Add('   AND ((S.DEB <> 0) OR (S.CRED <> 0) OR (SA.SALDOANT <> 0))');
            SqlBalancete.SQL.Add('GROUP BY PLANO.PLANO, PLANO.PLACONTA, PLANO.PLANATUREZA');
            SqlBalancete.SQL.Add('ORDER BY PLACONTA');




    







            SqlBalancete.Open;

         end;
      end;


      If  cdsBalancete.IsEmpty then
      begin
        MsgDlg('Não Existe Saldo para Este Exercício e Período.',Sistema.NomeAplicativo,mtWarning,[mbOK],0);
        Exit;
      end;

      iTamanho := cdsBalancete.RecordCount;
      cdsBalancete.First;


      //Cria Um Novo Arquivo ou Sobrescreve um já existente
      AssignFile(ArquivoTexto, sCaminho + '\' + sNomeArquivo);
      ReWrite(Arquivotexto);

      pgbStatus.Max := iTamanho;

      while not cdsBalancete.EOF do
      begin

         pgbStatus.Step := 1;

         sLinha := '';

         //Concatena o Código da Entidade (+5 brancos)
         sLinha := sLinha + sCodigo + stringOfChar(' ', 10 - length(sCodigo));

         //Concatena o COD SPC Plano BENEFICIOS
         sLinha := sLinha + sCodSPCPlanoBeneficios + stringOfChar(' ', 10 - length(sCodSPCPlanoBeneficios));

         //Concatena o COD SPC Plano CONTAS
         sLinha := sLinha + sCodSPCPlanoContas + StringOfChar(' ', 3 - length(sCodSPCPlanoContas));


         //Concatena a placonta (rubrica)
         // Alex 23/02/2005 18727, esta foi uma mudança que a SPC orientou a CBS sLinha := sLinha + _cdsSaldo.FieldByName('PLACONTA').AsString + stringOfChar(' ', 10 - length(_cdsSaldo.FieldByName('PLACONTA').AsString ));
         sLinha := sLinha + CtrlContab.ZE(copy(cdsBalancete.FieldByName('PLACONTA').AsString, 1, 8), 8) + '  ';


         //Concatena o Exercicio
         sLinha := sLinha + dblkExercicio.LookupValue;

         //Concatena o Período
         if length(dblkPeriodo.LookupValue) = 1 then begin
            sLinha := sLinha + '0' + dblkPeriodo.LookupValue;
         end else begin
            sLinha := sLinha + dblkPeriodo.LookupValue;
         end;

         //Concatena o Saldo Anterior
         sLinha := sLinha + FuncaoGeral.AD(FormatFloat('0.00', abs(cdsBalancete.FieldByName('SALDOANT').AsFloat)), 22);

         if cdsBalancete.FieldByName('SALDOANT').asFloat = 0 then begin
            if cdsBalancete.FieldByName('PLANATUREZA').asString = 'C' then begin
               sLinha := sLinha + 'CR';
            end else begin
               sLinha := sLinha + 'DV';
            end;
         end else begin
            if cdsBalancete.FieldByName('SALDOANT').asFloat < 0 then begin
               sLinha := sLinha + 'CR';
            end else begin
               sLinha := sLinha + 'DV';
            end;
         end;

         //Concatena o Débito e o Crédito
         sLinha := sLinha + FuncaoGeral.AD(FormatFloat('0.00', cdsBalancete.FieldByName('DEB').AsFloat), 22);
         sLinha := sLinha + FuncaoGeral.AD(FormatFloat('0.00', cdsBalancete.FieldByName('CRED').AsFloat), 22);


         //------------------------------------------------------------

         //Adiciona as linhas no arquivo texto
         WriteLn(ArquivoTexto, sLinha);

         cdsBalancete.Next;

      end;

      CloseFile(ArquivoTexto);
      MsgDlg('Arquivo gerado com sucesso!',Sistema.NomeAplicativo,mtInformation,[mbOK],0);
   end;
end;





procedure TFrmGeraArquivoSipcCap.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlPeriodo := TCtrlPeriodo.Create;
  CtrlPeriodo.InitializeAs(Padroes);

  CtrlContab  := TCtrlContab.Create;
  CtrlContab.InitializeAs(Padroes);


  If Not CtrlContab.SelecionaParametros(Sistema.IdEmpresa) Then
     MsgDlg(CtrlContab.MessageInfo,'Erro',MtError,[mbOk],0);  


  cdsExercicio.Data := CtrlPeriodo.ListExercicios(Sistema.idEmpresa,false);
  cdsPeriodo.Data   := CtrlPeriodo.ListPeriodo(Sistema.idEmpresa,tbpTodos,0,0);

  SqlEntidade.Prepare;
  SqlEntidade.ParamByName('IDEMPRESA').AsFloat := Sistema.IdEmpresa;
  SqlEntidade.Open;

  sqlPlanoPrevG.Prepare;
  sqlPatroG.Prepare;
  sqlPlanoPrevG.Open;
  sqlPatroG.Open;
  edtEntidade.text  := cdsEntidade.fieldbyName('CODFUNDSPC').asstring;
end;




procedure TFrmGeraArquivoSipcCap.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(CtrlPeriodo);
  FreeAndNil(CtrlContab);
end;




procedure TFrmGeraArquivoSipcCap.btnSelecionarClick(Sender: TObject);
begin
   inherited;
   ProcuraDir.Execute;
end;




procedure TFrmGeraArquivoSipcCap.ProcuraDirSelectionChanged(
  Sender: TObject; Wnd: HWND; Path: String; var ShowText: String;
  var OKButtonEnabled: Boolean);
begin
  inherited;
   edtPath.Text := Path;
end;




procedure TFrmGeraArquivoSipcCap.rgTotalizacaoClick(Sender: TObject);
begin
  inherited;

  if rgTotalizacao.ItemIndex = 0 then
    pnlGrids.Enabled := False
  else
    pnlGrids.Enabled := True;
end;




procedure TFrmGeraArquivoSipcCap.dblkExercicioCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if dblkExercicio.Text <> '' then
    cdsPeriodo.Data := CtrlPeriodo.ListPeriodo(Sistema.idEmpresa,tbpTodos,StrToInt(dblkExercicio.LookupValue),0)
  else
    cdsPeriodo.Close;

end;




function TFrmGeraArquivoSipcCap.VerificaPreenchimento: Boolean;
begin
   Result := False;

   if dblkExercicio.text = '' then
   begin
      MsgDlg('O Exercício deve ser preenchido.','Erro',mtError,[mbOk],0);
      Exit;
   end
   else

   if dblkPeriodo.text = '' then
   begin
      MsgDlg('O Período deve ser preenchido.','Erro',mtError,[mbOk],0);
      Exit;
   end
   else

   if edtEntidade.text = '' then
   begin
      MsgDlg('O Código da Entidade deve ser preenchido.','Erro',mtError,[mbOk],0);
      Exit;
   end
   else


   if edtPlanoContas.Value <= 0 then
   begin
      MsgDlg('O Código do Plano de Contas deve ser preenchido.','Erro',mtError,[mbOk],0);
      Exit;
   end
   else


   if ((rgTotalizacao.ItemIndex = 1) and (edtPlanoBenef.Value <= 0)) then
   begin
      MsgDlg('O Código do Plano de Benefícios deve ser preenchido.','Erro',mtError,[mbOk],0);
      Exit;
   end
   else

   if not ExistePatroSelecionada then
   begin
      MsgDlg('É necessário selecionar uma Patrocinadora para poder prosseguir.','Erro',mtError,[mbOk],0);
      Exit;
   end
   else




   if edtPath.text = '' then
   begin
      MsgDlg('O Caminho usado para a Gravação do Balancete deve ser Selecionado.','Erro',mtError,[mbOk],0);
      btnSelecionar.SetFocus;
      Exit;
   end
   else


   //=== vewrifica se o periodo esta encerrado neste exercicio ====
   If Not CtrlPeriodo.VerificaPeriodoBloqueado(Sistema.idEmpresa,tbBloqueado,StrToInt(dblkPeriodo.LookupValue),StrToInt(dblkExercicio.LookupValue),True) Then
   Begin
     MsgDlg('Existem Períodos  Não encerrados Neste Exercicio.','Aviso', mtWarning,[mbOk],0);
     Exit;
   End
   else
      Result := True;

end;




function TFrmGeraArquivoSipcCap.ExistePatroSelecionada: Boolean;
begin
  Result := False;

  if rgTotalizacao.ItemIndex = 1 then
  begin
     cdsPatroG.DisableControls;
     cdsPatroG.First;

     while not cdsPatroG.Eof do
     begin
        if (cdsPatroG.FieldByName('MARCA').AsString = 'S') then
          Result := True;
        cdsPatroG.Next;
     end;
     cdsPatroG.EnableControls;
  end
  else
     Result := true;   


end;

end.
