{-----------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------- Histórico de alterações -------------------------------------------------------------
Rotina......: criação unit
Nº SIG......: 115304
Data MERGE  : 25/01/2023                                                                               
Data........: 07/07/2022
Responsável.: edilaine
Descrição...: Contabilização da Provisão de Perdas para Dívidas Beneficio
-----------------------------------------------------------------------------------------------------------------------------------}

unit fExportDManual;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FTelaAut, StdCtrls, Buttons, ComCtrls, ExtCtrls, IvDictio, IvMulti,
  IvEMulti, Grids, DBClient,  Db, DBTables, Wwquery, ImgList,comobj,shellapi,fAguarde,
  IniFiles, uSistema ;

type
  TDocsIni = (TCabecalho, TRodape);
  TfmQrExportDManual = class(TfrmTelaAutorizacao)
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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
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
    //Procedure GerarExcel(Consulta:TDataSet; ArquivoINI: TIniFile);
    Procedure GerarExcel(Consulta:TDataSet);
    Procedure ComplementaExcel(Consulta: TDataSet; var Excel: variant; SubNro: Integer);

    Procedure GeraCabecalho;
    Function  PersonalizaCabecalho(Indice: Integer): String;
    Function GetLength(sCampo: String; tipo: TFieldType): Integer;
    Function PodeGravarCampo(sCampo: String): Boolean;
    Function BuscaDescricaoGrid(sCampo: String): String;
    Procedure AdicionaExtensao;
    Procedure GravaCabecalhoRodapre(ArquivoINI: TIniFile; Tipo: TDocsIni);
  public
    lstCamposNaoExportar : TStringList;
    lstNomeCampos        : TStringList;
    lstNomeColunas       : TStringList;
    bGeraCabecalho       : boolean;
    sTituloExporta       : string;

    procedure DataSet(dDataSet: TDataset; piIdReport: Integer; bAplicaFiltro : boolean = false); overload;
    procedure DataSet(qry: Twwquery; piIdReport: Integer); overload;
    Procedure DataSet(cds: TClientDataSet; piIdReport: Integer); overload;
    Procedure DataSet(cds: TClientDataSet; piIdReport: Integer;
                      cdsSub1, cdsSub2, cdsSub3, cdsSub4, cdsSub5, cdsSub6: TClientDataSet); overload;

    Procedure DataSet(dDataSet: TDataset; piIdReport: Integer;
                      dDataSetSub1, dDataSetSub2, dDataSetSub3, dDataSetSub4, dDataSetSub5, dDataSetSub6: TDataset); overload;

  end;

