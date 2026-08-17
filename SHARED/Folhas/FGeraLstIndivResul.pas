{

//***************************************************************************************
//Rotina: <FGeraLstIndivResul.pas>
//Nº SOL: <256994>
//Nº PPM: <850266>
//Data da Alteração:      <25/06/2015>
//Alteração Form:  <Inserção de Order By na qryReport>
//Responsável: <Marcelo Cardoso>
//Descrição:  <Ordenar por nome de usuário os registros apresentados na tela gera lista individual para processamento das previa geral.>
//**************************************************************************************
--------------------------------------------------------------------------------

              TELA GERAR RELATORIO
              DE LISTA INDIVIDUAL (FGeraLstIndivResul.pas)

              SOL             :  249100
              Kintana         :  736486
              Módulo          :  Folha
              Autor           :  Helio Lima Custodio
              Data de Término :  14/04/2015

--------------------------------------------------------------------------------
-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit FGeraLstIndivResul;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, CheckLst, wwStoreP, DBaseDados,
  uVerificaPreenchimento, UMensErro, USistema, Spin, Grids, Wwdbigrd,
  Wwdbgrid, Wwdatsrc, ppPrnabl, ppClass, ppCtrls, ppDB, ppBands, ppCache,
  ppDBPipe, ppDBBDE, ppComm, ppRelatv, ppProd, ppReport;

type
  TFrmGeraLstIndivResul = class(TfrmOkCancelar)
    qryReport: TwwQuery;
    lblTotalLstGer: TLabel;
    dbgrdLstIndiv: TwwDBGrid;
    dsReport: TwwDataSource;
    updReport: TUpdateSQL;
    lblTotalPart: TLabel;
    qryReportNOME: TStringField;
    qryReportQUANTIDADE: TFloatField;
    ppReport: TppReport;
    pplReport: TppBDEPipeline;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    saveDlg: TSaveDialog;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppImage1: TppImage;
    dsCabecario: TwwDataSource;
    qryCabecario: TwwQuery;
    pplCabecario: TppBDEPipeline;
    qryCabecarioMES: TStringField;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLabel3: TppLabel;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLine3: TppLine;
    ppLine9: TppLine;
    ppLine10: TppLine;
    ppLblTotalPart: TppLabel;
    ppSummaryBand1: TppSummaryBand;
    ppDBText3: TppDBText;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ppLine2Print(Sender: TObject);
    procedure ppLblTotalPartPrint(Sender: TObject);
  private
    vLstIdsSel : TStringList;
    vMes : String;
    qtReg : Integer;
    totalParticipantes : Integer;

    procedure AtualizaLabelLblTotalLstGer;
    procedure AtualizaLabeLblTotalPart;
    procedure AbreQryReport;
    procedure MontaQryCabecalho;

    procedure SetMes(value : String);
  public
     property LstIdsSel : TStringList read vLstIdsSel;
     property Mes : String read vMes write SetMes ;
  end;

var
  FrmGeraLstIndivResul: TFrmGeraLstIndivResul;

implementation

{$R *.DFM}

procedure TFrmGeraLstIndivResul.SetMes(value : String);
begin
       vMes := value;
end;

procedure TFrmGeraLstIndivResul.bbtnCancelarClick(Sender: TObject);
var
     c : Integer;

     function TemExtensaoPdf(arquivo : String) : Boolean;
     begin
            Result := False;
            c := Length(arquivo);
            if c > 3 then
            begin
                  if (arquivo[c - 3] =  '.')
                     And ((arquivo[c - 2] = 'p') Or (arquivo[c - 2] = 'P'))
                     And ((arquivo[c - 1] = 'd') Or (arquivo[c - 1] = 'D'))
                     And ((arquivo[c - 0] = 'f') Or (arquivo[c - 0] = 'F')) then
                         Result := True;

            end;
     end;

begin
  saveDlg.Execute;
  ppReport.TextFileName := saveDlg.FileName;

  if Trim(ppReport.TextFileName) = '' then
       Exit;

  if Not TemExtensaoPdf(ppReport.TextFileName) then
  begin
        if ppReport.TextFileName[Length(ppReport.TextFileName)] <> '.' then
               ppReport.TextFileName := ppReport.TextFileName + '.';
        ppReport.TextFileName := ppReport.TextFileName + 'pdf';
  end;

  ppReport.DeviceType          := 'PDFFile';
  ppReport.AllowPrintToFile    := True;
  ppReport.ShowPrintDialog     := False;
  ppReport.Print;
end;

procedure TFrmGeraLstIndivResul.FormCreate(Sender: TObject);
begin
  inherited;
  vLstIdsSel := TStringList.Create;
end;

procedure TFrmGeraLstIndivResul.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(vLstIdsSel);
  qryReport.Close;
  qryCabecario.Close;
end;

procedure TFrmGeraLstIndivResul.FormShow(Sender: TObject);
begin
  inherited;
  AbreQryReport;
  MontaQryCabecalho;
  AtualizaLabelLblTotalLstGer;
  AtualizaLabeLblTotalPart;
  qtReg := 0;
end;

procedure TFrmGeraLstIndivResul.AtualizaLabelLblTotalLstGer;
var
    total : String;
begin
       total := '';
       if vLstIdsSel.Count < 10 then
           total := '0';

       total := total + IntToStr(vLstIdsSel.Count);

       lblTotalLstGer.Caption := 'Total de Listas Geradas: ' + total;
end;

procedure TFrmGeraLstIndivResul.AtualizaLabeLblTotalPart;
begin
       totalParticipantes := 0;
       qryReport.First;
       while not qryReport.Eof do
       begin
              totalParticipantes := totalParticipantes + qryReportQUANTIDADE.AsInteger;
              qryReport.Next;
       end;
             
       lblTotalPart.Caption := 'Total de Participantes: ' + IntToStr(totalParticipantes);
end;

procedure TFrmGeraLstIndivResul.AbreQryReport;
var
    idsPessoaSeparadoVirg : String;
begin
       idsPessoaSeparadoVirg := StringReplace(Trim(vLstIdsSel.Text), #13#10, ',', [rfReplaceAll, rfIgnoreCase]);
       qryReport.SQL.Text := StringReplace(qryReport.SQL.Text,
                                           ':IDPESSOA',
                                           idsPessoaSeparadoVirg,
                                           [rfReplaceAll, rfIgnoreCase]);

       qryReport.Open;
end;

procedure TFrmGeraLstIndivResul.MontaQryCabecalho;
begin
        qryCabecario.Open;

        qryCabecario.Edit;
        if Length(vMes) > 6 then
           qryCabecario.FieldByName('MES').AsString := vMes[6] +  vMes[7] +
                                                       '/' + vMes[1] +
                                                             vMes[2] +
                                                             vMes[3] +
                                                             vMes[4];
        qryCabecario.Post;
end;

procedure TFrmGeraLstIndivResul.ppLine2Print(Sender: TObject);
begin
  inherited;
  Inc(qtReg);
  if qryReport.RecordCount <= qtReg then
  begin
         ppLine2.Visible := True;
  end;
end;

procedure TFrmGeraLstIndivResul.ppLblTotalPartPrint(Sender: TObject);
begin
  inherited;
  ppLblTotalPart.Caption := 'Total de Participantes: ' + IntToStr(totalParticipantes);
end;

end.
