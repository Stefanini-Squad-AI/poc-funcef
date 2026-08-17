unit fMTUtilExpDadosparaReaval;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Halcn6DB, Db, DBTables, Wwquery, BfDialogs,
  BrowseFolder, uProcuraDir, wwdbdatetimepicker, CMDateTimePicker, Gauges,
  uCmSqlParams, DBClient, uCMClientDataSet,
  uCMTypes, uCtrlPadroes, uCtrlParamCAF, uCtrlFechamento, uCtrlBem,
  IvEMulti;

type
  TfrmMTUtilExpDadosparaReaval = class(TfrmOkCancelar)
    pnlStatus: TPanel;
    lblStatus: TLabel;
    pnlprgBar: TPanel;
    prgBar: TGauge;
    Label1: TLabel;
    eDtaFim: TCMDateTimePicker;
    edSelPasta: TEdit;
    Label7: TLabel;
    bbtnSelPasta: TBitBtn;
    cdsCadBens: TCMClientDataSet;
    sqlCadBens: TCMSqlParams;
    cdsSaldoContabil: TCMClientDataSet;
    sqlSaldoContabil: TCMSqlParams;
    cdsEmpresas: TCMClientDataSet;
    sqlEmpresas: TCMSqlParams;
    cdsGrupoContabil: TCMClientDataSet;
    sqlGrupoContabil: TCMSqlParams;
    cdsCentroCusto: TCMClientDataSet;
    sqlCentroCusto: TCMSqlParams;
    sqlCadReaval: TCMSqlParams;
    cdsSaldoReaval: TCMClientDataSet;
    sqlSaldoReaval: TCMSqlParams;
    cdsLocalizacao: TCMClientDataSet;
    sqlLocalizacao: TCMSqlParams;
    pDirTrabalho: TProcuraDirDlg;
    procedure bbtnSelPastaClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    ParamCAF   : TCtrlParamCAF;
    Bem        : TCtrlBem;
    Fechamento : TCtrlFechamento;
    function CompletaB(sCampo : String; iTam : Integer) : String;
    function CompletaZ(sCampo : String; iTam : Integer) : String;
    function RemCharInvalid(sCampo : String) : String;
  public
    { Public declarations }
  end;

var
  frmMTUtilExpDadosparaReaval: TfrmMTUtilExpDadosparaReaval;

implementation

{$R *.DFM}

uses uMensErro, uSistema;

procedure TfrmMTUtilExpDadosparaReaval.FormCreate(Sender: TObject);
begin
   inherited;
   ParamCAF := TCtrlParamCAF.Create;
   ParamCAF.InitializeAs(Padroes);
   if not ParamCAF.CarregaProp(Sistema.IdEmpresa) then
      Raise Exception.Create('Parâmetros do sistema inválidos!');
   //-------------------------------------------------------------------------------------
   Bem := TCtrlBem.Create;
   Bem.InitializeAs(Padroes);
   //-------------------------------------------------------------------------------------
   Fechamento := TCtrlFechamento.Create;
   Fechamento.InitializeAs(Padroes);
   //-------------------------------------------------------------------------------------
   eDtaFim.Date := Fechamento.UltimaDataFechamento(Sistema.IdEmpresa, 0, 1);
end;
//========================================================================================
procedure TfrmMTUtilExpDadosparaReaval.bbtnSelPastaClick(Sender: TObject);
begin
   inherited;
   pDirTrabalho.ShowPath := False;
   pDirTrabalho.Caption := 'Pasta de Trabalho';
   pDirTrabalho.Execute;
   edSelPasta.Text := pDirTrabalho.Directory;
end;
//========================================================================================
procedure TfrmMTUtilExpDadosparaReaval.bbtnConfirmarClick(Sender: TObject);
var
   sLinha     : String;
   aTexto     : TextFile;
   cSeparador : Char;
   fCotacao   : Extended;
   iNumDecimais, iFlgArredonda : Integer;
   
