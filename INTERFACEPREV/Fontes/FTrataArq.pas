{-----------------------------------------------------------------------------
Autor(a)    :  Henrique Massão
Data        :  27/02/2009
Pendência   :  SOL 109421 KINTANA 496332
Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C:
------------------------------------------------------------------------------}
unit FTrataArq;

interface


uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, URegra, DBTables, CheckLst, TreeWzd, ComCtrls,
  wwriched, wwdblook, wwdbdatetimepicker, CMDateTimePicker, Db, Wwtable,
  DBClient,  uCMClientDataSet,  uCmControlObject, uCtrlImportaFinanc,
  uDbTaberrosccp,  Wwquery, uCmSqlParams, Grids, DBGrids, Wwdatsrc,
  ppCtrls, ppBands, ppClass, ppVar, ppPrnabl, ppCache, ppProd, ppReport,
  ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE   ;

type
  TfrmTrataArq = class(TfrmSairAjuda)
    Panel2: TPanel;
    lblArquivoPatro: TLabel;
    SpeedButton1: TSpeedButton;
    edTxt: TEdit;
    Panel1: TPanel;
    Panel3: TPanel;
    odTxt: TOpenDialog;
    SaveDialog1: TSaveDialog;
    bmPatro: TBatchMove;
    tblTxt: TwwTable;
    tblDbf: TwwTable;
    ToolbarSep971: TToolbarSep97;
    ToolbarSep972: TToolbarSep97;
    cdsPatro: TCMClientDataSet;
    cdsAux: TCMClientDataSet;
    cdsDadosArquivo: TCMClientDataSet;
    qryTxt: TwwQuery;
    SqlParam: TCMSqlParams;
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    bbtnRel: TBitBtn;
    dstxt: TwwDataSource;
    lblPatrocinadora: TLabel;
    dblkPatrocinadora: TwwDBLookupCombo;
    qryFundacao: TwwQuery;
    dsFundacao: TwwDataSource;
    dsTrataArq: TwwDataSource;
    ppTrataArq: TppBDEPipeline;
    rpTrataArq: TppReport;
    ppHeaderBand19: TppHeaderBand;
    lbltitulocriticas: TppLabel;
    ppLine46: TppLine;
    ppDBImage11: TppDBImage;
    ppDBText143: TppDBText;
    ppDBText144: TppDBText;
    ppDBText145: TppDBText;
    ppDBText146: TppDBText;
    ppDBText147: TppDBText;
    ppDBText148: TppDBText;
    ppDBText149: TppDBText;
    ppLabel165: TppLabel;
    ppDBText150: TppDBText;
    ppDetailBand16: TppDetailBand;
    ppDBText151: TppDBText;
    ppDBText152: TppDBText;
    ppFooterBand19: TppFooterBand;
    ppLine47: TppLine;
    ppLabel166: TppLabel;
    ppSystemVariable23: TppSystemVariable;
    ppSystemVariable24: TppSystemVariable;
    ppFundacao: TppBDEPipeline;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppDBText1: TppDBText;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLabel4: TppLabel;
    ppDBText3: TppDBText;
    ppLabel5: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppLabel6: TppLabel;
    qryTxtPlano: TStringField;
    qryTxtRubrica: TStringField;
    qryTxtValor: TFloatField;
    qryTxtNomePlano: TStringField;
    qryTxtNomeRubrica: TStringField;
    ppLine1: TppLine;
    procedure SpeedButton1Click(Sender: TObject);
    procedure bbtnRelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnCalculaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edTxtChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure qryTxtCalcFields(DataSet: TDataSet);
  private
    CtrlImportaFinanc : TCtrlImportaFinanc;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTrataArq: TfrmTrataArq;
  sCamposDBF  : string ;






implementation

uses dRelatorios, UMensErro, USistema, UAdmprev , DBaseDados, UDataBase,
  fAguarde;

{$R *.DFM}

procedure TfrmTrataArq.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  odTxt.Execute;
  edTxt.Text := odTxt.FileName;
  edTxt.Hint := edTxt.Text;
  if (edtxt.Font.Size * length(edtxt.text)) > edtxt.Width then
     edTxt.ShowHint := true
  else
  edTxt.ShowHint := false;
end;

