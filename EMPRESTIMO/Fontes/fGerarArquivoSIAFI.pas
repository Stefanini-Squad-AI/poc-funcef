// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Everson Luiz Pereira da Cunha
// Data        : 07/06/2018
// Pendência   : SIG TIBERO
// Descricao   : Melhoria no planus para adequação ao TIBERO
//------------------------------------------------------------------------------
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  27/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------

unit fGerarArquivoSIAFI;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Menus, Db, DBTables, Wwquery, ComCtrls,
  wwriched, wwdbdatetimepicker, CMDateTimePicker, USistema;

type
  TfrmGerarArquivoSIAFI = class(TfrmOkCancelar)
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    edtNomeArquivo: TEdit;
    memResult: TwwDBRichEdit;
    qryBuscaHistorico: TwwQuery;
    qryBuscaMatricula: TwwQuery;
    qryBuscaMatriculaIDPESSOA: TFloatField;
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    ppmMemResult: TPopupMenu;
    Imprimir: TMenuItem;
    Salvar: TMenuItem;
    Label2: TLabel;
    SpeedButton2: TSpeedButton;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edtDataIni: TCMDateTimePicker;
    edtDataFim: TCMDateTimePicker;
    qryBuscaHistoricoMATRICULA: TStringField;
    qryBuscaHistoricoNUMPARCELA: TFloatField;
    qryBuscaHistoricoCOBRANCA: TStringField;
    qryBuscaHistoricoREFERENCIA: TStringField;
    qryBuscaHistoricoDATAVENCTO: TDateTimeField;
    qryBuscaHistoricoVLRPARCELAPG: TFloatField;
    qryBuscaHistoricoMULTAEPPG: TFloatField;
    qryBuscaHistoricoJUROSEPPG: TFloatField;
    qryBuscaHistoricoCORRECAOEPPG: TFloatField;
    qryBuscaHistoricoSALDODEVEPPG: TFloatField;
    qryBuscaHistoricoSEGUROEPPG: TFloatField;
    qryBuscaHistoricoMULTASEGEPPG: TFloatField;
    qryBuscaHistoricoJUROSSEGEPPG: TFloatField;
    qryBuscaHistoricoCORRECAOSEGEPPG: TFloatField;
    qryBuscaHistoricoDESCONTOEPPG: TFloatField;
    qryBuscaHistoricoMULTAQUITPG: TFloatField;
    qryBuscaHistoricoJUROSQUITPG: TFloatField;
    qryBuscaHistoricoCORRECAOQUITPG: TFloatField;
    qryBuscaHistoricoSALDODEVQUITPG: TFloatField;
    qryBuscaHistoricoSEGUROQUITPG: TFloatField;
    qryBuscaHistoricoMULTASEGQUITPG: TFloatField;
    qryBuscaHistoricoJUROSSEGQUITPG: TFloatField;
    qryBuscaHistoricoCORRECAOSEGQUITPG: TFloatField;
    qryBuscaHistoricoDESCONTOQUITPG: TFloatField;
    qryBuscaHistoricoPLNCODIGO: TFloatField;
    qryBuscaHistoricoDATAPAGAMENTO: TDateTimeField;
    qryBuscaHistoricoIDMODULO: TFloatField;
    qryBuscaHistoricoNOMEMODULO: TStringField;
    qryBuscaHistoricoCODDOCUMENTO: TFloatField;
    qryBuscaHistoricoDATAATUALIZA: TDateTimeField;
//    qryBuscaHistoricoDATACANC: TMemoField; //Everson TIBERO
    qryBuscaHistoricoDATACANC: TStringField; //Everson TIBERO
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure ImprimirClick(Sender: TObject);
    procedure SalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGerarArquivoSIAFI: TfrmGerarArquivoSIAFI;

implementation

uses uFuncoesEmptmo, UDataBase, dBaseDados, UMensErro;

{$R *.DFM}

procedure TfrmGerarArquivoSIAFI.FormCreate(Sender: TObject);
begin
  inherited;
   //edtNomeArquivo.Text := 'C:\TP' + FormatDateTime('yyyymmdd',SysDate) + '.TXT';
   edtNomeArquivo.Text :=  Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\TP' + FormatDateTime('yyyymmdd',SysDate) + '.TXT';//Ádler Teodoro de Souza SOL 109421 KINTANA 496332

   OpenDialog.FileName := edtNomeArquivo.Text;
   edtDataIni.Date     := SysDate - 1;
   edtDataFim.Date     := SysDate - 1;
end;



procedure TfrmGerarArquivoSIAFI.SpeedButton2Click(Sender: TObject);
begin
   inherited;
   OpenDialog.FileName := 'TP' + FormatDateTime('yyyymmdd', SysDate) + '.TXT';
   if OpenDialog.Execute then edtNomeArquivo.Text := OpenDialog.FileName;
end;




procedure TfrmGerarArquivoSIAFI.bbtnConfirmarClick(Sender: TObject);
var
   Arquivo : TextFile;
   sLinha  : String;
