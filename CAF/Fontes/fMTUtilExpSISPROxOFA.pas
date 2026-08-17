// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit fMTUtilExpSISPROxOFA;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, MAHlpBtn, StdCtrls, Buttons, uCMClientDataSet,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, BfDialogs, DBClient,
  uCmSqlParams, wwdbdatetimepicker, CMDateTimePicker, Gauges, IvEMulti,
  BrowseFolder, uProcuraDir, uCMTypes, uCtrlPadroes, uCtrlMoeda, uCtrlParamCAF;

type
  TfrmMTUtilExpSISPROxOFA = class(TfrmOkCancelar)
    pnlStatus: TPanel;
    lblStatus: TLabel;
    pnlprgBar: TPanel;
    prgBar: TGauge;
    Label1: TLabel;
    eDtaInicio: TCMDateTimePicker;
    Label3: TLabel;
    eDtaFim: TCMDateTimePicker;
    edSelPasta: TEdit;
    Label7: TLabel;
    bbtnSelPasta: TBitBtn;
    Label2: TLabel;
    SrcList: TListBox;
    Label8: TLabel;
    DstList: TListBox;
    ExAllBtn: TSpeedButton;
    ExcludeBtn: TSpeedButton;
    IncAllBtn: TSpeedButton;
    IncludeBtn: TSpeedButton;
    SaveDialog: TSaveDialog;
    cdsMoeda: TCMClientDataSet;
    cdsMovTrf: TCMClientDataSet;
    sqlMovTrf: TCMSqlParams;
    cdsContaContabil: TCMClientDataSet;
    sqlContaContabil: TCMSqlParams;
    cdsMovCaf: TCMClientDataSet;
    sqlMovCaf: TCMSqlParams;
    cdsSISPROxOFA: TCMClientDataSet;
    sqlSISPROxOFA: TCMSqlParams;
    cdsSaldoContabBem: TCMClientDataSet;
    sqlSaldoContabBem: TCMSqlParams;
    cdsSldCaf: TCMClientDataSet;
    sqlSldCaf: TCMSqlParams;
    procedure bbtnSelPastaClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure IncludeBtnClick(Sender: TObject);
    procedure IncAllBtnClick(Sender: TObject);
    procedure ExcludeBtnClick(Sender: TObject);
    procedure ExAllBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    Moeda : TCtrlMoeda;
    ParamCAF : TCtrlParamCAF;
    procedure CarregaListaMoedas;
    procedure MoveSelected(List: TCustomListBox; Items: TStrings);
    procedure SetItem(List: TListBox; Index: Integer);
    function  GetFirstSelection(List: TCustomListBox): Integer;
    procedure SetButtons;
    function ContaContabil(iEmpresaProp, iGrupo, iTipoMovimentacao,
                           iPlano : Integer; sTipoLanc : String) : String;
  public
    { Public declarations }
  end;

var
  frmMTUtilExpSISPROxOFA: TfrmMTUtilExpSISPROxOFA;

implementation

{$R *.DFM}

uses uMensErro, uSistema;

procedure TfrmMTUtilExpSISPROxOFA.FormCreate(Sender: TObject);
begin
   inherited;
   Moeda := TCtrlMoeda.Create;
   Moeda.InitializeAs(Padroes);
   //-------------------------------------------------------------------------------------
   ParamCAF := TCtrlParamCAF.Create;
   ParamCAF.InitializeAs(Padroes);
   ParamCAF.CarregaProp(Sistema.IdEmpresa);

   SaveDialog.InitialDir := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);
   //Ádler Teodoro de Souza SOL 109421 KINTANA 496332
end;
//========================================================================================
procedure TfrmMTUtilExpSISPROxOFA.FormShow(Sender: TObject);
var
   iAno, iMes, iDia : Word;
begin
   inherited;
   DecodeDate(Date, iAno, iMes, iDia);
   eDtaInicio.Date := EncodeDate(iAno, iMes, 01);
   eDtaFim.Date := DiasUteis.UltDiaMes(iAno, iMes);
   //-------------------------------------------------------------------------------------
   CarregaListaMoedas;
end;
//========================================================================================
procedure TfrmMTUtilExpSISPROxOFA.bbtnSelPastaClick(Sender: TObject);
begin
   inherited;
   if SaveDialog.Execute then
      edSelPasta.Text := SaveDialog.FileName
   else
      edSelPasta.Text := '';
end;
//========================================================================================
// Manipulação da Dual List Box
//========================================================================================
procedure TfrmMTUtilExpSISPROxOFA.CarregaListaMoedas;
var
   iPos : Integer;
   sMoeDesc : String;
begin
   inherited;
   SrcList.Clear;
   DstList.Clear;
   //-------------------------------------------------------------------------------------
   cdsMoeda.Data := Moeda.ListaMoeda;
   while not cdsMoeda.EOF do
   begin
      sMoeDesc := '';
      for iPos := 1 to 20 do
      begin
         if iPos <= length(cdsMoeda.FieldByName('MOEDESC').AsString) then
            sMoeDesc := sMoeDesc + copy(cdsMoeda.FieldByName('MOEDESC').AsString,iPos,1)
         else
            sMoeDesc := sMoeDesc + ' ';
      end;
      SrcList.Items.Add(sMoeDesc + ' ' + cdsMoeda.FieldByName('MOECODIGO').AsString);
      //----------------------------------------------------------------------------------
      cdsMoeda.Next;
   end;
   SetItem(SrcList,0);
   SetItem(DstList,0);
end;
//========================================================================================
procedure TfrmMTUtilExpSISPROxOFA.IncludeBtnClick(Sender: TObject);
var
   Index: Integer;

begin
   inherited;
   Index := GetFirstSelection(SrcList);
   MoveSelected(SrcList, DstList.Items);
   SetItem(SrcList, Index);
end;
//========================================================================================
procedure TfrmMTUtilExpSISPROxOFA.IncAllBtnClick(Sender: TObject);
var
   I: Integer;
begin
   inherited;
   for I := 0 to SrcList.Items.Count - 1 do
     DstList.Items.AddObject(SrcList.Items[I],
       SrcList.Items.Objects[I]);
   SrcList.Items.Clear;
   SetItem(SrcList, 0);