procedure TfrmTrataArq.bbtnRelClick(Sender: TObject);
begin
  inherited;

  if not qrytxt.Active then
  begin
     MsgDlg('A consulta não foi gerada.','Erro',mtError,[mbOk],0);
     exit;
  end;

  lbltitulocriticas.caption := 'Arquivo Financeiro em: '+edTxt.text+'';

  qryFundacao.Close;
  qryFundacao.ParamByName('pFundacao').AsInteger := uAdmPrev.iIdFundacao;
  qryFundacao.Open;


  rpTrataArq.Print;


end;

procedure TfrmTrataArq.FormCreate(Sender: TObject);
begin
  inherited;
  //Henrique Massão
  Odtxt.InitialDir:=Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\';
  CtrlImportaFinanc := TCtrlImportaFinanc.Create;
  CtrlImportaFinanc.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                   Sistema.AppRemoteServer,True,nil,nil,False);

  cdsPatro.Data := CtrlImportaFinanc.ListaPatro;

end;

procedure TfrmTrataArq.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CtrlImportaFinanc.free;
  inherited;

end;

procedure TfrmTrataArq.bbtnCalculaClick(Sender: TObject);
   function GeraArquivoSchema(sArquivo: string): Boolean;
   var i : integer;
   begin
     Result := True;
     i := 1;
     try
      with TStringList.Create do
      begin
        Add('[' + Copy(ExtractFileName(Trim(sArquivo)), 1, Length(ExtractFileName(Trim(sArquivo))) - 4) + ']');

        Add('Filetype=Fixed');
        Add('CharSet=ascii');


        ///
        /// Gerar Schema de acesso ao arquivo
        /// Só insiro o registro no schema se o mesmo não possuir inicio = 1000
        ///

        //Campo especial para especificar qual o Tipo de Lançamento que está vindo no Txt;
        if cdsDadosArquivo.FieldByName('FLGLANCAMENTO').AsString = 'S' then begin
           if Trim(cdsDadosArquivo.FieldByName('POSLANCAMENTO').AsString) <> '1000' then begin
              Add('Field'+inttostr(i)+'=LANCAMENTO,Char, 1, 00, ' + Trim(cdsDadosArquivo.FieldByName('POSLANCAMENTO').AsString));
              sCamposDBF := sCamposDBF + 'DBF.LANCAMENTO, ';
              inc(i);
           end;
        end;



        if Trim(cdsDadosArquivo.FieldByName('INICIOSEQINTERFA').AsString) <> '1000' then begin
           Add('Field'+inttostr(i)+'=SEQINTERFA,Char,' + Trim(cdsDadosArquivo.FieldByName('SEQINTERFA').AsString) + ',00,' +
                                           Trim(cdsDadosArquivo.FieldByName('INICIOSEQINTERFA').AsString) );
           sCamposDBF := sCamposDBF + 'DBF.SEQINTERFA, ';
           inc(i);
        end;

        if Trim(cdsDadosArquivo.FieldByName('INIPATRO').AsString) <> '1000' then begin
           Add('Field'+inttostr(i)+'=PATRO,Char,' + Trim(cdsDadosArquivo.FieldByName('PATRO').AsString) + ',00,' +
                                      Trim(cdsDadosArquivo.FieldByName('INIPATRO').AsString) );
           sCamposDBF := sCamposDBF + 'DBF.PATRO, ';
           inc(i);
        end;

        if Trim(cdsDadosArquivo.FieldByName('INIMESREF').AsString) <> '1000' then begin
           Add('Field'+inttostr(i)+'=MESREF,Char,' + Trim(cdsDadosArquivo.FieldByName('MESREF').AsString) + ',00,' +
                                       Trim(cdsDadosArquivo.FieldByName('INIMESREF').AsString) );
           sCamposDBF := sCamposDBF + 'DBF.MESREF, ';
           inc(i);
        end;

        if Trim(cdsDadosArquivo.FieldByName('INIDATAREF').AsString) <> '1000' then begin
           Add('Field'+inttostr(i)+'=DATAREF,Char,' + Trim(cdsDadosArquivo.FieldByName('DATAREF').AsString) + ',00,' +
                                        Trim(cdsDadosArquivo.FieldByName('INIDATAREF').AsString) );
           sCamposDBF := sCamposDBF + 'DBF.DATAREF, ';
           inc(i);
        end;


        if  Trim(cdsDadosArquivo.FieldByName('INITIPOCHAVE').AsString) <> '1000' then begin
           Add('Field'+inttostr(i)+'=TIPOCHAVE,Char,' + Trim(cdsDadosArquivo.FieldByName('TIPOCHAVE').AsString) + ',00,' +
                                          Trim(cdsDadosArquivo.FieldByName('INITIPOCHAVE').AsString) );
           sCamposDBF := sCamposDBF + 'DBF.TIPOCHAVE, ';
           inc(i);
        end;

        if  Trim(cdsDadosArquivo.FieldByName('INIVALORCHAVE').AsString) <> '1000' then begin
           Add('Field'+inttostr(i)+'=VALORCHAVE,Char,' + Trim(cdsDadosArquivo.FieldByName('VALORCHAVE').AsString) + ',00,' +
                                            Trim(cdsDadosArquivo.FieldByName('INIVALORCHAVE').AsString) );
           sCamposDBF := sCamposDBF + 'DBF.VALORCHAVE, ';
           inc(i);
        end;


        if Trim(cdsDadosArquivo.FieldByName('INIPROVENTO').AsString) <> '1000' then begin
           Add('Field'+inttostr(i)+'=PROVENTO,Char,' + Trim(cdsDadosArquivo.FieldByName('PROVENTO').AsString) + ',00,' +
                                         Trim(cdsDadosArquivo.FieldByName('INIPROVENTO').AsString) );
           sCamposDBF := sCamposDBF + 'DBF.PROVENTO, ';
           inc(i);
        end;


        //criar campo de parcela para a Funcef -  PROVISÓRIO
        Add('Field'+inttostr(i)+'=PARCELA,Char,3,00,15');
        sCamposDBF := sCamposDBF + 'DBF.PARCELA, ';
        inc(i);


        if Trim(cdsDadosArquivo.FieldByName('INIVALORPROVE').AsString) <> '1000' then begin
           Add('Field'+inttostr(i)+'=VALORPROVE,Char,' + Trim(cdsDadosArquivo.FieldByName('VALORPROVE').AsString) + ',00,' +
                                           Trim(cdsDadosArquivo.FieldByName('INIVALORPROVE').AsString) );
           sCamposDBF := sCamposDBF + 'DBF.VALORPROVE, ';
           inc(i);
        end;


        if  Trim(cdsDadosArquivo.FieldByName('INIVALORPART').AsString) <> '1000' then begin
           Add('Field'+inttostr(i)+'=VALORPART,Char,'+ Trim(cdsDadosArquivo.FieldByName('VALORPART').AsString) + ',00,' +
                                          Trim(cdsDadosArquivo.FieldByName('INIVALORPART').AsString) );
           sCamposDBF := sCamposDBF + 'DBF.VALORPART, ';
           inc(i);
        end;


        if  Trim(cdsDadosArquivo.FieldByName('INIIDPESSOA').AsString) <> '1000' then begin
           Add('Field'+inttostr(i)+'=IDPESSOA,Char,'+ Trim(cdsDadosArquivo.FieldByName('TAMIDPESSOA').AsString) + ',00,' +
                                          Trim(cdsDadosArquivo.FieldByName('INIIDPESSOA').AsString) );
           sCamposDBF := sCamposDBF + 'DBF.IDPESSOA, ';
           inc(i);
        end;

        if Trim(cdsDadosArquivo.FieldByName('INIPLANO').AsString) <> '1000' then begin
           Add('Field'+inttostr(i)+'= IDPLANO,Char,' + Trim(cdsDadosArquivo.FieldByName('PLANO').AsString) + ',00,' +
                                      Trim(cdsDadosArquivo.FieldByName('INIPLANO').AsString) );
           sCamposDBF := sCamposDBF + 'DBF.IDPLANO, ';
           inc(i);
        end;


        //Salvando o arquivo de Schema(*.sch);
        SaveToFile(Copy(edTxt.Text, 1, Length(edTxt.Text) - 4) + '.sch');
        Free;
      end;
      except
        Result := False;
     end;
   end;

