{-----------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------- Histórico de alterações -------------------------------------------------------------
Rotina......: GerarExcel
Nº SIG......: 125148
Data........: 23/05/2022
Responsável.: Luis Ferrari
Descrição...: Ao exportar em MS EXCEL, as datas de alguns contratos ficam invertidas
-----------------------------------------------------------------------------------------------------------------------------------
Rotina......: btnExportarClick
Nº SIG......: 123112
Data........: 07/03/2022
Responsável.: edilaine
Descrição...: ao exportar dados não considera todas as linhas do relatório
-----------------------------------------------------------------------------------------------------------------------------------
Rotina......: GerarExcel
Nº SIG......: 116929
Data........: 22/06/2021
Responsável.: edilaine
Descrição...: Erro ao exportar para excelo o balancete por plano e patro
-----------------------------------------------------------------------------------------------------------------------------------
Rotina......: (dfm dsExportSubx) ComplementaExcel
Nº SIG......: 103891
Data........: 03/01/2021
Responsável.: edilaine
Descrição...: exportar subconsultas
-----------------------------------------------------------------------------------------------------------------------------------
Rotina......: GerarExcel
Nº SIG......: 101433
Data........: /12/2020
Responsável.: edilaine
Descrição...: crítica de planilha bloqueada
-----------------------------------------------------------------------------------------------------------------------------------
Rotina......: ComplementaExcel, GerarExcel
Nº SIG......: 94698
Data........: 27/03/2020
Responsável.: Fábio Sampaio
Descrição...: Alteração para exportar as subconsultas de relatórios
-----------------------------------------------------------------------------------------------------------------------------------
Rotina......: GerarExcel
Nº SIG......: 86562
Data........: 05/06/2019
Responsável.: Taffarel Sevaybriker
Descrição...: Removida a formatação de dados devido a lentidão na exportação para .xls
-----------------------------------------------------------------------------------------------------------------------------------
Rotina......:
Nº SIG......: 62683
Data........: 02/03/2018         
Responsável.: Darivaldo Alencar
Descrição...: Criação da funcionalidade
-----------------------------------------------------------------------------------------------------------------------------------}

unit fExportD;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FTelaAut, StdCtrls, Buttons, ComCtrls, ExtCtrls, IvDictio, IvMulti,
  IvEMulti, Grids, DBClient,  Db, DBTables, Wwquery, ImgList,comobj,shellapi,fAguarde,
  IniFiles, uSistema ;

type
  TDocsIni = (TCabecalho, TRodape);
  TfmQrExportD = class(TfrmTelaAutorizacao)
    pnlCorpo: TPanel;
    pnlBusca: TPanel;
    PageControl1: TPageControl;
    tbsType: TTabSheet;
    tbsColunas: TTabSheet;
    tbsCabecalho: TTabSheet;
    tbsCaption: TTabSheet;
    edNmArquivo: TEdit;
    btnSalvar: TBitBtn;
    Label1: TLabel;
    rgExportacao: TRadioGroup;
    pnlRodape: TPanel;
    btnExportar: TBitBtn;
    btnFechar: TBitBtn;
    ckbxMostrar: TCheckBox;
    lstAvailableFields: TListView;
    lstExportedFields: TListView;
    Label3: TLabel;
    bAddOneExportedField: TSpeedButton;
    bAddAllExportedField: TSpeedButton;
    bDelOneExportedField: TSpeedButton;
    bDelAllExportedField: TSpeedButton;
    laHeader: TLabel;
    memHeader: TMemo;
    laFooter: TLabel;
    memFooter: TMemo;
    sgrCaptions: TStringGrid;
    svFile: TSaveDialog;
    cdsExport: TClientDataSet;
    laAvailableFields: TLabel;
    imgFields: TImageList;
    cdsCampos: TClientDataSet;
    cdsCamposnm_campo: TStringField;
    cdsCampostamanho_campo: TIntegerField;
    cdsExportSub1: TClientDataSet;
    cdsExportSub2: TClientDataSet;
    cdsExportSub3: TClientDataSet;
    cdsExportSub4: TClientDataSet;
    cdsExportSub5: TClientDataSet;
    cdsExportSub6: TClientDataSet;
    dsExport: TDataSource;
    qryExport: TwwQuery;
    dsExportSub1: TDataSource;
    dsExportSub2: TDataSource;
    dsExportSub3: TDataSource;
    dsExportSub4: TDataSource;
    dsExportSub5: TDataSource;
    dsExportSub6: TDataSource;
    procedure bAddOneExportedFieldClick(Sender: TObject);
    procedure bAddAllExportedFieldClick(Sender: TObject);
    procedure bDelOneExportedFieldClick(Sender: TObject);
    procedure bDelAllExportedFieldClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnExportarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure rgExportacaoClick(Sender: TObject);
  private
    iIdReport: Integer;
    procedure MoveListItems(LtOrigem, LtDestino: TListView; indiceImagem: Integer);//Move todos
    procedure MoveListItem(LtOrigem, LtDestino: TListView; indiceImagem: Integer); //move somente o selecionado
    Procedure IniciaBarraProgresso(sCaption: String; iMax: Integer);
    Procedure IncrementaProgresso;
    Procedure FinalizaProgresso;
    Procedure PreencheColunas;
    Procedure PreencheGrid;
    procedure LimparGrid(StringGrid: TStringGrid);
    Procedure GerarExcel(Consulta:TDataSet; ArquivoINI: TIniFile);    //101433
    //edilaine SIG103891 : inicio
    //Procedure ComplementaExcel(Consulta: TClientDataSet; var Excel: variant; SubNro: Integer); // Alterado por FHBS - 27/03/2020 - SIG94698
    Procedure ComplementaExcel(Consulta: TDataSet; var Excel: variant; SubNro: Integer);
    //edilaine SIG103891 : fim

    Procedure GeraCabecalho;
    Function  PersonalizaCabecalho(Indice: Integer): String;
    Function GetLength(sCampo: String; tipo: TFieldType): Integer;
    Function PodeGravarCampo(sCampo: String): Boolean;
    Function BuscaDescricaoGrid(sCampo: String): String;
    Procedure AdicionaExtensao;
    Procedure GravaCabecalhoRodapre(ArquivoINI: TIniFile; Tipo: TDocsIni);
  public
    procedure DataSet(dDataSet: TDataset; piIdReport: Integer); overload;   //101433
    procedure DataSet(qry: Twwquery; piIdReport: Integer); overload;        //101433
    Procedure DataSet(cds: TClientDataSet; piIdReport: Integer); overload;
    Procedure DataSet(cds: TClientDataSet; piIdReport: Integer;
                      cdsSub1, cdsSub2, cdsSub3, cdsSub4, cdsSub5, cdsSub6: TClientDataSet); overload;

    //edilaine SIG103891 : inicio
    Procedure DataSet(dDataSet: TDataset; piIdReport: Integer;
                      dDataSetSub1, dDataSetSub2, dDataSetSub3, dDataSetSub4, dDataSetSub5, dDataSetSub6: TDataset); overload;
    //edilaine SIG103891 : fim

  end;