begin
   inherited;

   MemResult.Lines.Clear;

   if edtNomeArquivo.Text = '' then
   begin
      MsgDlg('Favor informar o arquivo.','Aviso',mtWarning,[mbOK],0);
      Exit;
   end;

   AssignFile(Arquivo, OpenDialog.FileName);
   ReWrite(Arquivo);

   MemResult.Lines.Add('Início de Geração: ' + TimeToStr(Time));

   with qryBuscaHistorico do
   begin
      LimpaParametros(qryBuscaHistorico);
      ParamByName('PDATAINI').AsDateTime := edtDataIni.Date;
      ParamByName('PDATAFIM').AsDateTime := edtDataFim.Date;
      Open;
      while not Eof do
      begin
         sLinha :=
           CompletaFim(Trim(qryBuscaHistoricoMATRICULA.AsString),' ',15)                       +
           CompletaInicio(IntToStr(qryBuscaHistoricoNUMPARCELA.AsInteger),'0',3)               +
           qryBuscaHistoricoCOBRANCA.AsString                                                  +
           qryBuscaHistoricoREFERENCIA.AsString                                                +
           qryBuscaHistoricoDATAVENCTO.AsString                                                +
           FormatFloat('00000000000000000', qryBuscaHistoricoVLRPARCELAPG.AsCurrency * 100)    +
           FormatFloat('00000000000000000', qryBuscaHistoricoMULTAEPPG.AsCurrency * 100)       +
           FormatFloat('00000000000000000', qryBuscaHistoricoJUROSEPPG.AsCurrency * 100)       +
           FormatFloat('00000000000000000', qryBuscaHistoricoCORRECAOEPPG.AsCurrency * 100)    +
           FormatFloat('00000000000000000', qryBuscaHistoricoSALDODEVEPPG.AsCurrency * 100)    +
           FormatFloat('00000000000000000', qryBuscaHistoricoSEGUROEPPG.AsCurrency * 100)      +
           FormatFloat('00000000000000000', qryBuscaHistoricoMULTASEGEPPG.AsCurrency * 100)    +
           FormatFloat('00000000000000000', qryBuscaHistoricoJUROSSEGEPPG.AsCurrency * 100)    +
           FormatFloat('00000000000000000', qryBuscaHistoricoCORRECAOSEGEPPG.AsCurrency * 100) +
           FormatFloat('00000000000000000', qryBuscaHistoricoDESCONTOEPPG.AsCurrency * 100)    +
           FormatFloat('00000000000000000', qryBuscaHistoricoMULTAQUITPG.AsCurrency * 100)     +
           FormatFloat('00000000000000000', qryBuscaHistoricoJUROSQUITPG.AsCurrency * 100)     +
           FormatFloat('00000000000000000', qryBuscaHistoricoCORRECAOQUITPG.AsCurrency * 100)  +
           FormatFloat('00000000000000000', qryBuscaHistoricoSALDODEVQUITPG.AsCurrency * 100)  +
           FormatFloat('00000000000000000', qryBuscaHistoricoSEGUROQUITPG.AsCurrency * 100)    +
           FormatFloat('00000000000000000', qryBuscaHistoricoMULTASEGQUITPG.AsCurrency * 100)  +
           FormatFloat('00000000000000000', qryBuscaHistoricoJUROSSEGQUITPG.AsCurrency * 100)  +
           FormatFloat('00000000000000000', qryBuscaHistoricoCORRECAOSEGQUITPG.AsCurrency * 100) +
           FormatFloat('00000000000000000', qryBuscaHistoricoDESCONTOQUITPG.AsCurrency * 100)  +
           FormatFloat('00000000000000000', qryBuscaHistoricoPLNCODIGO.AsFloat)                +
           qryBuscaHistoricoDATAPAGAMENTO.AsString                                             +
           CompletaInicio(IntToStr(qryBuscaHistoricoIDMODULO.AsInteger),'0',3)                 +
           CompletaFim(Trim(qryBuscaHistoricoNOMEMODULO.AsString),' ',30)                      +
           CompletaFim(Trim(qryBuscaHistoricoCODDOCUMENTO.AsString),' ',18)                    +
           qryBuscaHistoricoDATAATUALIZA.AsString                                              +
           qryBuscaHistoricoDATACANC.AsString;

         WriteLn(Arquivo,sLinha);

         MemResult.Lines.Add('Matrícula ' + qryBuscaHistoricoMATRICULA.AsString +
                             ' Parc. ' + IntToStr(qryBuscaHistoricoNUMPARCELA.AsInteger) +
                             ' Cobr. ' + qryBuscaHistoricoCOBRANCA.AsString + ' exportada.');

         Next;
      end;
   end;

   CloseFile(Arquivo);
   MemResult.Lines.Add('Final de Geração: ' + TimeToStr(Time));
end;



procedure TfrmGerarArquivoSIAFI.ImprimirClick(Sender: TObject);
begin
  inherited;
   MemResult.Print('');

end;



procedure TfrmGerarArquivoSIAFI.SalvarClick(Sender: TObject);
begin
  inherited;
   SaveDialog.FileName := 'Gera' + FormatDateTime('yyyymmdd',SysDate) + '.TXT';
   if SaveDialog.Execute then
      MemResult.Lines.SaveToFile(SaveDialog.FileName);
end;



end.