var
   sIdpessjur : String;


begin
  inherited;


  Try
    StartTransacao;
    If not Sistema.GravaLogOperacoes('Recebimento da Patrocinadora - Rubricas Financeiras') Then
    Raise Exception.Create('Erro ao gravar Log.');
  Except
  End;



  Application.ProcessMessages;
  //
  if trim(edTxt.Text) = '' then begin
     MsgDlg('Obrigatório preencher o Arquivo da Patrocinadora','Aviso',mtWarning,[mbOk],0);
     edTxt.Setfocus;
     exit;
  end;

  if trim(dblkPatrocinadora.Text) = '' then begin
     MsgDlg('Obrigatório preencher a Patrocinadora','Aviso',mtWarning,[mbOk],0);
     dblkPatrocinadora.SetFocus;
     exit;
  end;

  sIdPessjur   := cdspatro.fieldbyname('idpessoa').AsString;

  qryTxt.DatabaseName := ExtractFilePath(edTxt.Text);
  tblTxt.DatabaseName := ExtractFilePath(edTxt.Text);
  tblTxt.TableName    := ExtractFileName(edTxt.Text);
  //
  tblDbf.DatabaseName := ExtractFilePath(edTxt.Text);
  tblDbf.TableName    := 'tmptxt.DBF';
  //

  cdsDadosArquivo.data := CtrlImportaFinanc.ListaDadosLayOut(sIdpessjur);


  //
  sCamposDBF := '';
  // Criar o arquivo de lay-out do arquivo texto que está sendo importado.
  if not GeraArquivoSchema(edTxt.Text) then begin;
     MsgDlg('Erro ao criar o arquivo esquema de consulta','Erro',mtError,[mbOk],0);
     exit;
  end;

  Screen.Cursor:=crHourGlass;
  //fim tratamento de arquivos




  try
     /// Abro o dbf para alterar o tipo de campo
     tblTxt.Open;

     try   tblDbf.open except end;

     //caso o arquivo já tenha sido gerado neste diretório
     //if tblDbf.IsEmpty then
     //begin

        bmPatro.RecordCount := 0;
        try
           bmPatro.Execute;
        except
           MsgDlg('Erro ao abrir arquivo texto causado por inconsistência no '+#13+
                  'cadastro de lay-out. Verifique arquivo de Esquema(sch) gerado '+#13+
                  'no mesmo diretório do arquivo texto.','Erro',mtError,[mbOk],0);
           exit;
        end;


        /// Se necessário retirar os registros de cabeçalho e rodapé
        if cdsDadosArquivo.FieldByName('FLGHEADER').AsString = 'S' then begin
           with tblDbf do begin
              Open;
              First;
              Delete;
              Close;
           end;

        end;
        if cdsDadosArquivo.FieldByName('FLGFOOTER').AsString = 'S' then begin
           with tblDbf do begin
              Open;
              Last;
              Delete;
              Close;
           end;
        end;
     //end;

     tblDbf.close;

  finally
     tblTxt.Close;
  end;




  with qryTxt do begin
      SQL.Clear;

      SQL.Add('SELECT IDPLANO Plano, PROVENTO Rubrica, '+
              ' SUM(CAST(VALORPROVE AS FLOAT)/100) Valor '+
              'FROM  TMPTXT DBF  '+
              'GROUP BY IDPLANO, PROVENTO  '+
              'ORDER BY IDPLANO, PROVENTO ');

      Open;
  end;