var
  fmQrExportD: TfmQrExportD;

implementation

{$R *.DFM}


function  isInteger(sValor : string) : boolean;
begin
  try
    StrToInt(sValor);
  except
  on EConvertError do result := false;
  else
    result := true;
  end;
end;


//Move todos os itens
procedure TfmQrExportD.MoveListItems(LtOrigem, LtDestino: TListView; indiceImagem: Integer);
var
   i: Integer;
   Item: TListItem;
begin
  if (LtOrigem.Items.Count > 0)then
    begin
      LtDestino.Items.BeginUpdate;
      for i:= 0 to LtOrigem.Items.Count -1 do
        begin
          Item := LtDestino.Items.Add;
          Item.ImageIndex := indiceImagem;
          Item.Caption := LtOrigem.Items[i].Caption;
          Item.SubItems.Add(LtOrigem.Items[i].SubItems[0]);
          Item.SubItems.Add(LtOrigem.Items[i].SubItems[1]);
        end;
      LtDestino.Items.EndUpdate;

      LtOrigem.Items.Clear;
    end;
end;

//Move somente um item
procedure TfmQrExportD.MoveListItem(LtOrigem, LtDestino: TListView;
  indiceImagem: Integer);
var
  i: Integer;
  Item: TListItem;
begin
  inherited;
  if (LtOrigem.Items.Count > 0)then
   begin
     if (LtOrigem.Selected <> nil) then
       begin
          LtDestino.Items.BeginUpdate;
          Item := LtDestino.Items.Add;
          Item.ImageIndex := indiceImagem;
          Item.Caption := LtOrigem.Selected.Caption;
          Item.SubItems.Add(LtOrigem.Selected.SubItems[0]);
          Item.SubItems.Add(LtOrigem.Selected.SubItems[1]);
          LtDestino.Items.EndUpdate;

          LtOrigem.Selected.Delete;
          PreencheGrid;
       end;
  end;
end;

procedure TfmQrExportD.bAddOneExportedFieldClick(Sender: TObject);
begin
  inherited;
  MoveListItem(lstAvailableFields,lstExportedFields, 1);
  PreencheGrid;
end;

procedure TfmQrExportD.bAddAllExportedFieldClick(Sender: TObject);
begin
  inherited;
  MoveListItems(lstAvailableFields, lstExportedFields, 1);
  PreencheGrid;
end;

procedure TfmQrExportD.bDelOneExportedFieldClick(Sender: TObject);
begin
  inherited;
  MoveListItem(lstExportedFields, lstAvailableFields, 0);
  PreencheGrid;