var
  fmQrExportDManual: TfmQrExportDManual;

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
procedure TfmQrExportDManual.MoveListItems(LtOrigem, LtDestino: TListView; indiceImagem: Integer);
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
procedure TfmQrExportDManual.MoveListItem(LtOrigem, LtDestino: TListView;
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

procedure TfmQrExportDManual.bAddOneExportedFieldClick(Sender: TObject);
begin
  inherited;
  MoveListItem(lstAvailableFields,lstExportedFields, 1);
  PreencheGrid;
end;

procedure TfmQrExportDManual.bAddAllExportedFieldClick(Sender: TObject);
begin
  inherited;
  MoveListItems(lstAvailableFields, lstExportedFields, 1);
  PreencheGrid;
end;

procedure TfmQrExportDManual.bDelOneExportedFieldClick(Sender: TObject);
begin
  inherited;
  MoveListItem(lstExportedFields, lstAvailableFields, 0);
  PreencheGrid;
end;

procedure TfmQrExportDManual.bDelAllExportedFieldClick(Sender: TObject);
begin
  inherited;
  MoveListItems(lstExportedFields, lstAvailableFields, 0);
  PreencheGrid;
end;

procedure TfmQrExportDManual.btnSalvarClick(Sender: TObject);
begin
   if (svFile.Execute) then
     begin
       if (svFile.FileName <> emptyStr) then
          edNmArquivo.Text := svFile.FileName;
       AdicionaExtensao;
     end;
end;


procedure TfmQrExportDManual.DataSet(dDataSet: TDataset; piIdReport: Integer; bAplicaFiltro : boolean = false);
begin
   dsExport.DataSet := dDataSet;
   dsExport.DataSet.Filtered := bAplicaFiltro;
   iIdReport:= piIdReport;
   PreencheColunas;
   PreencheGrid;
   GeraCabecalho;
end;

procedure TfmQrExportDManual.DataSet(qry: Twwquery; piIdReport: Integer);
begin
   qryExport := qry;
   dsExport.DataSet := qryExport;
   iIdReport:= piIdReport;
   PreencheColunas;
   PreencheGrid;
   GeraCabecalho;
end;



procedure TfmQrExportDManual.DataSet(cds: TClientDataSet; piIdReport: Integer);
begin
   cdsExport.CloneCursor(cds,true,true);
   dsExport.DataSet := cdsExport;
   iIdReport:= piIdReport;
   PreencheColunas;
   PreencheGrid;
   GeraCabecalho;
end;


procedure TfmQrExportDManual.DataSet(cds: TClientDataSet; piIdReport: Integer;
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


procedure TfmQrExportDManual.PreencheColunas;
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


procedure TfmQrExportDManual.PreencheGrid;
var
   lin : Integer;
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
            if lstNomeColunas.count > 0 then
            begin
              sgrCaptions.Cells[1, lin + 1]:= lstNomeColunas.Values[lstExportedFields.items.Item[lin].SubItems[0]];
            end
            else
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
            if lstNomeColunas.count > 0 then
            begin
              sgrCaptions.Cells[1, lin + 1]:= lstNomeColunas.Values[lstAvailableFields.items.Item[lin].SubItems[0]];
            end
            else
               sgrCaptions.Cells[1, lin + 1]:= lstAvailableFields.items.Item[lin].SubItems[1];
          end;
    end;
end;

procedure TfmQrExportDManual.LimparGrid(StringGrid: TStringGrid);
var
  i: integer;
begin
  for i:= 1 to StringGrid.RowCount -1 do
  begin
    StringGrid.Rows[i].Clear;
  end;
  StringGrid.RowCount := 2;
end;


procedure TfmQrExportDManual.btnFecharClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfmQrExportDManual.btnExportarClick(Sender: TObject);
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
     //ArquivoINI := TIniFile.Create(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\DESTACAMENTO.INI');
     case rgExportacao.ItemIndex of
        0: begin
             dsExport.DataSet.First;
             GerarExcel(dsExport.DataSet);
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
     //GravaCabecalhoRodapre(ArquivoINI,TCabecalho);

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
     //GravaCabecalhoRodapre(ArquivoINI,TRodape);

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
Procedure TfmQrExportDManual.GerarExcel(Consulta : TDataSet);
var
   coluna,
   colunaI,
   linha,
   iLinha: integer;
   excel: variant;
   valor: string;
   bErro: boolean;

Procedure PulaLinha(iQtde: Integer);
begin
  while (iQtde > 0) do
    begin
      inc(iLinha);
      dec(iQtde);
    end;
end;

begin
  bErro := false;

  try
     try
        excel:=CreateOleObject('Excel.Application');
        excel.Workbooks.add(1);
        excel.visible:=false;
     except
       begin
         Application.MessageBox ('Versão do Ms-Excel'+
         'Incompatível','Erro',MB_OK+MB_ICONEXCLAMATION);

         bErro := true;
       end;
     end;

     Consulta.First;
     try
       //Cabeçalho do relatório
       iLinha:= 1;
       if memHeader.Lines.Count > 0 then
       begin
         for linha := 0 to memHeader.Lines.Count -1 do
           begin
             valor := memHeader.Lines[linha];
             excel.cells [iLinha,1] := valor;
             excel.cells [iLinha,1].Font.Bold   := true;
             excel.cells [iLinha,1].Font.Italic := False;
             PulaLinha(1);
         end;
         //GravaCabecalhoRodapre(ArquivoINI,TCabecalho);

         PulaLinha(1);
       end;

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

                  if Consulta.fields[coluna].DataType = ftDateTime then
                     excel.WorkBooks[1].WorkSheets[1].Columns[colunaI].NumberFormat := 'DD/MM/AAAA'
                  else if Consulta.fields[coluna].DataType <> ftFloat then
                     excel.WorkBooks[1].WorkSheets[1].Columns[colunaI].NumberFormat := '@';

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
          //GravaCabecalhoRodapre(ArquivoINI,TRodape);

       if cdsExportSub1.Active then ComplementaExcel(cdsExportSub1, Excel, 1);
       if cdsExportSub2.Active then ComplementaExcel(cdsExportSub2, Excel, 2);
       if cdsExportSub3.Active then ComplementaExcel(cdsExportSub3, Excel, 3);
       if cdsExportSub4.Active then ComplementaExcel(cdsExportSub4, Excel, 4);
       if cdsExportSub5.Active then ComplementaExcel(cdsExportSub5, Excel, 5);
       if cdsExportSub6.Active then ComplementaExcel(cdsExportSub6, Excel, 6);

       if dsExportSub1.dataset <> nil then
          if dsExportSub1.dataset.Active then ComplementaExcel(dsExportSub1.dataset, Excel, 1);
       if dsExportSub2.dataset <> nil then
          if dsExportSub2.dataset.Active then ComplementaExcel(dsExportSub2.dataset, Excel, 1);
       if dsExportSub3.dataset <> nil then
          if dsExportSub3.dataset.Active then ComplementaExcel(dsExportSub3.dataset, Excel, 1);
       if dsExportSub4.dataset <> nil then
          if dsExportSub4.dataset.Active then ComplementaExcel(dsExportSub4.dataset, Excel, 1);
       if dsExportSub5.dataset <> nil then
          if dsExportSub5.dataset.Active then ComplementaExcel(dsExportSub5.dataset, Excel, 1);
       if dsExportSub6.dataset <> nil then
          if dsExportSub6.dataset.Active then ComplementaExcel(dsExportSub6.dataset, Excel, 1);

       AdicionaExtensao;

       Excel.WorkBooks[1].SaveAs(edNmArquivo.Text);

       FinalizaProgresso;

       Application.MessageBox ('Arquivo Exportado!','Exportação realizada',MB_OK+MB_ICONINFORMATION);
     except
       begin
          Application.MessageBox ('Aconteceu um erro desconhecido durante a conversão'+
          'da tabela para o Ms-Excel','Erro',MB_OK+MB_ICONERROR);

          bErro := true;
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

procedure TfmQrExportDManual.ComplementaExcel(Consulta: TDataSet; var Excel: variant; SubNro: Integer);
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


Function TfmQrExportDManual.PersonalizaCabecalho(Indice: Integer): String;
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

function TfmQrExportDManual.GetLength(sCampo: String; tipo: TFieldType): Integer;
begin
  if (tipo = ftMemo) then
     result:= 50
  else
    result:= 18;
end;

function TfmQrExportDManual.PodeGravarCampo(sCampo: String): Boolean;
var
  i: integer;
begin
  result := (lstCamposNaoExportar.IndexOf( UpperCase(sCampo) ) = -1);
end;

procedure TfmQrExportDManual.FormCreate(Sender: TObject);
begin
  inherited;
  PageControl1.activepage:= tbsType;
  lstCamposNaoExportar := TStringList.create;
  lstNomeColunas       := TStringList.create;
  lstNomeCampos        := TStringList.create;
end;

function TfmQrExportDManual.BuscaDescricaoGrid(sCampo: String): String;
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


procedure TfmQrExportDManual.rgExportacaoClick(Sender: TObject);
var
  sFormato: String;
begin
  inherited;
  AdicionaExtensao;
end;

procedure TfmQrExportDManual.AdicionaExtensao;
var
  sFormato: String;
begin
  sFormato:= emptystr;
  if (edNmArquivo.text<> emptystr) then
   begin
     case rgExportacao.ItemIndex of
       0: sFormato:= '.xlsx';
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

procedure TfmQrExportDManual.IniciaBarraProgresso(sCaption: String; iMax: Integer);
begin
   frmAguarde.Mostra(sCaption);
   frmAguarde.Max := iMax;
   frmAguarde.Min := 0;
   frmAguarde.Pos := frmAguarde.Min;
end;

procedure TfmQrExportDManual.FinalizaProgresso;
begin
  frmAguarde.Apaga;
end;

procedure TfmQrExportDManual.IncrementaProgresso;
begin
  frmAguarde.Pos:=  frmAguarde.Pos + 1;
end;

procedure TfmQrExportDManual.GeraCabecalho;
begin
  if (bGeraCabecalho) then
     begin
       memHeader.Lines.Clear;
       memHeader.Lines.add('FUNDAÇÃO DOS ECONOMIÁRIOS FEDERAIS');
       memHeader.Lines.add('SCN, Quadra 2, Bloco A Edifício Corporate Financial Center 12 e 13 Andares');
       memHeader.Lines.add('Brasília  DF CEP 70.712-900-000 - (061)3329-1700 - www.funcef.com.br');
       memHeader.Lines.add('');
       if sTituloExporta <> '' then
          memHeader.Lines.add(sTituloExporta);

       //memFooter.Lines.Clear;
       //memFooter.Lines.add('DA - Partida no dia anterior');
       //memFooter.Lines.add('DP - Retorno no dia posterior');
       //memFooter.Lines.add('Obs.: No campo "Destino" está sendo considerado o percurso de ida, porém quando  a ida');
       //memFooter.Lines.add('e a volta são no mesmo dia, o trecho apresentado é do percurso todo');
     end;
end;

procedure TfmQrExportDManual.GravaCabecalhoRodapre(ArquivoINI: TIniFile; Tipo: TDocsIni);
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


procedure TfmQrExportDManual.DataSet(dDataSet: TDataset; piIdReport: Integer;
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


procedure TfmQrExportDManual.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(lstCamposNaoExportar);
  FreeAndNil(lstNomeColunas);
  FreeAndNil(lstNomeCampos);
end;

procedure TfmQrExportDManual.FormShow(Sender: TObject);
begin
  inherited;
  PreencheGrid;
end;

end.                                                                 -