begin
   inherited;
   //-------------------------------------------------------------------------------------
   if edSelPasta.Text = '' then
   begin
      MsgDlg('Selecione a pasta onde será criado o texto!','Erro',mtError,[mbOk],0);
      bbtnSelPasta.SetFocus;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   if eDtaFim.Text = '' then
   begin
      MsgDlg('Data Final do período não pode estar vazia !','Erro',mtError,[mbOk],0);
      eDtaFim.SetFocus;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   try
      lblStatus.Caption := 'Preparando Dados, Aguarde...';
      prgBar.MaxValue := 1;
      prgBar.Progress := 0;
      pnlStatus.Visible := True;
      Application.ProcessMessages;
      //----------------------------------------------------------------------------------
      // Processamento dos Bens do Ativo
      //----------------------------------------------------------------------------------
      AssignFile(aTexto , trim(edSelPasta.Text) + '\Bens_Ativo.TXT');
      Rewrite(aTexto);
      //----------------------------------------------------------------------------------
      sqlCadBens.Prepare;
      sqlCadBens.ParamByName('DATAMOVFIM').AsDateTime := eDtaFim.Date;
      sqlCadBens.Open;
      //----------------------------------------------------------------------------------
      // Preenche os campos com os valores contábeis
      //----------------------------------------------------------------------------------
      prgBar.MaxValue := cdsCadBens.RecordCount;
      while not cdsCadBens.EOF do
      begin
         lblStatus.Caption := 'Gerando Arquivo com Bens do Ativo (1)...';
         prgBar.Progress := prgBar.Progress + 1;
         Application.ProcessMessages;
         //-------------------------------------------------------------------------------
         cdsCadBens.Edit;
         //-------------------------------------------------------------------------------
         // Processa Moeda Oficial
         //-------------------------------------------------------------------------------
         sqlSaldoContabil.Prepare;
         sqlSaldoContabil.ParamByName('IDPESSOA').AsFloat    := cdsCadBens.FieldByName('IDPESSOA').AsFloat;
         sqlSaldoContabil.ParamByName('IDBEM').AsFloat       := cdsCadBens.FieldByName('IDBEM').AsFloat;
         sqlSaldoContabil.ParamByName('MOECODIGO').AsInteger := ParamCAF.MOEDAOFICIAL;
         sqlSaldoContabil.ParamByName('IDTAXADEP').AsInteger := 1;              // Brasil
         sqlSaldoContabil.ParamByName('DATASLD').AsDateTime  := eDtaFim.Date;
         sqlSaldoContabil.Open;
         //-------------------------------------------------------------------------------
         cdsCadBens.FieldByName('TAXADEP').AsFloat := cdsSaldoContabil.FieldByName('TAXADEP').AsFloat;
         cdsCadBens.FieldByName('VALORG').AsFloat  := cdsSaldoContabil.FieldByName('VALORG').AsFloat + cdsSaldoContabil.FieldByName('CMBEM').AsFloat;
         cdsCadBens.FieldByName('DEPLANC').AsFloat := cdsSaldoContabil.FieldByName('DEPLANC').AsFloat + cdsSaldoContabil.FieldByName('CMDEP').AsFloat;
         //-------------------------------------------------------------------------------
         // Processa Moeda Fiscal, se existir
         //-------------------------------------------------------------------------------
         if ParamCAF.MOEDAFISCAL > 0 then
         begin
            sqlSaldoContabil.Prepare;
            sqlSaldoContabil.ParamByName('IDPESSOA').AsFloat    := cdsCadBens.FieldByName('IDPESSOA').AsFloat;
            sqlSaldoContabil.ParamByName('IDBEM').AsFloat       := cdsCadBens.FieldByName('IDBEM').AsFloat;
            sqlSaldoContabil.ParamByName('MOECODIGO').AsInteger := ParamCAF.MOEDAFISCAL;
            sqlSaldoContabil.ParamByName('IDTAXADEP').AsInteger := 1;              // Brasil
            sqlSaldoContabil.ParamByName('DATASLD').AsDateTime  := eDtaFim.Date;
            sqlSaldoContabil.Open;
            //----------------------------------------------------------------------------
            fCotacao := Bem.CotacaoMoeda(ParamCAF.MOEDAFISCAL, cdsCadBens.FieldByName('DTAINCLUSAO').AsDateTime, iNumDecimais, iFlgArredonda);
            //----------------------------------------------------------------------------
            cdsCadBens.FieldByName('VALFIS').AsFloat  := cdsSaldoContabil.FieldByName('VALORG').AsFloat;
            cdsCadBens.FieldByName('DEPFIS').AsFloat := cdsSaldoContabil.FieldByName('DEPLANC').AsFloat;
            cdsCadBens.FieldByName('VALUFIRAQUIS').AsFloat := fCotacao;
         end;
         //-------------------------------------------------------------------------------
         // Processa Moeda Alternativa 1, se existir
         //-------------------------------------------------------------------------------
         if ParamCAF.MOEDAGERENCIAL > 0 then
         begin
            sqlSaldoContabil.Prepare;
            sqlSaldoContabil.ParamByName('IDPESSOA').AsFloat    := cdsCadBens.FieldByName('IDPESSOA').AsFloat;
            sqlSaldoContabil.ParamByName('IDBEM').AsFloat       := cdsCadBens.FieldByName('IDBEM').AsFloat;
            sqlSaldoContabil.ParamByName('MOECODIGO').AsInteger := ParamCAF.MOEDAGERENCIAL;
            sqlSaldoContabil.ParamByName('IDTAXADEP').AsInteger := 1;              // Brasil
            sqlSaldoContabil.ParamByName('DATASLD').AsDateTime  := eDtaFim.Date;
            sqlSaldoContabil.Open;
            //----------------------------------------------------------------------------
            fCotacao := Bem.CotacaoMoeda(ParamCAF.MOEDAGERENCIAL, cdsCadBens.FieldByName('DTAINCLUSAO').AsDateTime, iNumDecimais, iFlgArredonda);
            //----------------------------------------------------------------------------
            cdsCadBens.FieldByName('TAXADEPMOEGER1').AsFloat := cdsSaldoContabil.FieldByName('TAXADEP').AsFloat;
            cdsCadBens.FieldByName('VALGER1').AsFloat        := cdsSaldoContabil.FieldByName('VALORG').AsFloat;
            cdsCadBens.FieldByName('DEPGER1').AsFloat        := cdsSaldoContabil.FieldByName('DEPLANC').AsFloat;
            cdsCadBens.FieldByName('VALGER1AQUIS').AsFloat   := fCotacao;
         end;
         //-------------------------------------------------------------------------------
         // Processa Moeda Alternativa 2, se existir
         //-------------------------------------------------------------------------------
         if ParamCAF.MOEDAGERENCIALB > 0 then
         begin
            sqlSaldoContabil.Prepare;
            sqlSaldoContabil.ParamByName('IDPESSOA').AsFloat    := cdsCadBens.FieldByName('IDPESSOA').AsFloat;
            sqlSaldoContabil.ParamByName('IDBEM').AsFloat       := cdsCadBens.FieldByName('IDBEM').AsFloat;
            sqlSaldoContabil.ParamByName('MOECODIGO').AsInteger := ParamCAF.MOEDAGERENCIALB;
            sqlSaldoContabil.ParamByName('IDTAXADEP').AsInteger := 1;              // Brasil
            sqlSaldoContabil.ParamByName('DATASLD').AsDateTime  := eDtaFim.Date;
            sqlSaldoContabil.Open;
            //----------------------------------------------------------------------------
            fCotacao := Bem.CotacaoMoeda(ParamCAF.MOEDAGERENCIALB, cdsCadBens.FieldByName('DTAINCLUSAO').AsDateTime, iNumDecimais, iFlgArredonda);
            //----------------------------------------------------------------------------
            cdsCadBens.FieldByName('TAXADEPMOEGER2').AsFloat := cdsSaldoContabil.FieldByName('TAXADEP').AsFloat;
            cdsCadBens.FieldByName('VALGER2').AsFloat        := cdsSaldoContabil.FieldByName('VALORG').AsFloat;
            cdsCadBens.FieldByName('DEPGER2').AsFloat        := cdsSaldoContabil.FieldByName('DEPLANC').AsFloat;
            cdsCadBens.FieldByName('VALGER2AQUIS').AsFloat   := fCotacao;
         end;
         //-------------------------------------------------------------------------------
         if cdsCadBens.FieldByName('DATABAIXA').IsNull then
            cdsCadBens.FieldByName('BAIXADO').AsInteger := 0
         else
            cdsCadBens.FieldByName('BAIXADO').AsInteger := 1;
         //-------------------------------------------------------------------------------
         cdsCadBens.Post;
         cdsCadBens.Next;
      end;
      //----------------------------------------------------------------------------------
      // Preenche os campos com os valores contábeis
      //----------------------------------------------------------------------------------
      cSeparador       := DecimalSeparator;
      DecimalSeparator := '.';
      //----------------------------------------------------------------------------------
      prgBar.MaxValue := cdsCadBens.RecordCount;
      cdsCadBens.First;
      while not cdsCadBens.EOF do
      begin
         lblStatus.Caption := 'Gerando Arquivo com Bens do Ativo (2)...';
         prgBar.Progress := prgBar.Progress + 1;
         Application.ProcessMessages;
         //-------------------------------------------------------------------------------
         sLinha := '';
         sLinha := sLinha + CompletaZ(cdsCadBens.FieldByName('IDPESSOA').AsString                             ,  8);
         sLinha := sLinha + CompletaZ(cdsCadBens.FieldByName('IDFILIALARQ').AsString                          ,  3);
         sLinha := sLinha + CompletaZ(cdsCadBens.FieldByName('IDBEM').AsString                                ,  6);
         sLinha := sLinha + CompletaZ(cdsCadBens.FieldByName('AGREGADO').AsString                             ,  4);
         sLinha := sLinha + CompletaZ(cdsCadBens.FieldByName('PLACA').AsString                                , 13);
         sLinha := sLinha + CompletaZ(cdsCadBens.FieldByName('TIPODEBEM').AsString                            ,  2);
         sLinha := sLinha + CompletaZ(cdsCadBens.FieldByName('IDGRUPO').AsString                              ,  8);
         sLinha := sLinha + CompletaZ(cdsCadBens.FieldByName('CODCENTROCUSTO').AsString                       ,  6);
         sLinha := sLinha + CompletaZ(cdsCadBens.FieldByName('IDLOCALIZACAO').AsString                        ,  8);
         sLinha := sLinha + CompletaZ(cdsCadBens.FieldByName('AREADERISCO').AsString                          ,  6);
         sLinha := sLinha + CompletaZ(cdsCadBens.FieldByName('IDCLASSEBEM').AsString                          ,  4);
         sLinha := sLinha + CompletaB(cdsCadBens.FieldByName('DESBEM').AsString                               ,200);
         sLinha := sLinha + CompletaB(cdsCadBens.FieldByName('IDNOTA').AsString                               , 10);
         sLinha := sLinha + CompletaZ(cdsCadBens.FieldByName('IDFORNSERV').AsString                           ,  6);
         sLinha := sLinha + FormatDateTime('dd/mm/yyyy',cdsCadBens.FieldByName('DTACONTAB').AsDateTime);
         sLinha := sLinha + FormatDateTime('dd/mm/yyyy',cdsCadBens.FieldByName('DTAINCLUSAO').AsDateTime);
         sLinha := sLinha + FormatDateTime('dd/mm/yyyy',cdsCadBens.FieldByName('DATAINICIODEP').AsDateTime);
         sLinha := sLinha + '00/00/0000';
         sLinha := sLinha + CompletaZ(FormatFloat('#0.00',cdsCadBens.FieldByName('TAXADEP').AsFloat)          ,  6);
         sLinha := sLinha + CompletaZ(FormatFloat('#0.00',cdsCadBens.FieldByName('TAXADEPMOEGER1').AsFloat)   ,  6);
         sLinha := sLinha + CompletaZ(FormatFloat('#0.00',cdsCadBens.FieldByName('TAXADEPMOEGER2').AsFloat)   ,  6);
         sLinha := sLinha + CompletaZ(FormatFloat('#0.00',cdsCadBens.FieldByName('VALHISTORICO').AsFloat)     , 16);
         sLinha := sLinha + CompletaZ(FormatFloat('#0.00',cdsCadBens.FieldByName('VALORG').AsFloat)           , 16);
         sLinha := sLinha + CompletaZ(FormatFloat('#0.00',cdsCadBens.FieldByName('DEPLANC').AsFloat)          , 16);
         sLinha := sLinha + CompletaZ(FormatFloat('#0.0000',cdsCadBens.FieldByName('VALFIS').AsFloat)         , 18);
         sLinha := sLinha + CompletaZ(FormatFloat('#0.0000',cdsCadBens.FieldByName('DEPFIS').AsFloat)         , 18);
         sLinha := sLinha + CompletaZ(FormatFloat('#0.0000',cdsCadBens.FieldByName('VALUFIRAQUIS').AsFloat)   , 14);
         sLinha := sLinha + CompletaZ(FormatFloat('#0.0000',cdsCadBens.FieldByName('VALGER1').AsFloat)        , 18);
         sLinha := sLinha + CompletaZ(FormatFloat('#0.0000',cdsCadBens.FieldByName('DEPGER1').AsFloat)        , 18);
         sLinha := sLinha + CompletaZ(FormatFloat('#0.0000',cdsCadBens.FieldByName('VALGER1AQUIS').AsFloat)   , 14);
         sLinha := sLinha + CompletaZ(FormatFloat('#0.0000',cdsCadBens.FieldByName('VALGER2').AsFloat)        , 18);
         sLinha := sLinha + CompletaZ(FormatFloat('#0.0000',cdsCadBens.FieldByName('DEPGER2').AsFloat)        , 18);
         sLinha := sLinha + CompletaZ(FormatFloat('#0.0000',cdsCadBens.FieldByName('VALGER2AQUIS').AsFloat)   , 14);
         sLinha := sLinha + CompletaZ(cdsCadBens.FieldByName('BAIXADO').AsString                              ,  1);
         if cdsCadBens.FieldByName('BAIXADO').AsInteger = 0 then
            sLinha := sLinha + '00/00/0000'
         else
            sLinha := sLinha + FormatDateTime('dd/mm/yyyy',cdsCadBens.FieldByName('DATABAIXA').AsDateTime);
         sLinha := sLinha + CompletaZ(FormatFloat('#0.00',cdsCadBens.FieldByName('ICMSBEM').AsFloat)          , 16);
         Writeln(aTexto,trim(sLinha));
         //-------------------------------------------------------------------------------
         cdsCadBens.Next;
      end;
      //----------------------------------------------------------------------------------
      DecimalSeparator := cSeparador;
      //----------------------------------------------------------------------------------
      CloseFile(aTexto);
      //----------------------------------------------------------------------------------
      // Processamento das Reavaliações dos Bens do Ativo
      //----------------------------------------------------------------------------------
      AssignFile(aTexto , trim(edSelPasta.Text) + '\Bens_Ativo_Reaval.TXT');
      Rewrite(aTexto);
      //----------------------------------------------------------------------------------
      cdsCadBens.Close;
      sqlCadReaval.Prepare;
      sqlCadReaval.ParamByName('DATAMOVFIM').AsDateTime := eDtaFim.Date;
      sqlCadReaval.Open;
      //----------------------------------------------------------------------------------
      // Preenche os campos com os valores contábeis
      //----------------------------------------------------------------------------------
      prgBar.MaxValue := cdsCadBens.RecordCount;
      while not cdsCadBens.EOF do
      begin
         lblStatus.Caption := 'Gerando Arquivo com Reaval. dos Bens (1)...';
         prgBar.Progress := prgBar.Progress + 1;
         Application.ProcessMessages;
         //-------------------------------------------------------------------------------
         cdsCadBens.Edit;
         //-------------------------------------------------------------------------------
         // Processa Moeda Oficial
         //-------------------------------------------------------------------------------
         sqlSaldoReaval.Prepare;
         sqlSaldoReaval.ParamByName('IDPESSOA').AsFloat      := cdsCadBens.FieldByName('IDPESSOA').AsFloat;
         sqlSaldoReaval.ParamByName('IDBEM').AsFloat         := cdsCadBens.FieldByName('IDBEM').AsFloat;
         sqlSaldoReaval.ParamByName('IDREAVALIACAO').AsFloat := cdsCadBens.FieldByName('IDREAVALIACAO').AsFloat;
         sqlSaldoReaval.ParamByName('MOECODIGO').AsInteger   := ParamCAF.MOEDAOFICIAL;
         sqlSaldoReaval.ParamByName('IDTAXADEP').AsInteger   := 1;              // Brasil
         sqlSaldoReaval.ParamByName('DATAMOVFIM').AsDateTime := eDtaFim.Date;
         sqlSaldoReaval.Open;
         //-------------------------------------------------------------------------------
         cdsCadBens.FieldByName('TAXADEP').AsFloat := cdsSaldoReaval.FieldByName('TAXADEP').AsFloat;
         cdsCadBens.FieldByName('VALORG').AsFloat  := cdsSaldoReaval.FieldByName('REAVCUSTO').AsFloat;
         cdsCadBens.FieldByName('DEPLANC').AsFloat := cdsSaldoReaval.FieldByName('REAVDEPACUM').AsFloat;
         //-------------------------------------------------------------------------------
         // Processa Moeda Fiscal, se existir
         //-------------------------------------------------------------------------------
         if ParamCAF.MOEDAFISCAL > 0 then
         begin
            sqlSaldoReaval.Prepare;
            sqlSaldoReaval.ParamByName('IDPESSOA').AsFloat    := cdsCadBens.FieldByName('IDPESSOA').AsFloat;
            sqlSaldoReaval.ParamByName('IDBEM').AsFloat       := cdsCadBens.FieldByName('IDBEM').AsFloat;
            sqlSaldoReaval.ParamByName('IDREAVALIACAO').AsFloat := cdsCadBens.FieldByName('IDREAVALIACAO').AsFloat;
            sqlSaldoReaval.ParamByName('MOECODIGO').AsInteger := ParamCAF.MOEDAFISCAL;
            sqlSaldoReaval.ParamByName('IDTAXADEP').AsInteger := 1;              // Brasil
            sqlSaldoReaval.ParamByName('DATAMOVFIM').AsDateTime  := eDtaFim.Date;
            sqlSaldoReaval.Open;
            //----------------------------------------------------------------------------
            fCotacao := Bem.CotacaoMoeda(ParamCAF.MOEDAFISCAL, cdsCadBens.FieldByName('DTAINCLUSAO').AsDateTime, iNumDecimais, iFlgArredonda);
            //----------------------------------------------------------------------------
            cdsCadBens.FieldByName('VALFIS').AsFloat := cdsSaldoReaval.FieldByName('REAVCUSTO').AsFloat;
            cdsCadBens.FieldByName('DEPFIS').AsFloat := cdsSaldoReaval.FieldByName('REAVDEPACUM').AsFloat;
            cdsCadBens.FieldByName('VALUFIRAQUIS').AsFloat := fCotacao;
         end;
         //-------------------------------------------------------------------------------
         // Processa Moeda Alternativa 1, se existir
         //-------------------------------------------------------------------------------
         if ParamCAF.MOEDAGERENCIAL > 0 then
         begin
            sqlSaldoReaval.Prepare;
            sqlSaldoReaval.ParamByName('IDPESSOA').AsFloat := cdsCadBens.FieldByName('IDPESSOA').AsFloat;
            sqlSaldoReaval.ParamByName('IDBEM').AsFloat := cdsCadBens.FieldByName('IDBEM').AsFloat;
            sqlSaldoReaval.ParamByName('IDREAVALIACAO').AsFloat := cdsCadBens.FieldByName('IDREAVALIACAO').AsFloat;
            sqlSaldoReaval.ParamByName('MOECODIGO').AsInteger := ParamCAF.MOEDAGERENCIAL;
            sqlSaldoReaval.ParamByName('IDTAXADEP').AsInteger := 1;              // Brasil
            sqlSaldoReaval.ParamByName('DATAMOVFIM').AsDateTime  := eDtaFim.Date;
            sqlSaldoReaval.Open;
            //----------------------------------------------------------------------------
            fCotacao := Bem.CotacaoMoeda(ParamCAF.MOEDAGERENCIAL, cdsCadBens.FieldByName('DTAINCLUSAO').AsDateTime, iNumDecimais, iFlgArredonda);
            //----------------------------------------------------------------------------
            cdsCadBens.FieldByName('TAXADEPMOEGER1').AsFloat := cdsSaldoReaval.FieldByName('TAXADEP').AsFloat;
            cdsCadBens.FieldByName('VALGER1').AsFloat        := cdsSaldoReaval.FieldByName('REAVCUSTO').AsFloat;
            cdsCadBens.FieldByName('DEPGER1').AsFloat        := cdsSaldoReaval.FieldByName('REAVDEPACUM').AsFloat;
            cdsCadBens.FieldByName('VALGER1AQUIS').AsFloat   := fCotacao;
         end;
         //-------------------------------------------------------------------------------
         // Processa Moeda Alternativa 2, se existir
         //-------------------------------------------------------------------------------
         if ParamCAF.MOEDAGERENCIALB > 0 then
         begin
            sqlSaldoReaval.Prepare;
            sqlSaldoReaval.ParamByName('IDPESSOA').AsFloat := cdsCadBens.FieldByName('IDPESSOA').AsFloat;
            sqlSaldoReaval.ParamByName('IDBEM').AsFloat := cdsCadBens.FieldByName('IDBEM').AsFloat;
            sqlSaldoReaval.ParamByName('IDREAVALIACAO').AsFloat := cdsCadBens.FieldByName('IDREAVALIACAO').AsFloat;
            sqlSaldoReaval.ParamByName('MOECODIGO').AsInteger := ParamCAF.MOEDAGERENCIALB;
            sqlSaldoReaval.ParamByName('IDTAXADEP').AsInteger := 1;              // Brasil
            sqlSaldoReaval.ParamByName('DATAMOVFIM').AsDateTime  := eDtaFim.Date;
            sqlSaldoReaval.Open;
            //----------------------------------------------------------------------------
            fCotacao := Bem.CotacaoMoeda(ParamCAF.MOEDAGERENCIALB, cdsCadBens.FieldByName('DTAINCLUSAO').AsDateTime, iNumDecimais, iFlgArredonda);
            //----------------------------------------------------------------------------
            cdsCadBens.FieldByName('TAXADEPMOEGER2').AsFloat := cdsSaldoReaval.FieldByName('TAXADEP').AsFloat;
            cdsCadBens.FieldByName('VALGER2').AsFloat        := cdsSaldoReaval.FieldByName('REAVCUSTO').AsFloat;
            cdsCadBens.FieldByName('DEPGER2').AsFloat        := cdsSaldoReaval.FieldByName('REAVDEPACUM').AsFloat;
            cdsCadBens.FieldByName('VALGER2AQUIS').AsFloat   := fCotacao;
         end;
         //-------------------------------------------------------------------------------
         if cdsCadBens.FieldByName('DATABAIXA').IsNull then
            cdsCadBens.FieldByName('BAIXADO').AsInteger := 0
         else
            cdsCadBens.FieldByName('BAIXADO').AsInteger := 1;
         //-------------------------------------------------------------------------------
         cdsCadBens.Post;
         cdsCadBens.Next;
      end;
      //----------------------------------------------------------------------------------
      // Preenche os campos com os valores contábeis
      //----------------------------------------------------------------------------------
      cSeparador       := DecimalSeparator;
      DecimalSeparator := '.';
      //----------------------------------------------------------------------------------
      prgBar.MaxValue := cdsCadBens.RecordCount;
      cdsCadBens.First;
      while not cdsCadBens.EOF do
      begin
         lblStatus.Caption := 'Gerando Arquivo com Reaval. dos Bens (2)...';
         prgBar.Progress := prgBar.Progress + 1;
         Application.ProcessMessages;
         //-------------------------------------------------------------------------------
         sLinha := '';
         sLinha := sLinha + CompletaZ(cdsCadBens.FieldByName('IDPESSOA').AsString                             ,  8);
         sLinha := sLinha + CompletaZ(cdsCadBens.FieldByName('IDFILIALARQ').AsString                          ,  3);
         sLinha := sLinha + CompletaZ(cdsCadBens.FieldByName('IDBEM').AsString                                ,  6);
         sLinha := sLinha + CompletaZ(cdsCadBens.FieldByName('AGREGADO').AsString                             ,  4);
         sLinha := sLinha + CompletaZ(cdsCadBens.FieldByName('PLACA').AsString                                , 13);
         sLinha := sLinha + CompletaZ(cdsCadBens.FieldByName('TIPODEBEM').AsString                            ,  2);
         sLinha := sLinha + CompletaZ(cdsCadBens.FieldByName('IDGRUPO').AsString                              ,  8);
         sLinha := sLinha + CompletaZ(cdsCadBens.FieldByName('CODCENTROCUSTO').AsString                       ,  6);
         sLinha := sLinha + CompletaZ(cdsCadBens.FieldByName('IDLOCALIZACAO').AsString                        ,  8);
         sLinha := sLinha + CompletaZ(cdsCadBens.FieldByName('AREADERISCO').AsString                          ,  6);
         sLinha := sLinha + CompletaZ(cdsCadBens.FieldByName('IDCLASSEBEM').AsString                          ,  4);
         sLinha := sLinha + CompletaB(cdsCadBens.FieldByName('DESBEM').AsString                               ,200);
         sLinha := sLinha + CompletaB(cdsCadBens.FieldByName('IDNOTA').AsString                               , 10);
         sLinha := sLinha + CompletaZ(cdsCadBens.FieldByName('IDFORNSERV').AsString                           ,  6);
         sLinha := sLinha + FormatDateTime('dd/mm/yyyy',cdsCadBens.FieldByName('DTACONTAB').AsDateTime);
         sLinha := sLinha + FormatDateTime('dd/mm/yyyy',cdsCadBens.FieldByName('DTAINCLUSAO').AsDateTime);
         sLinha := sLinha + FormatDateTime('dd/mm/yyyy',cdsCadBens.FieldByName('DATAINICIODEP').AsDateTime);
         sLinha := sLinha + '00/00/0000';
         sLinha := sLinha + CompletaZ(FormatFloat('#0.00',cdsCadBens.FieldByName('TAXADEP').AsFloat)          ,  6);
         sLinha := sLinha + CompletaZ(FormatFloat('#0.00',cdsCadBens.FieldByName('TAXADEPMOEGER1').AsFloat)   ,  6);
         sLinha := sLinha + CompletaZ(FormatFloat('#0.00',cdsCadBens.FieldByName('TAXADEPMOEGER2').AsFloat)   ,  6);
         sLinha := sLinha + CompletaZ(FormatFloat('#0.00',cdsCadBens.FieldByName('VALHISTORICO').AsFloat)     , 16);
         sLinha := sLinha + CompletaZ(FormatFloat('#0.00',cdsCadBens.FieldByName('VALORG').AsFloat)           , 16);
         sLinha := sLinha + CompletaZ(FormatFloat('#0.00',cdsCadBens.FieldByName('DEPLANC').AsFloat)          , 16);
         sLinha := sLinha + CompletaZ(FormatFloat('#0.0000',cdsCadBens.FieldByName('VALFIS').AsFloat)         , 18);
         sLinha := sLinha + CompletaZ(FormatFloat('#0.0000',cdsCadBens.FieldByName('DEPFIS').AsFloat)         , 18);
         sLinha := sLinha + CompletaZ(FormatFloat('#0.0000',cdsCadBens.FieldByName('VALUFIRAQUIS').AsFloat)   , 14);
         sLinha := sLinha + CompletaZ(FormatFloat('#0.0000',cdsCadBens.FieldByName('VALGER1').AsFloat)        , 18);
         sLinha := sLinha + CompletaZ(FormatFloat('#0.0000',cdsCadBens.FieldByName('DEPGER1').AsFloat)        , 18);
         sLinha := sLinha + CompletaZ(FormatFloat('#0.0000',cdsCadBens.FieldByName('VALGER1AQUIS').AsFloat)   , 14);
         sLinha := sLinha + CompletaZ(FormatFloat('#0.0000',cdsCadBens.FieldByName('VALGER2').AsFloat)        , 18);
         sLinha := sLinha + CompletaZ(FormatFloat('#0.0000',cdsCadBens.FieldByName('DEPGER2').AsFloat)        , 18);
         sLinha := sLinha + CompletaZ(FormatFloat('#0.0000',cdsCadBens.FieldByName('VALGER2AQUIS').AsFloat)   , 14);
         sLinha := sLinha + CompletaZ(cdsCadBens.FieldByName('BAIXADO').AsString                              ,  1);
         if cdsCadBens.FieldByName('BAIXADO').AsInteger = 0 then
            sLinha := sLinha + '00/00/0000'
         else
            sLinha := sLinha + FormatDateTime('dd/mm/yyyy',cdsCadBens.FieldByName('DATABAIXA').AsDateTime);
         sLinha := sLinha + CompletaZ(FormatFloat('#0.00',cdsCadBens.FieldByName('ICMSBEM').AsFloat)          , 16);
         Writeln(aTexto,trim(sLinha));
         //-------------------------------------------------------------------------------
         cdsCadBens.Next;
      end;
      //----------------------------------------------------------------------------------
      DecimalSeparator := cSeparador;
      //----------------------------------------------------------------------------------
      CloseFile(aTexto);
      //----------------------------------------------------------------------------------
      // Processamento dos Arquivos Auxiliares
      //----------------------------------------------------------------------------------
      AssignFile(aTexto , trim(edSelPasta.Text) + '\CAD_EMPRESAS.TXT');
      Rewrite(aTexto);
      //----------------------------------------------------------------------------------
      cdsEmpresas.Close;
      sqlEmpresas.Open;
      //----------------------------------------------------------------------------------
      prgBar.MaxValue := cdsEmpresas.RecordCount;
      cdsEmpresas.First;
      while not cdsEmpresas.EOF do
      begin
         lblStatus.Caption := 'Gerando Arquivo EMPRESAS ...';
         prgBar.Progress := prgBar.Progress + 1;
         Application.ProcessMessages;
         //-------------------------------------------------------------------------------
         sLinha := '';
         sLinha := sLinha + CompletaZ(cdsEmpresas.FieldByName('IDPESSOA').AsString , 8);
         sLinha := sLinha + CompletaB(cdsEmpresas.FieldByName('NOME').AsString     ,40);
         Writeln(aTexto,trim(sLinha));
         //-------------------------------------------------------------------------------
         cdsEmpresas.Next;
      end;
      //----------------------------------------------------------------------------------
      CloseFile(aTexto);
      //----------------------------------------------------------------------------------
      //----------------------------------------------------------------------------------
      AssignFile(aTexto , trim(edSelPasta.Text) + '\CAD_CONTASCONTABEIS.TXT');
      Rewrite(aTexto);
      //----------------------------------------------------------------------------------
      cdsGrupoContabil.Close;
      sqlGrupoContabil.Open;
      //----------------------------------------------------------------------------------
      prgBar.MaxValue := cdsGrupoContabil.RecordCount;
      cdsGrupoContabil.First;
      while not cdsGrupoContabil.EOF do
      begin
         lblStatus.Caption := 'Gerando Arquivo CONTAS CONTÁBEIS ...';
         prgBar.Progress := prgBar.Progress + 1;
         Application.ProcessMessages;
         //-------------------------------------------------------------------------------
         sLinha := '';
         sLinha := sLinha + CompletaZ(cdsGrupoContabil.FieldByName('IDPESSOA').AsString                    , 8);
         sLinha := sLinha + CompletaZ('00'                                                                 , 3);
         sLinha := sLinha + CompletaZ(cdsGrupoContabil.FieldByName('CLASSE').AsString                      , 8);
         sLinha := sLinha + CompletaB(cdsGrupoContabil.FieldByName('NOME').AsString                        ,40);
         sLinha := sLinha + CompletaZ(FormatFloat('#0.00',cdsGrupoContabil.FieldByName('TAXADEP').AsFloat) , 6);
         sLinha := sLinha + CompletaZ(FormatFloat('#0.00',cdsGrupoContabil.FieldByName('TAXADEP').AsFloat) , 6);
         sLinha := sLinha + CompletaZ(FormatFloat('#0.00',cdsGrupoContabil.FieldByName('TAXADEP').AsFloat) , 6);
         sLinha := sLinha + CompletaB(cdsGrupoContabil.FieldByName('CONTACUSTO').AsString                  ,18);
         sLinha := sLinha + CompletaB(cdsGrupoContabil.FieldByName('CONTADEPREC').AsString                 ,18);
         Writeln(aTexto,trim(sLinha));
         //-------------------------------------------------------------------------------
         cdsGrupoContabil.Next;
      end;
      //----------------------------------------------------------------------------------
      CloseFile(aTexto);
      //----------------------------------------------------------------------------------
      //----------------------------------------------------------------------------------
      AssignFile(aTexto , trim(edSelPasta.Text) + '\CAD_CENTROSCUSTO.TXT');
      Rewrite(aTexto);
      //----------------------------------------------------------------------------------
      cdsCentroCusto.Close;
      sqlCentroCusto.Open;
      //----------------------------------------------------------------------------------
      prgBar.MaxValue := cdsCentroCusto.RecordCount;
      cdsCentroCusto.First;
      while not cdsCentroCusto.EOF do
      begin
         lblStatus.Caption := 'Gerando Arquivo CENTROS DE CUSTO ...';
         prgBar.Progress := prgBar.Progress + 1;
         Application.ProcessMessages;
         //-------------------------------------------------------------------------------
         sLinha := '';
         sLinha := sLinha + CompletaZ(cdsCentroCusto.FieldByName('IDEMPRESA').AsString      , 8);
         sLinha := sLinha + CompletaZ('0'                                                   , 3);
         sLinha := sLinha + CompletaZ(cdsCentroCusto.FieldByName('CODCENTROCUSTO').AsString , 6);
         sLinha := sLinha + CompletaB(cdsCentroCusto.FieldByName('NOME').AsString           ,40);
         Writeln(aTexto,trim(sLinha));
         //-------------------------------------------------------------------------------
         cdsCentroCusto.Next;
      end;
      //----------------------------------------------------------------------------------
      CloseFile(aTexto);
      //----------------------------------------------------------------------------------
      //----------------------------------------------------------------------------------
      AssignFile(aTexto , trim(edSelPasta.Text) + '\CAD_LOCAIS_FISICOS.TXT');
      Rewrite(aTexto);
      //----------------------------------------------------------------------------------
      cdsLocalizacao.Close;
      sqlLocalizacao.Open;
      //----------------------------------------------------------------------------------
      prgBar.MaxValue := cdsLocalizacao.RecordCount;
      cdsLocalizacao.First;
      while not cdsLocalizacao.EOF do
      begin
         lblStatus.Caption := 'Gerando Arquivo LOCAIS FISICOS ...';
         prgBar.Progress := prgBar.Progress + 1;
         Application.ProcessMessages;
         //-------------------------------------------------------------------------------
         sLinha := '';
         sLinha := sLinha + CompletaZ(cdsLocalizacao.FieldByName('IDPESSOA').AsString       , 8);
         sLinha := sLinha + CompletaZ('0'                                                   , 3);
         sLinha := sLinha + CompletaZ(cdsLocalizacao.FieldByName('IDLOCALIZACAO').AsString  , 8);
         sLinha := sLinha + CompletaB(cdsLocalizacao.FieldByName('NOME').AsString           ,40);
         Writeln(aTexto,trim(sLinha));
         //-------------------------------------------------------------------------------
         cdsLocalizacao.Next;
      end;
      //----------------------------------------------------------------------------------
      CloseFile(aTexto);
      //----------------------------------------------------------------------------------
      MsgDlg('Operação Realizada!', 'Informação', mtInformation, [mbOk], 0);
   except
      on E : Exception do
      begin
         CloseFile(aTexto);
         MsgDlg('Operação não Realizada!' + #13 + #13 +
                'Excessão : ' + E.Message, 'Erro', mtError, [mbOk], 0);
      end;
   end;
   pnlStatus.Visible := False;