end;

procedure TfmQrExportD.bDelAllExportedFieldClick(Sender: TObject);
begin
  inherited;
  MoveListItems(lstExportedFields, lstAvailableFields, 0);
  PreencheGrid;
end;

procedure TfmQrExportD.btnSalvarClick(Sender: TObject);
begin
   if (svFile.Execute) then
     begin
       if (svFile.FileName <> emptyStr) then
          edNmArquivo.Text := svFile.FileName;
       AdicionaExtensao;
     end;
end;

//101433 : inicio
procedure TfmQrExportD.DataSet(dDataSet: TDataset; piIdReport: Integer);
begin
   dsExport.DataSet := dDataSet;
   iIdReport:= piIdReport;
   PreencheColunas;
   PreencheGrid;
   GeraCabecalho;
end;

procedure TfmQrExportD.DataSet(qry: Twwquery; piIdReport: Integer);
begin
   qryExport := qry;
   dsExport.DataSet := qryExport;
   iIdReport:= piIdReport;
   PreencheColunas;
   PreencheGrid;
   GeraCabecalho;
end;
//101433 : fim


procedure TfmQrExportD.DataSet(cds: TClientDataSet; piIdReport: Integer);
begin
   cdsExport.CloneCursor(cds,true,true);
   dsExport.DataSet := cdsExport;               //101433
   iIdReport:= piIdReport;
   PreencheColunas;
   PreencheGrid;
   GeraCabecalho;
end;

// Alterado por FHBS - 27/03/2020 - SIG94698
procedure TfmQrExportD.DataSet(cds: TClientDataSet; piIdReport: Integer;
                      cdsSub1, cdsSub2, cdsSub3, cdsSub4, cdsSub5, cdsSub6: TClientDataSet);
begin
  if cdsSub1.Active then cdsExportSub1.CloneCursor(cdsSub1, true, true);
  if cdsSub2.Active then cdsExportSub2.CloneCursor(cdsSub2, true, true);
  if cdsSub3.Active then cdsExportSub3.CloneCursor(cdsSub3, true, true);
  if cdsSub4.Active then cdsExportSub4.CloneCursor(cdsSub4, true, true);
  if cdsSub5.Active then cdsExportSub5.CloneCursor(cdsSub5, true, true);
  if cdsSub6.Active then cdsExportSub6.CloneCursor(cdsSub6, true, true);

  DataSet(cds, piIdReport);
end;
// Fim - Alterado por FHBS - 27/03/2020 - SIG94698

procedure TfmQrExportD.PreencheColunas;
 Var
     Item: TListItem;
     i: Integer;
begin
   lstAvailableFields.Items.BeginUpdate;
   lstAvailableFields.Items.Clear;

   for i:= 0 to dsExport.DataSet.FieldCount -1 do
    begin
      Item := lstAvailableFields.Items.Add;
      Item.ImageIndex := 0;
      Item.Caption := PersonalizaCabecalho(i);
      dsExport.DataSet.fields[i].DisplayLabel:= Item.Caption;
      Item.SubItems.Add(dsExport.DataSet.fields[i].fieldname);
      Item.SubItems.Add(Item.Caption);
    end;
   lstAvailableFields.Items.EndUpdate;
end;


procedure TfmQrExportD.PreencheGrid;
var
   lin: Integer;
begin
   LimparGrid(sgrCaptions);
   sgrCaptions.Cells[0, 0]:= 'NOME DO CAMPO';
   sgrCaptions.Cells[1, 0]:= 'DESCRIÇÃO DO CAMPO';
   if (lstExportedFields.Items.Count > 0) then
     begin
        sgrCaptions.RowCount:= lstExportedFields.Items.Count + 1; //Inserido uma linha extra para o cabeçalho
        for lin:= 0 to lstExportedFields.Items.Count -1 do
          begin
            sgrCaptions.Cells[0, lin + 1]:= lstExportedFields.items.Item[lin].SubItems[0];
            sgrCaptions.Cells[1, lin + 1]:= lstExportedFields.items.Item[lin].SubItems[1];
          end;
     end
   else
   if (lstAvailableFields.Items.Count > 0) then
    begin
        sgrCaptions.RowCount:= lstAvailableFields.Items.Count + 1; //Inserido uma linha extra para o cabeçalho
        for lin:= 0 to lstAvailableFields.Items.Count -1 do
          begin
            sgrCaptions.Cells[0, lin + 1]:= lstAvailableFields.items.Item[lin].SubItems[0];
            sgrCaptions.Cells[1, lin + 1]:= lstAvailableFields.items.Item[lin].SubItems[1];
          end;
    end;
end;

procedure TfmQrExportD.LimparGrid(StringGrid: TStringGrid);
var
  i: integer;