end;

procedure TfrmTrataArq.FormShow(Sender: TObject);
begin
  inherited;
  WindowState := wsMaximized;
end;

procedure TfrmTrataArq.edTxtChange(Sender: TObject);
begin
  inherited;
  edTxt.Hint := edTxt.Text;
  if (edtxt.Font.Size * length(edtxt.text)) > edtxt.Width then
     edTxt.ShowHint := true
  else
  edTxt.ShowHint := false;
end;

procedure TfrmTrataArq.FormActivate(Sender: TObject);
var i : Integer;
begin
  inherited;

end;

procedure TfrmTrataArq.qryTxtCalcFields(DataSet: TDataSet);
begin
  inherited;

  SqlParam.sql.text := ' SELECT NOME FROM PLANPREV WHERE IDPLANOPREV = '+qrytxt.fieldbyname('PLANO').AsString+' ';
  cdsAux.data := SqlParam.Data;

  if cdsaux.isempty then
  qrytxt.fieldbyname('NOMEPLANO').AsString := 'Não Participantes'
  else qrytxt.fieldbyname('NOMEPLANO').AsString := cdsaux.fieldbyname('NOME').AsString;


  SqlParam.sql.text := ' SELECT DESCRPROVDESC FROM RUBRICAXPESS '+
                       ' WHERE IDPESSOA  = '+cdspatro.fieldbyname('idpessoa').AsString+' '+
                       ' AND CODPROVDESC = '''+qrytxt.fieldbyname('RUBRICA').AsString+''' ';
  cdsAux.data := SqlParam.Data;

  if cdsaux.isempty then
  qrytxt.fieldbyname('NOMERUBRICA').AsString := 'Não Participantes'
  else qrytxt.fieldbyname('NOMERUBRICA').AsString := cdsaux.fieldbyname('DESCRPROVDESC').AsString;


end;

end.
