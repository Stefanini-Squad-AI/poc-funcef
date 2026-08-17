unit fParamGuiaTransfBem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, wwdblook,
  Wwdatsrc, Mask, wwdbedit, MontaSelect, Wwquery, wwdbdatetimepicker,
  CMDateTimePicker;

type
  TfrmParamGuiaTransfBem = class(TfrmOkCancelar)
    dteDataMovIni: TCMDateTimePicker;
    Label1: TLabel;
    dteDataMovFim: TCMDateTimePicker;
    Label2: TLabel;
    qryConjOrig: TwwQuery;
    qryConjOrigDESCCONJUNTO: TStringField;
    qryConjOrigIDCONJUNTO: TFloatField;
    Label3: TLabel;
    cmbConjOrig: TwwDBLookupCombo;
    Label4: TLabel;
    cmbConjDest: TwwDBLookupCombo;
    qryConjDest: TwwQuery;
    Label8: TLabel;
    dbeTermo: TwwDBEdit;
    bbtnTermoTransf: TBitBtn;
    MSTermo: TMontaSelect;
    qrySelTermo: TwwQuery;
    qrySelTermoIDSELBAIXA: TFloatField;
    qrySelTermoSBXTERMO: TFloatField;
    qrySelTermoSBXPROCESSO: TStringField;
    qrySelTermoSBXDATA: TDateTimeField;
    qrySelTermoSBXNOMERESP: TStringField;
    qrySelTermoSBXFLGEXECUTADO: TFloatField;
    qrySelTermoSBXDTAEXECUTADO: TDateTimeField;
    qrySelTermoSBTIPOMOV: TFloatField;
    dsSelTermo: TwwDataSource;
    dbeProcesso: TwwDBEdit;
    qryConjDestDESCCONJUNTO: TStringField;
    qryConjDestIDCONJUNTO: TFloatField;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dteDataMovIniExit(Sender: TObject);
    procedure dteDataMovFimExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure bbtnTermoTransfClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    sMascaraGrupo, sMascaraPlaca, sMascaraEmpresa : String;
  end;

var
  frmParamGuiaTransfBem: TfrmParamGuiaTransfBem;

implementation

{$R *.DFM}

uses uSistema, dRelOperCaf,  uMensErro, dAtivoFixo;

procedure TfrmParamGuiaTransfBem.FormCreate(Sender: TObject);
begin
   inherited;
   qryConjOrig.Open;
   qryConjDest.Open;
   //-------------------------------------------------------------------------------------
   dteDataMovIni.Date := (date - 30);
   dteDataMovFim.Date := date;