end;
//========================================================================================
procedure TfrmMTUtilExpSISPROxOFA.ExcludeBtnClick(Sender: TObject);
var
   Index: Integer;
begin
   inherited;
   Index := GetFirstSelection(DstList);
   MoveSelected(DstList, SrcList.Items);
   SetItem(DstList, Index);
end;
//========================================================================================
procedure TfrmMTUtilExpSISPROxOFA.ExAllBtnClick(Sender: TObject);
var
   I: Integer;
begin
   inherited;
   for I := 0 to DstList.Items.Count - 1 do
      SrcList.Items.AddObject(DstList.Items[I], DstList.Items.Objects[I]);
   DstList.Items.Clear;
   SetItem(DstList, 0);
end;
//========================================================================================
function TfrmMTUtilExpSISPROxOFA.GetFirstSelection(List: TCustomListBox): Integer;
begin
   for Result := 0 to List.Items.Count - 1 do
     if List.Selected[Result] then Exit;
   Result := LB_ERR;
end;
//========================================================================================
procedure TfrmMTUtilExpSISPROxOFA.MoveSelected(List: TCustomListBox; Items: TStrings);
var
   I: Integer;
begin
   for I := List.Items.Count - 1 downto 0 do
      if List.Selected[I] then
      begin
         Items.AddObject(List.Items[I], List.Items.Objects[I]);
         List.Items.Delete(I);
      end;
end;
//========================================================================================
procedure TfrmMTUtilExpSISPROxOFA.SetItem(List: TListBox; Index: Integer);
var
   MaxIndex: Integer;
begin
   with List do
   begin
      if CanFocus then SetFocus;
      MaxIndex := List.Items.Count - 1;
      if Index = LB_ERR then Index := 0
      else if Index > MaxIndex then Index := MaxIndex;
      Selected[Index] := True;
   end;
   SetButtons;
end;
//========================================================================================
procedure TfrmMTUtilExpSISPROxOFA.SetButtons;
var
   SrcEmpty, DstEmpty: Boolean;
begin
   SrcEmpty := SrcList.Items.Count = 0;
   DstEmpty := DstList.Items.Count = 0;
   IncludeBtn.Enabled := not SrcEmpty;
   IncAllBtn.Enabled := not SrcEmpty;
   ExcludeBtn.Enabled := not DstEmpty;
   ExAllBtn.Enabled := not DstEmpty;
end;
//========================================================================================
function TfrmMTUtilExpSISPROxOFA.ContaContabil(iEmpresaProp, iGrupo, iTipoMovimentacao,
                                               iPlano : Integer; sTipoLanc : String) : String;
begin
   sqlContaContabil.Prepare;
   sqlContaContabil.ParamByName('IDPESSOA').AsInteger := iEmpresaProp;
   sqlContaContabil.ParamByName('IDGRUPO').AsInteger := iGrupo;
   sqlContaContabil.ParamByName('IDTIPOMOVIMENTACAO').AsInteger := iTipoMovimentacao;
   sqlContaContabil.ParamByName('TIPOLANCAMENTO').AsString := sTipoLanc;
   sqlContaContabil.ParamByName('PLANO').AsInteger := iPlano;
   sqlContaContabil.Open;
   if not cdsContaContabil.IsEmpty then
      Result := trim(cdsContaContabil.FieldByName('PLACONTA').AsString)
   else
      Result := '';
end;
//========================================================================================
procedure TfrmMTUtilExpSISPROxOFA.bbtnConfirmarClick(Sender: TObject);
var
   sCodEmpresa, sPlaConta, sTipoVal,
   sMoeCodigo,
   sPeriodo, sCodSisProxOfa : String;
   iAnoFim, iMesFim, iDiaFim : Word;
   iIdPessoa, iIdBem, iMoeCodigo,
   iMoeda, iTipoVal : Integer;
   fValAcum : Currency;
   dDataPer : TDateTime;
   sLinha : String;
   atxtSISPROxOFA : TextFile;