end;
//========================================================================================
function TfrmMTUtilExpDadosparaReaval.CompletaB(sCampo : String; iTam : Integer) : String;
var
   sCampoAux : String;

begin
   // Remove os caracteres inválidos
   sCampoAux := copy(RemCharInvalid(sCampo), 1, iTam);
   // Complementa com brancos a direita até que o tamanho do campo esteja preenchido
   while length(sCampoAux) < iTam do
      sCampoAux := sCampoAux + ' ';
   //
   Result := sCampoAux;
end;
//========================================================================================
function TfrmMTUtilExpDadosparaReaval.CompletaZ(sCampo : String; iTam : Integer) : String;
var
   sCampoAux : String;

begin
   // Remove os caracteres inválidos
   sCampoAux := RemCharInvalid(sCampo);
   // Complementa com zeros a esquerda até que o tamanho do campo esteja preenchido
   while length(sCampoAux) < iTam do
      sCampoAux := '0' + sCampoAux;
   //
   Result := sCampoAux;
end;
//========================================================================================
function TfrmMTUtilExpDadosparaReaval.RemCharInvalid(sCampo : String) : String;
var
   iAux : Integer;
begin
   Result := '';
   for iAux := 1 to length(sCampo) do
   begin
      if not ((sCampo[iAux] = ',') or (sCampo[iAux] = '.') or (sCampo[iAux] = '+') or
              (sCampo[iAux] = '-') or (sCampo[iAux] = '/') or (sCampo[iAux] = #13) or
              (sCampo[iAux] = #10)) then
         Result := Result + sCampo[iAux];
   end;
end;
//========================================================================================
procedure TfrmMTUtilExpDadosparaReaval.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   cdsCadBens.Close;
   ParamCAF.Free;
   Bem.Free;
   Fechamento.Free;
end;

end.