end;
//========================================================================================
procedure TfrmParamGuiaTransfBem.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;
   Screen.Cursor := crSQLWait;
   with dtmRelOperCaf.qryGuiaTransfBem do
   begin
      Close;
      SQL.Clear;
      //----------------------------------------------------------------------------------
      SQL.Add('SELECT (TO_CHAR(SBB.IDSELBAIXA, ''0999999999'')||');
      SQL.Add('        TO_CHAR(SBB.IDCONJATUAL,''0999999999'')||');
      SQL.Add('        TO_CHAR(SBB.IDCONJUNTO, ''0999999999'')) AS TERMOCONJGRUPO,');
      SQL.Add('       SB.SBXTERMO,');
      SQL.Add('       SB.SBXDATA,');
      SQL.Add('       SB.SBXDTAEXECUTADO,');
      SQL.Add('       LO.NOME     AS NOMELOCORIG,');
      SQL.Add('       LO.ENDERECO AS ENDELOCORIG,');
      SQL.Add('       RO.NOME     AS NOMERSPORIG,');
      SQL.Add('       LD.NOME     AS NOMELOCDEST,');
      SQL.Add('       LD.ENDERECO AS ENDELOCDEST,');
      SQL.Add('       RD.NOME     AS NOMERSPDEST,');
      SQL.Add('       B.PLACA,');
      SQL.Add('       B.DESBEM,');
      SQL.Add('       B.VALORG');
      SQL.Add('FROM SELBAIXA        SB,');
      SQL.Add('     SELBAIXABENS    SBB,');
      SQL.Add('     BEM             B,');
      SQL.Add('     CONJUNTO        CO,');
      SQL.Add('     CONJUNTO        CD,');
      SQL.Add('     LOCALIZACAO     LO,');
      SQL.Add('     LOCALIZACAO     LD,');
      SQL.Add('     PESSOA          RO,');
      SQL.Add('     PESSOA          RD');
      SQL.Add('WHERE ((SB.SBXDATA >= TO_DATE(' + #39 + dteDataMovIni.Text + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 + ')) AND' );
      SQL.Add('       (SB.SBXDATA <= TO_DATE(' + #39 + dteDataMovFim.Text + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 + ')))' );
      SQL.Add('  AND (SB.SBTIPOMOV = 1)');
      //----------------------------------------------------------------------------------
      if (dbeTermo.Text <> '') then
         SQL.Add('   AND (SB.IDSELBAIXA = ' + inttostr(qrySelTermoIDSELBAIXA.AsInteger) + ')');
      //----------------------------------------------------------------------------------
      if (cmbConjOrig.Text <> '') then
         SQL.Add('   AND (SBB.IDCONJATUAL = ' + inttostr(qryConjOrigIDCONJUNTO.AsInteger) + ')');
      //----------------------------------------------------------------------------------
      if (cmbConjOrig.Text <> '') then
         SQL.Add('   AND (SBB.IDCONJUNTO = ' + inttostr(qryConjDestIDCONJUNTO.AsInteger) + ')');
      //----------------------------------------------------------------------------------
      SQL.Add('  AND (SB.IDSELBAIXA        = SBB.IDSELBAIXA)');
      SQL.Add('  AND (SBB.IDBEM            = B.IDBEM)');
      SQL.Add('  AND (SBB.IDPESSOA         = B.IDPESSOA)');
      SQL.Add('  AND (SBB.IDCONJATUAL      = CO.IDCONJUNTO(+))');
      SQL.Add('  AND (SBB.IDCONJUNTO       = CD.IDCONJUNTO(+))');
      SQL.Add('  AND (CO.IDLOCALIZACAO     = LO.IDLOCALIZACAO(+))');
      SQL.Add('  AND (CO.IDRESPONSAVEL     = RO.IDPESSOA(+))');
      SQL.Add('  AND (CD.IDLOCALIZACAO     = LD.IDLOCALIZACAO(+))');
      SQL.Add('  AND (CD.IDRESPONSAVEL     = RD.IDPESSOA(+))');
      SQL.Add('ORDER BY (TO_CHAR(SBB.IDSELBAIXA, ''0999999999'')||');
      SQL.Add('          TO_CHAR(SBB.IDCONJATUAL,''0999999999'')||');
      SQL.Add('          TO_CHAR(SBB.IDCONJUNTO, ''0999999999'')), B.PLACA');
   end;
   //-------------------------------------------------------------------------------------
   with dtmRelOperCaf do
   begin
      qryGuiaTransfBem.Open;
      Screen.Cursor := crDefault;
      if qryGuiaTransfBem.IsEmpty then
         MsgDlg('Não há guias de transferência cadastradas no Periodo especificado!',
                'Erro',mtError,[mbOk],0);
   end;
end;
//========================================================================================
procedure TfrmParamGuiaTransfBem.dteDataMovIniExit(Sender: TObject);
begin
   inherited;
   if dteDataMovIni.Text = '' then
      dteDataMovIni.SetFocus;
end;
//========================================================================================
procedure TfrmParamGuiaTransfBem.dteDataMovFimExit(Sender: TObject);
begin
   inherited;
   if dteDataMovFim.Text = '' then
      dteDataMovFim.SetFocus;
end;
//========================================================================================
procedure TfrmParamGuiaTransfBem.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   qryConjOrig.Close;
   qryConjDest.Close;
   qrySelTermo.Close;
   qryConjOrig.UnPrepare;
   qryConjDest.UnPrepare;
   qrySelTermo.UnPrepare;
end;
//========================================================================================
procedure TfrmParamGuiaTransfBem.bbtnTermoTransfClick(Sender: TObject);
begin
   inherited;
   MSTermo.Executar;
   //-------------------------------------------------------------------------------------
   Invalidate;
   Repaint;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if (MSTermo.ValoresChave.Count > 0) and (MSTermo.ValoresChave[0] <> '') then
   begin
      qrySelTermo.Close;
      qrySelTermo.ParamByName('PIDSELBAIXA').AsInteger := StrToInt(MSTermo.ValoresChave[1]);
      qrySelTermo.Open;
   end;
end;

end.
