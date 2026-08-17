unit fMTUtilAjustaImplantaImob;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fMTUtilAjustaLancImplantacao, uCmSqlParams, MontaSelect, Db, DBClient,
  uCMClientDataSet, Wwdatsrc, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  TB97Tlbr, Grids, Wwdbigrd, Wwdbgrid, TB97Ctls, TB97, TREdit, StdCtrls,
  ComCtrls, wwdbdatetimepicker, CMDateTimePicker, Mask, wwdbedit, Buttons,
  wwriched, ExtCtrls, uDatabase, dBaseDados, uMensErro, uComunsImobiliario;

type
  TfrmMTUtilAjustaImplantaImob = class(TfrmMTUtilAjustaLancImplantacao)
    edImovel: TEdit;
    edImoCodigo: TEdit;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    edTipoBem: TEdit;
    btnCriaReaval: TButton;
    procedure bbtnSelBemClick(Sender: TObject);
    procedure btnCriaReavalClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMTUtilAjustaImplantaImob: TfrmMTUtilAjustaImplantaImob;

implementation

{$R *.DFM}

procedure TfrmMTUtilAjustaImplantaImob.bbtnSelBemClick(Sender: TObject);
begin
  inherited;
  if MSBem.RetornouValor then begin
     edImovel.Text    := MSBem.ValoresChave[3];
     edImoCodigo.Text := MSBem.ValoresChave[4];
     edTipoBem.Text   := MSBem.ValoresChave[5];
  end;
  if cdsReavaliacao.IsEmpty then begin
     btnCriaReaval.Enabled := cdsReavaliacao.IsEmpty;
  end else begin
     if MsgDlg('Já existem reavaliações anteriores para o bem. Permite a criação '+#13+
               'de novas reavaliações?','Confirmação',mtConfirmation,[mbYes, mbNo],0) = mryes then begin
        btnCriaReaval.Enabled := True;
     end else begin
        btnCriaReaval.Enabled := False;
     end;
  end;
end;