begin
  for i:= 1 to StringGrid.RowCount -1 do
  begin
    StringGrid.Rows[i].Clear;
  end;
  StringGrid.RowCount := 2;
end;


procedure TfmQrExportD.btnFecharClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfmQrExportD.btnExportarClick(Sender: TObject);
var
   sRelatorio: TStringlist;
   sLinha,
   sMemo: String;
   sSeparador: String;
   i,
   iTamanho: Integer;
   ArquivoINI: TIniFile;

Procedure LinhaSeparadora;
var
  iQtde: Integer;
  sLinhaSepara: String;
begin
  if (rgExportacao.itemIndex = 2) then
    begin
      cdsCampos.first;
      iQtde:= 0;
      while not(cdsCampos.eof) do
       begin
          iQtde:= iQtde + cdsCampos.fieldbyname('tamanho_campo').asinteger + 1;
          cdsCampos.next;
       end;

      sLinhaSepara:= emptystr;
      while (iQtde > 0) do
        begin
          sLinhaSepara:= sLinhaSepara + '-';
          dec(iQtde);
        end;

        sRelatorio.Add(sLinhaSepara);
    end;
end;

Function IncluirEspacos(sTexto: string; Indice: Integer): String;
var
  iTotalSpaco, iQtde: Integer;
begin
  if (rgExportacao.itemIndex = 2) then
    begin
      if cdsCampos.locate('nm_campo',BuscaDescricaoGrid(dsExport.DataSet.fields[Indice].fieldname), []) then
         iQtde:= cdsCampos.fieldbyname('tamanho_campo').asinteger
      else
         iQtde:= 0;

      iTotalSpaco:= (iQtde - Length(Trim(sTexto)));
      while (iTotalSpaco > 0)do
       begin
          sTexto:= sTexto + ' ';
          dec(iTotalSpaco);
       end;
    end;
   result:= sTexto;
end;

procedure PulaLinha(iQtde: Integer);
begin
   while (iQtde > 0) do
    begin
      sRelatorio.Add(EmptyStr);
      dec(iQtde);
    end;
end;