begin
   inherited;
   //-------------------------------------------------------------------------------------
   if edSelPasta.Text = '' then
   begin
      MsgDlg('Selecione o nome do arquivo a ser gerado!', 'Erro', mtError, [mbOk], 0);
      bbtnSelPasta.SetFocus;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   if eDtaInicio.Text = '' then
   begin
      MsgDlg('Data Início do período não pode estar vazia !', 'Erro', mtError, [mbOk], 0);
      eDtaInicio.SetFocus;
      exit;
   end else
   //-------------------------------------------------------------------------------------
   if eDtaFim.Text = '' then
   begin
      MsgDlg('Data Final do período não pode estar vazia !', 'Erro', mtError, [mbOk], 0);
      eDtaInicio.SetFocus;
      exit;
   end else
   begin
      if eDtaInicio.Date > eDtaFim.Date then
      begin
         MsgDlg('Data Final não pode ser anterior a Data Início !', 'Erro', mtError, [mbOk], 0);
         eDtaFim.SetFocus;
         exit;
      end;
   end;   
   //-------------------------------------------------------------------------------------
   if DstList.Items.Count <= 0 then
   begin
      MsgDlg('Selecione as Moedas !', 'Erro', mtError, [mbOk], 0);
      eDtaInicio.SetFocus;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   // Gera o arquivo de exportação
   //-------------------------------------------------------------------------------------
   AssignFile(atxtSISPROxOFA, edSelPasta.Text);
   Rewrite(atxtSISPROxOFA);
   //-------------------------------------------------------------------------------------
   try
      lblStatus.Caption := 'Preparando...';
      prgBar.MaxValue := 1;
      prgBar.Progress := 0;
      pnlStatus.Visible := True;
      Application.ProcessMessages;
      //----------------------------------------------------------------------------------
      cdsSISPROxOFA.Close;
      //----------------------------------------------------------------------------------
      // Processa os dados por moeda, registrando os códigos de tipos de valores
      //----------------------------------------------------------------------------------
      for iMoeda := 0 to DstList.Items.Count - 1 do
      begin
         cdsMovCAF.Close;
         cdsMovCAF.IndexFieldNames := '';
         sqlMovCAF.Prepare;
         sqlMovCAF.ParamByName('DATAINI').AsDateTime := eDtaInicio.Date;
         sqlMovCAF.ParamByName('DATAFIM').AsDateTime := eDtaFim.Date;
         sqlMovCAF.ParamByName('MOECODIGO').AsInteger := strtoint(copy(DstList.Items.Strings[iMoeda], 22, length(DstList.Items.Strings[iMoeda]) - 21));
         sqlMovCAF.ParamByName('IDTAXADEP').AsInteger := 1;
         sqlMovCAF.Open;
         //-------------------------------------------------------------------------------
         // Preencher os campos PLACONTA e CODSISPROXOFA
         //-------------------------------------------------------------------------------
         prgBar.MaxValue := cdsMovCAF.RecordCount;
         prgBar.Progress := 0;
         Application.ProcessMessages;
         while not cdsMovCAF.EOF do
         begin
            lblStatus.Caption := 'Fase 1 -' + ' ' + cdsMovCAF.FieldByName('CODEMPRESA').AsString +
                                 ' - ' + inttostr(prgBar.MaxValue) + ' ' + 'Registros';
            prgBar.Progress := prgBar.Progress + 1;
            Application.ProcessMessages;
            //----------------------------------------------------------------------------
            // Preenche o campo PLACONTA com o cruzamento de IDGRUPO com
            // IDTIPOMOVIMENTACAO e o Tipo de Valor
            //----------------------------------------------------------------------------
            iTipoVal := 0;
            if cdsMovCAF.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 01 then
            begin
               sPlaConta := ContaContabil(cdsMovCAF.FieldByName('IDPESSOA').AsInteger,
                                          cdsMovCAF.FieldByName('IDGRUPO').AsInteger,
                                          cdsMovCAF.FieldByName('IDTIPOMOVIMENTACAO').AsInteger,
                                          ParamCAF.PLANOVIGENTE, 'D');
               sTipoVal := 'TPVL1';
               iTipoVal := 1;
            end else
            //----------------------------------------------------------------------------
            if (cdsMovCAF.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 06) or
               (cdsMovCAF.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 25) then
            begin
               sPlaConta := ContaContabil(cdsMovCAF.FieldByName('IDPESSOA').AsInteger,
                                          cdsMovCAF.FieldByName('IDGRUPO').AsInteger,
                                          cdsMovCAF.FieldByName('IDTIPOMOVIMENTACAO').AsInteger,
                                          ParamCAF.PLANOVIGENTE, 'C');
               sTipoVal := cdsMovCAF.FieldByName('CODSISPROXOFA').AsString;
               iTipoVal := 2;
            end else
            //----------------------------------------------------------------------------
            if cdsMovCAF.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 14 then
            begin
               sPlaConta := ContaContabil(cdsMovCAF.FieldByName('IDPESSOA').AsInteger,
                                          cdsMovCAF.FieldByName('IDGRUPO').AsInteger,
                                          cdsMovCAF.FieldByName('IDTIPOMOVIMENTACAO').AsInteger,
                                          ParamCAF.PLANOVIGENTE, 'C');
               sTipoVal := 'TPVL8';
               iTipoVal := 7;
            end else
            //----------------------------------------------------------------------------
            if (cdsMovCAF.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 24) or
               (cdsMovCAF.FieldByName('IDTIPOMOVIMENTACAO').AsInteger = 26) then
            begin
               sPlaConta := ContaContabil(cdsMovCAF.FieldByName('IDPESSOA').AsInteger,
                                          cdsMovCAF.FieldByName('IDGRUPO').AsInteger,
                                          cdsMovCAF.FieldByName('IDTIPOMOVIMENTACAO').AsInteger,
                                          ParamCAF.PLANOVIGENTE, 'D');
               sTipoVal := trim(cdsMovCAF.FieldByName('CODSISPROXOFA').AsString) + 'D';
               iTipoVal := 8;
            end;
            //----------------------------------------------------------------------------
            if sPlaConta = '' then
               Raise Exception.Create('Conta Contábil não Encontrada para : ' + #13 +
                                      'Empresa : ' + cdsMovCaf.FieldByName('IDPESSOA').AsString + #13 +
                                      'Grupo : ' + cdsMovCaf.FieldByName('IDGRUPO').AsString + #13 +
                                      'Tipo Movimentação : ' + cdsMovCaf.FieldByName('IDTIPOMOVIMENTACAO').AsString + #13 +
                                      'Plano de Contas : ' + inttostr(ParamCAF.PLANOVIGENTE));
            //----------------------------------------------------------------------------
            if iTipoVal > 0 then
            begin
               cdsMovCAF.Edit;
               cdsMovCAF.FieldByName('PLACONTA').AsString := sPlaConta;
               cdsMovCAF.FieldByName('NCODSISPROXOFA').AsInteger := iTipoVal;
               cdsMovCAF.FieldByName('CODSISPROXOFA').AsString := sTipoVal;
               cdsMovCAF.Post;
            end;
            //----------------------------------------------------------------------------
            cdsMovCAF.Next;
         end;
         //-------------------------------------------------------------------------------
         // Acrescenta as TRANSFERÊNCIAS
         //-------------------------------------------------------------------------------
         if strtoint(copy(DstList.Items.Strings[iMoeda],22,length(DstList.Items.Strings[iMoeda]) - 21)) = ParamCAF.MOEDAOFICIAL then
         begin
            sqlMovTrf.Prepare;
            sqlMovTrf.ParamByName('DATAINI').AsDateTime := eDtaInicio.Date;
            sqlMovTrf.ParamByName('DATAFIM').AsDateTime := eDtaFim.Date;
            sqlMovTrf.ParamByName('MOECODIGO').AsInteger := ParamCAF.MOEDAOFICIAL;
            sqlMovTrf.Open;
            //----------------------------------------------------------------------------
            prgBar.MaxValue := cdsMovTrf.RecordCount;
            prgBar.Progress := 0;
            Application.ProcessMessages;
            while not cdsMovTrf.EOF do
            begin
               lblStatus.Caption := 'Fase 2 -' + ' ' + cdsMovTrf.FieldByName('CODEMPRESA').AsString +
                                    ' - ' + inttostr(prgBar.MaxValue) + ' ' + 'Registros';
               prgBar.Progress := prgBar.Progress + 1;
               Application.ProcessMessages;
               //-------------------------------------------------------------------------
               if cdsMovTrf.FieldByName('TRFVALORG').AsFloat <> 0 then
               begin
                  sPlaConta := ContaContabil(cdsMovTrf.FieldByName('IDPESSOA').AsInteger,
                                             cdsMovTrf.FieldByName('IDGRUPO').AsInteger,
                                             01, ParamCAF.PLANOVIGENTE, 'D');
                  //----------------------------------------------------------------------
                  if sPlaConta = '' then
                     Raise Exception.Create('Conta Contábil não Encontrada para : ' +
                                            'Empresa : ' + cdsMovCaf.FieldByName('IDPESSOA').AsString + ' ' +
                                            'Grupo : ' + cdsMovCaf.FieldByName('IDGRUPO').AsString + ' ' +
                                            'Tipo Movimentação ' + cdsMovCaf.FieldByName('IDTIPOMOVIMENTACAO').AsString + ' ' +
                                            'Plano de Contas ' + inttostr(ParamCAF.PLANOVIGENTE));
                  //----------------------------------------------------------------------
                  sTipoVal := 'TPVL3';
                  iTipoVal := 3;
                  //----------------------------------------------------------------------
                  cdsMovCaf.Insert;
                  cdsMovCaf.FieldByName('CODEMPRESA').AsString := cdsMovTrf.FieldByName('CODEMPRESA').AsString;
                  cdsMovCaf.FieldByName('IDPESSOA').AsInteger := cdsMovTrf.FieldByName('IDPESSOA').AsInteger;
                  cdsMovCaf.FieldByName('PLACONTA').AsString := sPlaConta;
                  cdsMovCaf.FieldByName('IDGRUPO').AsInteger := cdsMovTrf.FieldByName('IDGRUPO').AsInteger;
                  cdsMovCaf.FieldByName('IDTIPOMOVIMENTACAO').AsInteger := cdsMovTrf.FieldByName('IDTIPOMOVIMENTACAO').AsInteger;
                  cdsMovCaf.FieldByName('PERIODO').AsString := cdsMovTrf.FieldByName('PERIODO').AsString;
                  cdsMovCaf.FieldByName('MOECODIGO').AsInteger := ParamCAF.MOEDAOFICIAL;
                  cdsMovCaf.FieldByName('MOESIGLA').AsString := cdsMovTrf.FieldByName('MOESIGLA').AsString;
                  cdsMovCAF.FieldByName('NCODSISPROXOFA').AsInteger := iTipoVal;
                  cdsMovCaf.FieldByName('CODSISPROXOFA').AsString := sTipoVal;
                  cdsMovCaf.FieldByName('VALOR').AsFloat := cdsMovTrf.FieldByName('TRFVALORG').AsFloat;
                  cdsMovCaf.Post;
               end;
               //-------------------------------------------------------------------------
               if cdsMovTrf.FieldByName('TRFCMBEM').AsFloat <> 0 then
               begin
                  sPlaConta := ContaContabil(cdsMovTrf.FieldByName('IDPESSOA').AsInteger,
                                             cdsMovTrf.FieldByName('IDGRUPO').AsInteger,
                                             15, ParamCAF.PLANOVIGENTE, 'D');
                  //----------------------------------------------------------------------
                  if sPlaConta = '' then
                     Raise Exception.Create('Conta Contábil não Encontrada para : ' +
                                            'Empresa : ' + cdsMovCaf.FieldByName('IDPESSOA').AsString + ' ' +
                                            'Grupo : ' + cdsMovCaf.FieldByName('IDGRUPO').AsString + ' ' +
                                            'Tipo Movimentação ' + cdsMovCaf.FieldByName('IDTIPOMOVIMENTACAO').AsString + ' ' +
                                            'Plano de Contas ' + inttostr(ParamCAF.PLANOVIGENTE));
                  //----------------------------------------------------------------------
                  sTipoVal := 'TPVL3';
                  iTipoVal := 3;
                  //----------------------------------------------------------------------
                  cdsMovCaf.Insert;
                  cdsMovCaf.FieldByName('CODEMPRESA').AsString := cdsMovTrf.FieldByName('CODEMPRESA').AsString;
                  cdsMovCaf.FieldByName('IDPESSOA').AsInteger := cdsMovTrf.FieldByName('IDPESSOA').AsInteger;
                  cdsMovCaf.FieldByName('PLACONTA').AsString := sPlaConta;
                  cdsMovCaf.FieldByName('IDGRUPO').AsInteger := cdsMovTrf.FieldByName('IDGRUPO').AsInteger;
                  cdsMovCaf.FieldByName('IDTIPOMOVIMENTACAO').AsInteger := cdsMovTrf.FieldByName('IDTIPOMOVIMENTACAO').AsInteger;
                  cdsMovCaf.FieldByName('PERIODO').AsString := cdsMovTrf.FieldByName('PERIODO').AsString;
                  cdsMovCaf.FieldByName('MOECODIGO').AsInteger := ParamCAF.MOEDAOFICIAL;
                  cdsMovCAF.FieldByName('NCODSISPROXOFA').AsInteger := iTipoVal;
                  cdsMovCaf.FieldByName('CODSISPROXOFA').AsString := sTipoVal;
                  cdsMovCaf.FieldByName('VALOR').AsFloat := cdsMovTrf.FieldByName('TRFCMBEM').AsFloat;
                  cdsMovCaf.Post;
               end;
               //-------------------------------------------------------------------------
               if cdsMovTrf.FieldByName('TRFDEPLANC').AsFloat <> 0 then
               begin
                  sPlaConta := ContaContabil(cdsMovTrf.FieldByName('IDPESSOA').AsInteger,
                                             cdsMovTrf.FieldByName('IDGRUPO').AsInteger,
                                             14, ParamCAF.PLANOVIGENTE, 'C');
                  //----------------------------------------------------------------------
                  if sPlaConta = '' then
                     Raise Exception.Create('Conta Contábil não Encontrada para : ' +
                                            'Empresa : ' + cdsMovCaf.FieldByName('IDPESSOA').AsString + ' ' +
                                            'Grupo : ' + cdsMovCaf.FieldByName('IDGRUPO').AsString + ' ' +
                                            'Tipo Movimentação ' + cdsMovCaf.FieldByName('IDTIPOMOVIMENTACAO').AsString + ' ' +
                                            'Plano de Contas ' + inttostr(ParamCAF.PLANOVIGENTE));
                  //----------------------------------------------------------------------
                  sTipoVal := 'TPVL7';
                  iTipoVal := 6;
                  //----------------------------------------------------------------------
                  cdsMovCaf.Insert;
                  cdsMovCaf.FieldByName('CODEMPRESA').AsString := cdsMovTrf.FieldByName('CODEMPRESA').AsString;
                  cdsMovCaf.FieldByName('IDPESSOA').AsInteger := cdsMovTrf.FieldByName('IDPESSOA').AsInteger;
                  cdsMovCaf.FieldByName('PLACONTA').AsString := sPlaConta;
                  cdsMovCaf.FieldByName('IDGRUPO').AsInteger := cdsMovTrf.FieldByName('IDGRUPO').AsInteger;
                  cdsMovCaf.FieldByName('IDTIPOMOVIMENTACAO').AsInteger := cdsMovTrf.FieldByName('IDTIPOMOVIMENTACAO').AsInteger;
                  cdsMovCaf.FieldByName('PERIODO').AsString := cdsMovTrf.FieldByName('PERIODO').AsString;
                  cdsMovCaf.FieldByName('MOECODIGO').AsInteger := ParamCAF.MOEDAOFICIAL;
                  cdsMovCAF.FieldByName('NCODSISPROXOFA').AsInteger := iTipoVal;
                  cdsMovCaf.FieldByName('CODSISPROXOFA').AsString := sTipoVal;
                  cdsMovCaf.FieldByName('VALOR').AsFloat := cdsMovTrf.FieldByName('TRFDEPLANC').AsFloat;
                  cdsMovCaf.Post;
               end;
               //-------------------------------------------------------------------------
               if cdsMovTrf.FieldByName('TRFCMDEP').AsFloat <> 0 then
               begin
                  sPlaConta := ContaContabil(cdsMovTrf.FieldByName('IDPESSOA').AsInteger,
                                             cdsMovTrf.FieldByName('IDGRUPO').AsInteger,
                                             21, ParamCAF.PLANOVIGENTE, 'C');
                  //----------------------------------------------------------------------
                  if sPlaConta = '' then
                     Raise Exception.Create('Conta Contábil não Encontrada para : ' +
                                            'Empresa : ' + cdsMovCaf.FieldByName('IDPESSOA').AsString + ' ' +
                                            'Grupo : ' + cdsMovCaf.FieldByName('IDGRUPO').AsString + ' ' +
                                            'Tipo Movimentação ' + cdsMovCaf.FieldByName('IDTIPOMOVIMENTACAO').AsString + ' ' +
                                            'Plano de Contas ' + inttostr(ParamCAF.PLANOVIGENTE));
                  //----------------------------------------------------------------------
                  sTipoVal := 'TPVL7';
                  iTipoVal := 6;
                  //----------------------------------------------------------------------
                  cdsMovCaf.Insert;
                  cdsMovCaf.FieldByName('CODEMPRESA').AsString := cdsMovTrf.FieldByName('CODEMPRESA').AsString;
                  cdsMovCaf.FieldByName('IDPESSOA').AsInteger := cdsMovTrf.FieldByName('IDPESSOA').AsInteger;
                  cdsMovCaf.FieldByName('PLACONTA').AsString := sPlaConta;
                  cdsMovCaf.FieldByName('IDGRUPO').AsInteger := cdsMovTrf.FieldByName('IDGRUPO').AsInteger;
                  cdsMovCaf.FieldByName('IDTIPOMOVIMENTACAO').AsInteger := cdsMovTrf.FieldByName('IDTIPOMOVIMENTACAO').AsInteger;
                  cdsMovCaf.FieldByName('PERIODO').AsString := cdsMovTrf.FieldByName('PERIODO').AsString;
                  cdsMovCaf.FieldByName('MOECODIGO').AsInteger := ParamCAF.MOEDAOFICIAL;
                  cdsMovCaf.FieldByName('NCODSISPROXOFA').AsInteger := iTipoVal;
                  cdsMovCaf.FieldByName('CODSISPROXOFA').AsString := sTipoVal;
                  cdsMovCaf.FieldByName('VALOR').AsFloat := cdsMovTrf.FieldByName('TRFCMDEP').AsFloat;
                  cdsMovCaf.Post;
               end;
               //-------------------------------------------------------------------------
               cdsMovTrf.Next;
            end;
         end;
      end;
      cdsMovTrf.Close;
      //----------------------------------------------------------------------------------
      // Define o índice 'on-the-fly' a ser usado para calcular os saldos no final de
      // cada periodo
      //----------------------------------------------------------------------------------
      cdsMovCAF.IndexFieldNames := 'IDPESSOA;IDBEM;MOECODIGO;PERIODO';
      sqlSldCaf.Open;
      //----------------------------------------------------------------------------------
      prgBar.MaxValue := cdsMovCAF.RecordCount;
      prgBar.Progress := 0;
      Application.ProcessMessages;
      cdsMovCAF.First;
      while not cdsMovCAF.Eof do
      begin
         lblStatus.Caption := 'Fase 3 -' + ' ' + cdsMovCAF.FieldByName('CODEMPRESA').AsString +
                              ' - ' + inttostr(prgBar.MaxValue) + ' ' + 'Registros';
         Application.ProcessMessages;
         //-------------------------------------------------------------------------------
         iIdPessoa  := cdsMovCaf.FieldByName('IDPESSOA').AsInteger;
         iIdBem     := cdsMovCaf.FieldByName('IDBEM').AsInteger;
         iMoeCodigo := cdsMovCaf.FieldByName('MOECODIGO').AsInteger;
         sPeriodo   := cdsMovCaf.FieldByName('PERIODO').AsString;
         //-------------------------------------------------------------------------------
         // Calcula a data do final do periodo e o saldo contabil do bem nesta data
         //-------------------------------------------------------------------------------
         DecodeDate(DiasUteis.UltDiaMes(strtoint(copy(sPeriodo,1,4)), strtoint(copy(sPeriodo,5,2))), iAnoFim, iMesFim, iDiaFim);
         dDataPer := EncodeDate(iAnoFim, iMesFim, iDiaFim);
         //-------------------------------------------------------------------------------
         sqlSaldoContabBem.Prepare;
         sqlSaldoContabBem.ParamByName('IDPESSOA').AsInteger  := iIdPessoa;
         sqlSaldoContabBem.ParamByName('IDBEM').AsInteger     := iIdBem;
         sqlSaldoContabBem.ParamByName('DATASLD').AsDateTime  := dDataPer;
         sqlSaldoContabBem.ParamByName('MOECODIGO').AsInteger := iMoecodigo;
         sqlSaldoContabBem.ParamByName('IDTAXADEP').AsInteger := 1;
         sqlSaldoContabBem.Open;
         if not cdsSaldoContabBem.IsEmpty then
         begin
            if cdsSaldoContabBem.FieldByName('VALORG').AsFloat <> 0 then
            begin
               sPlaConta := ContaContabil(cdsMovCaf.FieldByName('IDPESSOA').AsInteger,
                                          cdsMovCaf.FieldByName('IDGRUPO').AsInteger,
                                          01, ParamCAF.PLANOVIGENTE, 'D');
               //-------------------------------------------------------------------------
               if sPlaConta = '' then
                  Raise Exception.Create('Conta Contábil não Encontrada para : ' +
                                         'Empresa : ' + cdsMovCaf.FieldByName('IDPESSOA').AsString + ' ' +
                                         'Grupo : ' + cdsMovCaf.FieldByName('IDGRUPO').AsString + ' ' +
                                         'Tipo Movimentação 01 ' +
                                         'Plano de Contas ' + inttostr(ParamCAF.PLANOVIGENTE));
               //-------------------------------------------------------------------------
               sTipoVal := 'TPVL4';
               iTipoVal := 3;
               //-------------------------------------------------------------------------
               cdsSldCaf.Append;
               cdsSldCaf.FieldByName('CODEMPRESA').AsString := cdsMovCaf.FieldByName('CODEMPRESA').AsString;
               cdsSldCaf.FieldByName('PLACONTA').AsString := sPlaConta;
               cdsSldCaf.FieldByName('PERIODO').AsString := cdsMovCaf.FieldByName('PERIODO').AsString;
               cdsSldCaf.FieldByName('MOECODIGO').AsInteger := cdsMovCaf.FieldByName('MOECODIGO').AsInteger;
               cdsSldCaf.FieldByName('MOESIGLA').AsString := cdsMovCaf.FieldByName('MOESIGLA').AsString;
               cdsSldCaf.FieldByName('NTIPOVALOR').AsInteger := iTipoVal;
               cdsSldCaf.FieldByName('TIPOVALOR').AsString := sTipoVal;
               cdsSldCaf.FieldByName('VALOR').AsFloat := cdsSaldoContabBem.FieldByName('VALORG').AsFloat;
               cdsSldCaf.Post;
            end;
            //----------------------------------------------------------------------------
            if cdsSaldoContabBem.FieldByName('CMBEM').AsFloat <> 0 then
            begin
               sPlaConta := ContaContabil(cdsMovCaf.FieldByName('IDPESSOA').AsInteger,
                                          cdsMovCaf.FieldByName('IDGRUPO').AsInteger,
                                          15, ParamCAF.PLANOVIGENTE, 'D');
               //-------------------------------------------------------------------------
               if sPlaConta = '' then
                  Raise Exception.Create('Conta Contábil não Encontrada para : ' +
                                         'Empresa : ' + cdsMovCaf.FieldByName('IDPESSOA').AsString + ' ' +
                                         'Grupo : ' + cdsMovCaf.FieldByName('IDGRUPO').AsString + ' ' +
                                         'Tipo Movimentação 15 ' +
                                         'Plano de Contas ' + inttostr(ParamCAF.PLANOVIGENTE));
               //-------------------------------------------------------------------------
               sTipoVal := 'TPVL4';
               iTipoVal := 3;
               //-------------------------------------------------------------------------
               cdsSldCaf.Append;
               cdsSldCaf.FieldByName('CODEMPRESA').AsString := cdsMovCaf.FieldByName('CODEMPRESA').AsString;
               cdsSldCaf.FieldByName('PLACONTA').AsString := sPlaConta;
               cdsSldCaf.FieldByName('PERIODO').AsString := cdsMovCaf.FieldByName('PERIODO').AsString;
               cdsSldCaf.FieldByName('MOECODIGO').AsInteger := cdsMovCaf.FieldByName('MOECODIGO').AsInteger;
               cdsSldCaf.FieldByName('MOESIGLA').AsString := cdsMovCaf.FieldByName('MOESIGLA').AsString;
               cdsSldCaf.FieldByName('NTIPOVALOR').AsInteger := iTipoVal;
               cdsSldCaf.FieldByName('TIPOVALOR').AsString := sTipoVal;
               cdsSldCaf.FieldByName('VALOR').AsFloat := cdsSaldoContabBem.FieldByName('CMBEM').AsFloat;
               cdsSldCaf.Post;
            end;
            //----------------------------------------------------------------------------
            if cdsSaldoContabBem.FieldByName('DEPLANC').AsFloat <> 0 then
            begin
               sPlaConta := ContaContabil(cdsMovCaf.FieldByName('IDPESSOA').AsInteger,
                                          cdsMovCaf.FieldByName('IDGRUPO').AsInteger,
                                          14, ParamCAF.PLANOVIGENTE, 'C');
               //-------------------------------------------------------------------------
               if sPlaConta = '' then
                  Raise Exception.Create('Conta Contábil não Encontrada para : ' +
                                         'Empresa ' + cdsMovCaf.FieldByName('IDPESSOA').AsString + ' ' +
                                         'Grupo ' + cdsMovCaf.FieldByName('IDGRUPO').AsString + ' ' +
                                         'Tipo Movimentação 14 ' +
                                         'Plano de Contas ' + inttostr(ParamCAF.PLANOVIGENTE));
               //-------------------------------------------------------------------------
               sTipoVal := 'TPVL5';
               iTipoVal := 4;
               //-------------------------------------------------------------------------
               cdsSldCaf.Append;
               cdsSldCaf.FieldByName('CODEMPRESA').AsString := cdsMovCaf.FieldByName('CODEMPRESA').AsString;
               cdsSldCaf.FieldByName('PLACONTA').AsString := sPlaConta;
               cdsSldCaf.FieldByName('PERIODO').AsString := cdsMovCaf.FieldByName('PERIODO').AsString;
               cdsSldCaf.FieldByName('MOECODIGO').AsInteger := cdsMovCaf.FieldByName('MOECODIGO').AsInteger;
               cdsSldCaf.FieldByName('MOESIGLA').AsString := cdsMovCaf.FieldByName('MOESIGLA').AsString;
               cdsSldCaf.FieldByName('NTIPOVALOR').AsInteger := iTipoVal;
               cdsSldCaf.FieldByName('TIPOVALOR').AsString := sTipoVal;
               cdsSldCaf.FieldByName('VALOR').AsFloat := cdsSaldoContabBem.FieldByName('DEPLANC').AsFloat;
               cdsSldCaf.Post;
            end;
            //----------------------------------------------------------------------------
            if cdsSaldoContabBem.FieldByName('CMDEP').AsFloat <> 0 then
            begin
               sPlaConta := ContaContabil(cdsMovCaf.FieldByName('IDPESSOA').AsInteger,
                                          cdsMovCaf.FieldByName('IDGRUPO').AsInteger,
                                          21, ParamCAF.PLANOVIGENTE, 'C');
               //-------------------------------------------------------------------------
               if sPlaConta = '' then
                  Raise Exception.Create('Conta Contábil não Encontrada para : ' +
                                         'Empresa ' + cdsMovCaf.FieldByName('IDPESSOA').AsString + ' ' +
                                         'Grupo ' + cdsMovCaf.FieldByName('IDGRUPO').AsString + ' ' +
                                         'Tipo Movimentação 21' +
                                         'Plano de Contas ' + inttostr(ParamCAF.PLANOVIGENTE));
               //-------------------------------------------------------------------------
               sTipoVal := 'TPVL5';
               iTipoVal := 4;
               //-------------------------------------------------------------------------
               cdsSldCaf.Append;
               cdsSldCaf.FieldByName('CODEMPRESA').AsString := cdsMovCaf.FieldByName('CODEMPRESA').AsString;
               cdsSldCaf.FieldByName('PLACONTA').AsString := sPlaConta;
               cdsSldCaf.FieldByName('PERIODO').AsString := cdsMovCaf.FieldByName('PERIODO').AsString;
               cdsSldCaf.FieldByName('MOECODIGO').AsInteger := cdsMovCaf.FieldByName('MOECODIGO').AsInteger;
               cdsSldCaf.FieldByName('MOESIGLA').AsString := cdsMovCaf.FieldByName('MOESIGLA').AsString;
               cdsSldCaf.FieldByName('NTIPOVALOR').AsInteger := iTipoVal;
               cdsSldCaf.FieldByName('TIPOVALOR').AsString := sTipoVal;
               cdsSldCaf.FieldByName('VALOR').AsFloat := cdsSaldoContabBem.FieldByName('CMDEP').AsFloat;
               cdsSldCaf.Post;
            end;
         end;
         //-------------------------------------------------------------------------------
         while (not cdsMovCAF.EOF) and (cdsMovCaf.FieldByName('IDPESSOA').AsInteger = iIdPessoa)
                                   and (cdsMovCaf.FieldByName('IDBEM').AsInteger = iIdBem)
                                   and (cdsMovCaf.FieldByName('MOECODIGO').AsInteger = iMoeCodigo)
                                   and (cdsMovCaf.FieldByName('PERIODO').AsString = sPeriodo) do
         begin
            cdsMovCAF.Next;
            prgBar.Progress := prgBar.Progress + 1;
         end;
         Application.ProcessMessages;
      end;
      //----------------------------------------------------------------------------------
      // Acrescenta os Saldos Contábeis processados em cdsSldCaf em cdsMovCaf
      //----------------------------------------------------------------------------------
      prgBar.MaxValue := cdsSldCAF.RecordCount;
      prgBar.Progress := 0;
      cdsSldCaf.First;
      while not cdsSldCaf.EOF do
      begin
         lblStatus.Caption := 'Fase 4 -' + ' ' + cdsSldCAF.FieldByName('CODEMPRESA').AsString +
                              ' - ' + inttostr(prgBar.MaxValue) + ' ' + 'Registros';
         prgBar.Progress := prgBar.Progress + 1;
         Application.ProcessMessages;
         //-------------------------------------------------------------------------------
         cdsMovCaf.Append;
         cdsMovCaf.FieldByName('CODEMPRESA').AsString := cdsSldCaf.FieldByName('CODEMPRESA').AsString;
         cdsMovCaf.FieldByName('PLACONTA').AsString := cdsSldCaf.FieldByName('PLACONTA').AsString;
         cdsMovCaf.FieldByName('PERIODO').AsString := cdsSldCaf.FieldByName('PERIODO').AsString;
         cdsMovCaf.FieldByName('MOECODIGO').AsInteger := cdsSldCaf.FieldByName('MOECODIGO').AsInteger;
         cdsMovCaf.FieldByName('MOESIGLA').AsString := cdsSldCaf.FieldByName('MOESIGLA').AsString;
         cdsMovCaf.FieldByName('NCODSISPROXOFA').AsInteger := cdsSldCaf.FieldByName('NTIPOVALOR').AsInteger;
         cdsMovCaf.FieldByName('CODSISPROXOFA').AsString := cdsSldCaf.FieldByName('TIPOVALOR').AsString;
         cdsMovCaf.FieldByName('VALOR').AsFloat := cdsSldCaf.FieldByName('VALOR').AsFloat;
         cdsMovCaf.Post;
         //-------------------------------------------------------------------------------
         cdsSldCaf.Next;
      end;
      cdsSldCaf.Close;
      //----------------------------------------------------------------------------------
      // Define o índice 'on-the-fly' a ser usado para acumular os valores
      //----------------------------------------------------------------------------------
      cdsMovCAF.IndexFieldNames := 'CODEMPRESA;PLACONTA;PERIODO;MOECODIGO;NCODSISPROXOFA;CODSISPROXOFA';
      sqlSISPROxOFA.Open;
      //----------------------------------------------------------------------------------
      // Acumular por Periodo x Moeda
      //----------------------------------------------------------------------------------
      prgBar.MaxValue := cdsMovCAF.RecordCount;
      prgBar.Progress := 0;
      cdsMovCAF.First;
      while not cdsMovCAF.Eof do
      begin
         lblStatus.Caption := 'Fase 5 -' + ' ' + cdsMovCAF.FieldByName('CODEMPRESA').AsString +
                              ' - ' + inttostr(prgBar.MaxValue) + ' ' + 'Registros';
         Application.ProcessMessages;
         //-------------------------------------------------------------------------------
         sCodEmpresa    := cdsMovCaf.FieldByName('CODEMPRESA').AsString;
         sPlaConta      := cdsMovCaf.FieldByName('PLACONTA').AsString;
         sPeriodo       := cdsMovCaf.FieldByName('PERIODO').AsString;
         iMoecodigo     := cdsMovCaf.FieldByName('MOECODIGO').AsInteger;
         sMoeCodigo     := cdsMovCaf.FieldByName('MOESIGLA').AsString;
         sCodSisProxOfa := cdsMovCaf.FieldByName('CODSISPROXOFA').AsString;
         fValAcum       := 0;
         while (not cdsMovCAF.Eof) and (cdsMovCaf.FieldByName('CODEMPRESA').AsString = sCodEmpresa)
                                   and (cdsMovCaf.FieldByName('PLACONTA').AsString = sPlaConta)
                                   and (cdsMovCaf.FieldByName('PERIODO').AsString = sPeriodo)
                                   and (cdsMovCaf.FieldByName('MOECODIGO').AsInteger = iMoecodigo)
                                   and (cdsMovCaf.FieldByName('CODSISPROXOFA').AsString = sCodSisProxOfa) do
         begin
            prgBar.Progress := prgBar.Progress + 1;
            Application.ProcessMessages;
            //----------------------------------------------------------------------------
            fValAcum := fValAcum + cdsMovCaf.FieldByName('VALOR').AsCurrency;
            cdsMovCAF.Next;
         end;
         //-------------------------------------------------------------------------------
         // Registrar em cdsSISPROxOFA
         //-------------------------------------------------------------------------------
         cdsSISPROxOFA.Append;
         cdsSISPROxOFA.FieldByName('CODEMPRESA').AsString := sCodEmpresa;
         cdsSISPROxOFA.FieldByName('PLACONTA').AsString := 'CT' + sPlaConta;
         cdsSISPROxOFA.FieldByName('PERIODO').AsString := sPeriodo;
         cdsSISPROxOFA.FieldByName('MOESIGLA').AsString := sMoeCodigo;
         cdsSISPROxOFA.FieldByName('TIPOVALOR').AsString := sCodSisProxOfa;
         cdsSISPROxOFA.FieldByName('VALOR').AsFloat := fValAcum;
         cdsSISPROxOFA.Post;
      end;
      //----------------------------------------------------------------------------------
      // Gera o Arquivo Texto baseado em cdsSISPROxOFA
      //----------------------------------------------------------------------------------
      prgBar.MaxValue := cdsSISPROxOFA.RecordCount;
      prgBar.Progress := 0;
      cdsSISPROxOFA.First;
      while not cdsSISPROxOFA.EOF do
      begin
         lblStatus.Caption := 'Fase 6 -' + ' ' + cdsSISPROxOFA.FieldByName('CODEMPRESA').AsString +
                              ' - ' + inttostr(prgBar.MaxValue) + ' ' + 'Registros';
         prgBar.Progress := prgBar.Progress + 1;
         Application.ProcessMessages;
         //-------------------------------------------------------------------------------
         sLinha := '';
         sLinha := sLinha + '"' + cdsSISPROxOFA.FieldByName('CODEMPRESA').AsString + '",';
         sLinha := sLinha + '"' + cdsSISPROxOFA.FieldByName('PLACONTA').AsString   + '",';
         sLinha := sLinha + '"' + cdsSISPROxOFA.FieldByName('PERIODO').AsString    + '",';
         sLinha := sLinha + '"' + cdsSISPROxOFA.FieldByName('MOESIGLA').AsString   + '",';
         sLinha := sLinha + '"' + cdsSISPROxOFA.FieldByName('TIPOVALOR').AsString  + '",';
         sLinha := sLinha + FormatFloat('#0.00', cdsSISPROxOFA.FieldByName('VALOR').AsFloat);
         Writeln(atxtSISPROxOFA,trim(sLinha));
         //-------------------------------------------------------------------------------
         cdsSISPROxOFA.Next;
      end;
      //----------------------------------------------------------------------------------
      CloseFile(atxtSISPROxOFA);
      //----------------------------------------------------------------------------------
      MsgDlg('Operação Realizada!','Informação',mtInformation,[mbOk],0);
   except
      on E : Exception do
      begin
         CloseFile(atxtSISPROxOFA);
         MsgDlg('Operação não Realizada!' + #13 + #13 +
                'Excessão : ' + E.Message, 'Erro', mtError, [mbOk], 0);
      end;
   end;
   pnlStatus.Visible := False;
end;
//========================================================================================
procedure TfrmMTUtilExpSISPROxOFA.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   cdsContaContabil.Close;
   cdsSaldoContabBem.Close;
   cdsMovCaf.Close;
   cdsMovTrf.Close;
   cdsSldCaf.Close;
   cdsSISPROxOFA.Close;
   Moeda.Free;
   ParamCAF.Free;
end;

end.