procedure TfrmMTUtilAjustaImplantaImob.btnCriaReavalClick(Sender: TObject);
var sSql, idBem, idMovto, idReav, sData, sUltDep, sTaxa, sFlgDep : String;
begin
  inherited;
  try

     if MsgDlg('Confirma criação da primeira reavaliação ?','Confirmação',mtConfirmation, [mbyes, mbno],0) = mrNo then begin
        Exit;
     end;

     if cdsSelBem.FieldByName('BAIXATOTAL').AsString = 'S' then begin
        if MsgDlg('Este Bem está baixado, altera a situação do bem ?','Confirmação',mtConfirmation, [mbyes, mbno],0) = mrNo then begin
           Exit;
        end;
     end;

     StartTransacao;

     idBem   := cdsSelBem.FieldByName('IDBEM').AsString;
     sSql    := 'SELECT SEQHISTORICOMOVIMENTACAO.NEXTVAL AS IDHIST FROM DUAL';
     FazQuery(dtmBaseDados.qry, sSql);
     idMovto := dtmBaseDados.qry.FieldByName('IDHIST').AsString;
     sSql    := 'SELECT SEQREAVALIACAO.NEXTVAL AS IDREAV FROM DUAL';
     FazQuery(dtmBaseDados.qry, sSql);
     idReav  := dtmBaseDados.qry.FieldByName('IDREAV').AsString;
     sSql    := 'SELECT B.IDBEM, B.DTAINCLUSAO, BD.TAXADEP, BD.DATAULTDEP '+
                '  FROM BEM B, BEMXDEP BD  '+
                ' WHERE B.IDBEM = BD.IDBEM '+
                '   AND B.IDBEM = ' + idBem;
     FazQuery(dtmBaseDados.qry, sSql);
     sTaxa  := FloatToStr(dtmBaseDados.qry.FieldByName('TAXADEP').AsFloat);
     sTaxa  := ComunsImobiliario.StrTran(sTaxa,',','.');
     sData  := 'TO_DATE(' +QuotedStr(DateToStr(dtmBaseDados.qry.FieldByName('DTAINCLUSAO').AsDateTime)) +
                        ', ''DD/MM/YYYY'') ';
     sUltDep:= 'TO_DATE(' +QuotedStr(DateToStr(dtmBaseDados.qry.FieldByName('DATAULTDEP').AsDateTime)) +
                        ', ''DD/MM/YYYY'') ';
     sFlgDep:= '0';


     if cdsSelBem.FieldByName('BAIXATOTAL').AsString = 'S' then begin
        sData  := 'TO_DATE(' +QuotedStr(DateToStr(edDataBase.Date)) + ', ''DD/MM/YYYY'') ';
        sFlgDep:= '1';

        sSql := 'UPDATE BEM SET BAIXATOTAL = ''N'' '+#13+
                ' WHERE IDBEM = ' + IdBem;
        if not ExecutarQuery(dtmBaseDados.qry, sSql) then raise exception.create('');

        sSql := 'UPDATE BEMXDEP SET FLGDEPREC = 1 '+#13+
                ' WHERE IDBEM = ' + IdBem;
        if not ExecutarQuery(dtmBaseDados.qry, sSql) then raise exception.create('');
     end;

     // 1 - Insere em HISTORICOMOVIMENTACAO
     sSql := 'INSERT INTO HISTORICOMOVIMENTACAO '+#13+
             '      ( IDMOVIMENTACAO, IDTIPOMOVIMENTACAO, IDMODULO, IDPESSOA, IDBEM, FLGNCAF, '+#13+
             '        DATAMOVIMENTACAO, VALOFI, TIPDEPPRORATA ) VALUES '+#13+
             '      ( ' + idMovto + ', 8, 54, 1, ' + idBem + ', 2, ' + sData + ', 0, 0 ) ';
     if not ExecutarQuery(dtmBaseDados.qry, sSql) then raise exception.create('');

     // 2 - Insere em REAVALIACAO
     sSql := 'INSERT INTO REAVALIACAO '+#13+
             '      ( IDREAVALIACAO, IDBEM, IDMOVIMENTACAO, IDPESSOA, DATAREAVALIACAO, FLGULTREAVAL ) VALUES '+#13+
             '      ( ' + idReav + ', ' + idBem + ', ' + idMovto + ', 1, ' + sData + ', 1 ) ';
     if not ExecutarQuery(dtmBaseDados.qry, sSql) then raise exception.create('');

     // 3 - Insere em REAVALXMOEDA
     sSql := 'INSERT INTO REAVALXMOEDA '+#13+
             '      ( IDREAVALIACAO, MOECODIGO, VALORG, CMBEM, DATAULTCM ) VALUES '+#13+
             '      ( ' + idReav + ', 1, 0, 0, ' + sData + ' ) ';
     if not ExecutarQuery(dtmBaseDados.qry, sSql) then raise exception.create('');

     // 4 - Insere em REAVALXDEP
     sSql := 'INSERT INTO REAVALXDEP '+#13+
             '    ( IDREAVALIACAO, IDREAVALXDEP, MOECODIGO, TAXADEP, DEPLANC, CMDEP, FLGDEPREC, '+#13+
             '      DATAULTDEP,DATAULTCM ) VALUES '+#13+
             '    ( ' + idReav + ', 1, 1, ' + sTaxa + ', 0, 0, ' + sFlgDep + ', ' + sUltDep + ', ' + sData + ' ) ';
     if not ExecutarQuery(dtmBaseDados.qry, sSql) then raise exception.create('');

     CommitTransacao;
     MsgDlg('Reavaliação Criada. Selecione o bem novamente ANTES de efetuar os ajustes','Informação',mtinformation, [mbok],0);
     btnCriaReaval.Enabled := False;
  except
     RollBackTransacao;
     MsgDlg('ERRO na criação da Reavaliação','Erro',mtError, [mbok],0);
  end;

end;

end.