begin
  inherited;
  if (edNmArquivo.Text = EmptyStr) then
    begin
      Application.MessageBox( 'Informe o nome de destino', 'Exportação',MB_OK + Mb_IconInformation + MB_DEFBUTTON1);
      exit;
    end;

   try
     sRelatorio := TStringlist.create;
     Screen.Cursor:= crSQLWait;
     ArquivoINI := TIniFile.Create(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\DESTACAMENTO.INI');
     case rgExportacao.ItemIndex of
        0: begin
             dsExport.DataSet.First;    //edilaine SIG123112
             GerarExcel(dsExport.DataSet, ArquivoINI);
             exit;
           end;
        1: sSeparador:= ';';
        2: begin
             sSeparador   := '|';
             dsExport.DataSet.First;
             if not(cdsCampos.active) then
                cdsCampos.createdataset
             else
                cdsCampos.emptydataset;

             for i := 0 to dsExport.DataSet.fieldcount -1 do
               begin
                 iTamanho:= Length(BuscaDescricaoGrid(dsExport.DataSet.fields[i].fieldname));
                 dsExport.DataSet.First;
                 while not(dsExport.DataSet.Eof) do
                   begin
                      if (iTamanho < Length(Trim(dsExport.DataSet.fields[i].asstring))) then
                          iTamanho:= Length(Trim(dsExport.DataSet.fields[i].asstring));

                      if cdsCampos.locate('nm_campo',BuscaDescricaoGrid(dsExport.DataSet.fields[i].fieldname),[]) then
                         cdsCampos.edit
                      else begin
                         cdsCampos.insert;
                         cdsCampos.fieldbyname('nm_campo').asstring:= BuscaDescricaoGrid(dsExport.DataSet.fields[i].fieldname);
                      end;
                      cdsCampos.fieldbyname('tamanho_campo').asInteger:= iTamanho;
                      cdsCampos.post;

                      dsExport.DataSet.next;
                   end;
               end;
           end;
     end;
     
     //Cabeçalho
     sRelatorio.Add(memHeader.Lines.text);
     GravaCabecalhoRodapre(ArquivoINI,TCabecalho);

     PulaLinha(1);
     LinhaSeparadora;

     //Cabeçalho das colunas
     for i := 0 to dsExport.DataSet.fieldcount -1 do
        begin
          if PodeGravarCampo(dsExport.DataSet.fields[i].fieldname) then
             sLinha := sLinha + IncluirEspacos(BuscaDescricaoGrid(dsExport.DataSet.fields[i].fieldname), i) + sSeparador;
        end;
     sRelatorio.Add(sLinha);
     LinhaSeparadora;

     dsExport.DataSet.First;
     IniciaBarraProgresso('Exportação de arquivo',dsExport.DataSet.RecordCount);
     while not(dsExport.DataSet.Eof) do
       begin
         sLinha:= EmptyStr;
         for i:= 0 to dsExport.DataSet.fieldcount -1 do
          begin
            if PodeGravarCampo(dsExport.DataSet.Fields[i].fieldname) then
             begin
                if (dsExport.DataSet.Fields[i].DataType <> ftMemo) then
                  sLinha := sLinha + IncluirEspacos(dsExport.DataSet.Fields[i].AsString, i) + sSeparador
                else begin
                  sMemo:= stringreplace(dsExport.DataSet.Fields[i].AsString, #13#10, ' ', [rfReplaceAll, rfIgnoreCase]);
                  sMemo:= stringreplace(sMemo, ';', ' - ', [rfReplaceAll, rfIgnoreCase]);
                  sLinha := sLinha + IncluirEspacos(sMemo,i) + sSeparador;
                end;
             end;
          end;
         sRelatorio.Add(sLinha);
         IncrementaProgresso;
         dsExport.DataSet.Next;
       end;

     //Rodapé
     LinhaSeparadora;
     PulaLinha(1);
     sRelatorio.Add(memFooter.Lines.text);
     GravaCabecalhoRodapre(ArquivoINI,TRodape);

     AdicionaExtensao;

     sRelatorio.SaveToFile(edNmArquivo.Text);
     if (ckbxMostrar.Checked) then
        ShellExecute(handle,'open',PChar(edNmArquivo.Text), '','',SW_SHOWNORMAL);

     Application.MessageBox ('Arquivo Exportado!','Exportação realizada',MB_OK+MB_ICONINFORMATION);
   finally
     FinalizaProgresso;
     FreeAndNil(sRelatorio);
     FreeAndNil(ArquivoINI);
     Screen.Cursor:= crDefault;
   end;
end;

//Procedure TfmQrExportD.GerarExcel(Consulta:TClientDataSet;ArquivoINI: TIniFile);
Procedure TfmQrExportD.GerarExcel(Consulta : TDataSet; ArquivoINI: TIniFile);
var
   coluna,
   colunaI,
   linha,
   iLinha: integer;
   excel: variant;
   valor: string;
   bErro: boolean;    //edilaine SIG101433

Procedure PulaLinha(iQtde: Integer);
begin
  while (iQtde > 0) do
    begin
      inc(iLinha);
      dec(iQtde);
    end;
end;

begin
  bErro := false;    //edilaine SIG101433

  try
     try
        excel:=CreateOleObject('Excel.Application');
        excel.Workbooks.add(1);
        excel.visible:=false;
     except
       begin
         Application.MessageBox ('Versão do Ms-Excel'+
         'Incompatível','Erro',MB_OK+MB_ICONEXCLAMATION);

         bErro := true;    //edilaine SIG101433
       end;
     end;

     Consulta.First;
     try
       //Cabeçalho do relatório
        iLinha:= 1;
        for linha := 0 to memHeader.Lines.Count -1 do
          begin
            valor := memHeader.Lines[linha];
            excel.cells [iLinha,1] := valor;
            excel.cells [iLinha,1].Font.Bold   := true;
            excel.cells [iLinha,1].Font.Italic := False;
            PulaLinha(1);
          end;
          GravaCabecalhoRodapre(ArquivoINI,TCabecalho);

       PulaLinha(1);

       //Cabeçalho das colunas
       colunaI:= 1;
       for coluna := 0 to Consulta.fieldcount -1 do
        begin
            if PodeGravarCampo(Consulta.fields[coluna].fieldname) then
               begin
                  valor := BuscaDescricaoGrid(Consulta.fields[coluna].fieldname);
                  excel.cells[iLinha, colunaI]:= valor;
                  excel.cells[iLinha, colunaI].Font.Bold := True;
                  excel.cells[iLinha, colunaI].ColumnWidth:= GetLength(valor, ftString) ;

                  //edilaine SIG100890 : inicio
                  if Consulta.fields[coluna].DataType = ftDateTime then
                     excel.WorkBooks[1].WorkSheets[1].Columns[colunaI].NumberFormat := 'DD/MM/AAAA'
                  else if Consulta.fields[coluna].DataType <> ftFloat then
                     excel.WorkBooks[1].WorkSheets[1].Columns[colunaI].NumberFormat := '@';
                  //edilaine SIG100890 : fim

                  inc(colunaI);
               end;
        end;

        PulaLinha(1);

        //Corpo da tabela
        IniciaBarraProgresso('Exportação de arquivo',Consulta.RecordCount);
        for linha := 0 to Consulta.RecordCount-1 do
        begin
            colunaI:= 1;
            for coluna:= 0 to Consulta.FieldCount -1 do
            begin
               if PodeGravarCampo(Consulta.Fields[coluna].fieldname) then
                 begin
                   valor:= Consulta.Fields[coluna].AsString;
                   if Consulta.fields[coluna].DataType = ftFloat then
                     begin
                       excel.cells[iLinha, colunaI] := Consulta.Fields[coluna].AsFloat;
                     end
                   // Inicio SIG 125148 Ferrari
                   else if (Consulta.fields[coluna].DataType = ftDateTime) and (valor <> '') then
                      excel.cells[iLinha, colunaI] := Consulta.Fields[coluna].AsDateTime
                   // Fim
                   else
                      excel.cells[iLinha, colunaI] := valor;
                   //Taffarel - SIG86562 - início
                   //excel.cells[iLinha, colunaI].VerticalAlignment := 1; //Alinhamento no topo
                   //excel.cells[iLinha, colunaI].Font.Bold := false;
                   //excel.cells[iLinha, colunaI].WrapText := true;
                   //excel.cells[iLinha, colunaI].ColumnWidth:= GetLength(valor, Consulta.Fields[coluna].DataType);
                   //Taffarel - SIG86562 - fim
                   inc(colunaI);
                 end;
            end;
            IncrementaProgresso;
            Consulta.Next;
            PulaLinha(1);
        end;

        excel.columns.AutoFit;
        PulaLinha(1);

        //Rodapé
        for linha := 0 to memFooter.Lines.Count -1 do
          begin
            valor := memFooter.Lines[linha];
            excel.cells [iLinha,1] := valor;
            excel.cells [iLinha,1].Font.Italic := True; 
            PulaLinha(1);
          end;
          GravaCabecalhoRodapre(ArquivoINI,TRodape);

       // Alterado por FHBS - 27/03/2020 - SIG94698
       if cdsExportSub1.Active then ComplementaExcel(cdsExportSub1, Excel, 1);
       if cdsExportSub2.Active then ComplementaExcel(cdsExportSub2, Excel, 2);
       if cdsExportSub3.Active then ComplementaExcel(cdsExportSub3, Excel, 3);
       if cdsExportSub4.Active then ComplementaExcel(cdsExportSub4, Excel, 4);
       if cdsExportSub5.Active then ComplementaExcel(cdsExportSub5, Excel, 5);
       if cdsExportSub6.Active then ComplementaExcel(cdsExportSub6, Excel, 6);
       // Fim - Alterado por FHBS - 27/03/2020 - SIG94698

       //edilaine SIG103891 : inicio
       if dsExportSub1.dataset <> nil then     //edilaine SIG116929
          if dsExportSub1.dataset.Active then ComplementaExcel(dsExportSub1.dataset, Excel, 1);
       if dsExportSub2.dataset <> nil then     //edilaine SIG116929
          if dsExportSub2.dataset.Active then ComplementaExcel(dsExportSub2.dataset, Excel, 1);
       if dsExportSub3.dataset <> nil then     //edilaine SIG116929
          if dsExportSub3.dataset.Active then ComplementaExcel(dsExportSub3.dataset, Excel, 1);
       if dsExportSub4.dataset <> nil then     //edilaine SIG116929
          if dsExportSub4.dataset.Active then ComplementaExcel(dsExportSub4.dataset, Excel, 1);
       if dsExportSub5.dataset <> nil then     //edilaine SIG116929
          if dsExportSub5.dataset.Active then ComplementaExcel(dsExportSub5.dataset, Excel, 1);
       if dsExportSub6.dataset <> nil then     //edilaine SIG116929
          if dsExportSub6.dataset.Active then ComplementaExcel(dsExportSub6.dataset, Excel, 1);
       //edilaine SIG103891 : fim

       AdicionaExtensao;

       Excel.WorkBooks[1].SaveAs(edNmArquivo.Text);

       //edilaine SIG101433 : inicio
       {if (ckbxMostrar.Checked) then
         ShellExecute(handle,'open',PChar(edNmArquivo.Text), '','',SW_SHOWNORMAL);
       }//edilaine SIG101433 : fim

       FinalizaProgresso;       //edilaine SIG100890

       Application.MessageBox ('Arquivo Exportado!','Exportação realizada',MB_OK+MB_ICONINFORMATION);
     except
       begin
          Application.MessageBox ('Aconteceu um erro desconhecido durante a conversão'+
          'da tabela para o Ms-Excel','Erro',MB_OK+MB_ICONERROR);

          bErro := true;    //edilaine SIG101433
       end;
     end;
  finally
     FinalizaProgresso;
     Excel.WorkBooks.Close;
     Excel.Quit;

     if (not bErro) and (ckbxMostrar.Checked) then
       ShellExecute(handle,'open',PChar(edNmArquivo.Text), '','',SW_SHOWNORMAL);

  end;
end;

// Alterado por FHBS - 27/03/2020 - SIG94698
//procedure TfmQrExportD.ComplementaExcel(Consulta: TClientDataSet; var Excel: variant; SubNro: Integer);
procedure TfmQrExportD.ComplementaExcel(Consulta: TDataSet; var Excel: variant; SubNro: Integer);
var
  coluna,
  colunaI,
  linha,
  iLinha: integer;
  valor: string;

  Procedure PulaLinha(iQtde: Integer);
  begin
    while (iQtde > 0) do
      begin
        inc(iLinha);
        dec(iQtde);
      end;
  end;

begin
  Excel.Workbooks[1].Sheets.Add;

  Consulta.First;

  //Cabeçalho do relatório
  iLinha:= 1;

  PulaLinha(1);

  //Cabeçalho das colunas
  colunaI:= 1;
  for coluna := 0 to Consulta.fieldcount -1 do
  begin
    valor := Consulta.fields[coluna].FieldName;
    Excel.cells[iLinha, colunaI]:= valor;
    Excel.cells[iLinha, colunaI].Font.Bold := True;
    Excel.cells[iLinha, colunaI].ColumnWidth:= GetLength(valor, ftString) ;
    inc(colunaI);
  end;

  PulaLinha(1);

  //Corpo da tabela
  IniciaBarraProgresso('Exportação da subconsulta', Consulta.RecordCount);
  for linha := 0 to Consulta.RecordCount-1 do
  begin
    colunaI:= 1;
    for coluna:= 0 to Consulta.FieldCount -1 do
    begin
      valor:= Consulta.Fields[coluna].AsString;
      excel.cells[iLinha, colunaI]:=valor;
      inc(colunaI);
    end;
    IncrementaProgresso;
    Consulta.Next;
    PulaLinha(1);
  end;

  Excel.columns.AutoFit;
  PulaLinha(1);

end;
// Fim - Alterado por FHBS - 27/03/2020 - SIG94698

Function TfmQrExportD.PersonalizaCabecalho(Indice: Integer): String;
var
   i: Integer;
begin
   if (iIdReport = 4074) then
     begin
       if (upperCase(dsExport.DataSet.fields[Indice].FieldName) = 'NUMERO_INTERNO') then
          result:= 'Nº INTERNO'
       else if (upperCase(dsExport.DataSet.fields[Indice].FieldName) = 'MATRICULA') then
          result:= 'MATR.'
       else if (upperCase(dsExport.DataSet.fields[Indice].FieldName) = 'LOTACAO') then
          result:= 'LOTAÇÃO'
       else if (upperCase(dsExport.DataSet.fields[Indice].FieldName) = 'DT_VENC_AP') then
          result:= 'DT VENC. AP'
       else if (upperCase(dsExport.DataSet.fields[Indice].FieldName) = 'PART_DIA_ANT') then
          result:= 'DA'
       else if (upperCase(dsExport.DataSet.fields[Indice].FieldName) = 'RET_DIA_POST') then
          result:= 'DP'
       else if (upperCase(dsExport.DataSet.fields[Indice].FieldName) = 'OBJETIVO_PRINCIPAL') then
          result:= 'OBJ. PRINCIPAL'
       else if (upperCase(dsExport.DataSet.fields[Indice].FieldName) = 'VALOR_TAXI') then
          result:= 'TÁXI'
       else if (upperCase(dsExport.DataSet.fields[Indice].FieldName) = 'VALOR_DIARIA') then
          result:= 'DIÁRIA'
       else if (upperCase(dsExport.DataSet.fields[Indice].FieldName) = 'VALOR_TRANPORTE') then
          result:= 'TRANSP.'
       else if (upperCase(dsExport.DataSet.fields[Indice].FieldName) = 'TOTAL_ADIANTEMENTO') then
          result:= 'TOTAL ADIANT.'
       else
         result:= upperCase(stringreplace(dsExport.DataSet.fields[Indice].FieldName, '_', ' ', [rfReplaceAll, rfIgnoreCase]));
     end
   else result:= upperCase(dsExport.DataSet.fields[Indice].FieldName)
end;

function TfmQrExportD.GetLength(sCampo: String; tipo: TFieldType): Integer;
begin
  if (tipo = ftMemo) then
     result:= 50
  else
    result:= 18;
end;

function TfmQrExportD.PodeGravarCampo(sCampo: String): Boolean;
var
  bGrava: Boolean;
  i: integer;
begin
  bGrava := false;
  for i:= 0 to sgrCaptions.rowcount -1 do
    begin
      if (Trim(sgrCaptions.Cells[0,i]) =  Trim(sCampo))  then
        begin
          bGrava:= true;
          break;
        end;
    end;
  result:= bGrava;
end;

procedure TfmQrExportD.FormCreate(Sender: TObject);
begin
  inherited;
  PageControl1.activepage:= tbsType;
end;

function TfmQrExportD.BuscaDescricaoGrid(sCampo: String): String;
var
  i:Integer;
begin
  result:= emptystr;
  for i:= 0 to sgrCaptions.rowcount -1 do
    begin
      if (Trim(sgrCaptions.Cells[0,i]) =  Trim(sCampo))  then
        begin
          result:= Trim(sgrCaptions.Cells[1,i]);
          break;
        end;
    end;
end;


procedure TfmQrExportD.rgExportacaoClick(Sender: TObject);
var
  sFormato: String;
begin
  inherited;
  AdicionaExtensao;
end;

procedure TfmQrExportD.AdicionaExtensao;
var
  sFormato: String;
begin
  sFormato:= emptystr;
  if (edNmArquivo.text<> emptystr) then
   begin
     case rgExportacao.ItemIndex of
       0: sFormato:= '.xlsx';   //101433
       1: sFormato:= '.csv';
       2: sFormato:= '.txt';
     end;

     if (sFormato <> emptystr) then
      begin
        if (UpperCase(extractfileext(edNmArquivo.Text)) = emptystr) then
           edNmArquivo.Text := edNmArquivo.Text + sFormato;

        edNmArquivo.text:= stringreplace(edNmArquivo.text, '.xlsx', sFormato, [rfReplaceAll, rfIgnoreCase]);
        edNmArquivo.text:= stringreplace(edNmArquivo.text, '.csv', sFormato, [rfReplaceAll, rfIgnoreCase]);
        edNmArquivo.text:= stringreplace(edNmArquivo.text, '.txt', sFormato, [rfReplaceAll, rfIgnoreCase]);
      end;
   end;
end;

procedure TfmQrExportD.IniciaBarraProgresso(sCaption: String; iMax: Integer);
begin
   frmAguarde.Mostra(sCaption);
   frmAguarde.Max := iMax;
   frmAguarde.Min := 0;
   frmAguarde.Pos := frmAguarde.Min;
end;

procedure TfmQrExportD.FinalizaProgresso;
begin
  frmAguarde.Apaga;
end;

procedure TfmQrExportD.IncrementaProgresso;
begin
  frmAguarde.Pos:=  frmAguarde.Pos + 1;
end;

procedure TfmQrExportD.GeraCabecalho;
begin
  if (iIdReport = 4074) then
     begin
       memHeader.Lines.Clear;
       memHeader.Lines.add('FUNDAÇÃO DOS ECONOMIÁRIOS FEDERAIS');
       memHeader.Lines.add('SCN, Quadra 2, Bloco A Edifício Corporate Financial Center 12 e 13 Andares');
       memHeader.Lines.add('Brasília  DF CEP 70.712-900-000 - (061)3329-1700 - www.funcef.com.br');
       memHeader.Lines.add('Destacamentos');

       memFooter.Lines.Clear;
       memFooter.Lines.add('DA - Partida no dia anterior');
       memFooter.Lines.add('DP - Retorno no dia posterior');
       memFooter.Lines.add('Obs.: No campo "Destino" está sendo considerado o percurso de ida, porém quando  a ida');
       memFooter.Lines.add('e a volta são no mesmo dia, o trecho apresentado é do percurso todo');
     end;
end;

procedure TfmQrExportD.GravaCabecalhoRodapre(ArquivoINI: TIniFile; Tipo: TDocsIni);
var
  x: Integer;
begin
   if (Tipo =  TCabecalho) then
     begin
       ArquivoINI.EraseSection('CONFIGURACAO');
       ArquivoINI.WriteString('CONFIGURACAO', 'TOTALLINHASCABECALHO', IntToStr(memHeader.Lines.Count));
       for x := 0 to memHeader.Lines.Count -1 do
          ArquivoINI.WriteString('CONFIGURACAO', 'CABECALHO' + InttoStr(x), memHeader.Lines[x]);
     end
   else if (Tipo =  TRodape) then begin
      ArquivoINI.WriteString('CONFIGURACAO', 'TOTALLINHASRODAPE', IntToStr(memFooter.Lines.Count));
      for x := 0 to memHeader.Lines.Count -1 do
          ArquivoINI.WriteString('CONFIGURACAO', 'RODAPE' + InttoStr(x), memFooter.Lines[x]);
   end;

end;

//edilaine SIG103891 : inicio
procedure TfmQrExportD.DataSet(dDataSet: TDataset; piIdReport: Integer;
  dDataSetSub1, dDataSetSub2, dDataSetSub3, dDataSetSub4, dDataSetSub5,
  dDataSetSub6: TDataset);
begin
  dsExportSub1.DataSet := dDataSetSub1;
  dsExportSub2.DataSet := dDataSetSub2;
  dsExportSub3.DataSet := dDataSetSub3;
  dsExportSub4.DataSet := dDataSetSub4;
  dsExportSub5.DataSet := dDataSetSub5;
  dsExportSub6.DataSet := dDataSetSub6;

  DataSet(dDataSet, piIdReport);
end;
//edilaine SIG103891 : fim


end.
