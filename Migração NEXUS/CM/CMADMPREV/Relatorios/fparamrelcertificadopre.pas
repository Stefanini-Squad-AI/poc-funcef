// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Camille
// Data        : 07.07.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO 
//------------------------------------------------------------------------------
unit FParamRelCertificadoPre;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar,  IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  Buttons, TB97Tlbr, TB97, ExtCtrls, ComCtrls, ppPrvDlg,ppForms,
  wwdbdatetimepicker, CMDateTimePicker, StdCtrls;

type
  TfrmParamRelCertificadoPre = class(TfrmOkCancelar)
    Label11: TLabel;
    rgTipoSelecao: TRadioGroup;
    PageControl1: TPageControl;
    tbsData: TTabSheet;
    Label4: TLabel;
    Label5: TLabel;
    edDtInscricaoINI: TCMDateTimePicker;
    edDtInscricaoFim: TCMDateTimePicker;
    tbsfaixa: TTabSheet;
    edFaixa1Ini: TEdit;
    edFaixa1Fim: TEdit;
    edFaixa2Ini: TEdit;
    edFaixa2Fim: TEdit;
    Label3: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    edFaixa3Ini: TEdit;
    edFaixa3Fim: TEdit;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure rgTipoSelecaoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
     sSql  ,DataInicio, DataFim   : string;
     procedure Montasql(var sSql:string);
  public
    { Public declarations }
  end;

var
  frmParamRelCertificadoPre: TfrmParamRelCertificadoPre;

implementation

uses DRelatAdmPrev, UMensErro, UAdmPrev, UFuncoesUteis;

{$R *.DFM}

procedure TfrmParamRelCertificadoPre.bbtnConfirmarClick(Sender: TObject);
var sSQL : string;
    sCampoNOME,
    sCampoPLANO,
    sCampoINSC,
    sCampoDIA,
    sCampoMES,
    sCampoAno,
    sDia : string;
    iDia, iMes, iAno,

    iCont : word;
begin
  inherited;

  // Testar campos obrigatorios
  if (rgTipoSelecao.ItemIndex = 0) and ((edDtInscricaoINI.Text = '') or (edDtInscricaoFIM.Text = ''))
  then begin
     MsgDlg('Preencha a Faixa de Datas de Registro de Inscrição. Faixa incompleta.','Erro',mtError,[mbOk],0);
     Abort;
  end;
  if (rgTipoSelecao.ItemIndex = 1) and ((edFaixa1Ini.Text = '') or (edFaixa1FIM.Text = ''))
  then begin
     MsgDlg('Preencha ao menos a Primeira Faixa de Número de Inscrição. Faixa incompleta.','Erro',mtError,[mbOk],0);
     Abort;
  end;

  // fim do teste de campos obrigatorios
  MontaSQL(sSql);

  DtmRelatAdmPrev.qryCert.Close;
  DtmRelatAdmPrev.qryCert.Open;
  DtmRelatAdmPrev.qryCert.CancelUpdates;


  with DtmRelatAdmPrev.qryCertTemp do
  begin
     Close;
     SQL.Clear;
     SQL.Add(sSQL);
     Open;

     iCont := 0;
     while not Eof do
     begin
        inc(iCont);
        sCampoNOME  := 'NOME'+IntToStr(iCont);
        sCampoPLANO := 'PLANO'+IntToStr(iCont);
        sCampoINSC  := 'INSCRICAONUMERO'+IntToStr(iCont);
        sCampoDIA   := 'DIAINSC'+IntToStr(iCont);
        sCampoMES   := 'MESINSC'+IntToStr(iCont);
        sCampoAno   := 'ANOINSC'+IntToStr(iCont);
        if iCont = 1
        then DtmRelatAdmPrev.qryCert.Insert
        else DtmRelatAdmPrev.qryCert.Edit;
        DtmRelatAdmPrev.qryCert.FieldByName(sCampoNome).AsString  := FieldByName('Nome').AsString;
        DtmRelatAdmPrev.qryCert.FieldByName(sCampoPLANO).AsString := FieldByName('Plano').AsString;
        DtmRelatAdmPrev.qryCert.FieldByName(sCampoINSC).AsString  := FieldByName('InscricaoNumero').AsString;

        // Monta data de inscricao
        DecodeDate(FieldByName('INSCRICAODATA').AsDateTime, iAno , iMes, iDia);
        sDia    := IntToStr(iDia);
        if iDia < 10 then
           sDia := '0'+IntToStr(iDia);

        DtmRelatAdmPrev.qryCert.FieldByName(sCampoDIA).AsString := sDia;
        DtmRelatAdmPrev.qryCert.FieldByName(sCampoMES).AsString := RetornaNomeMes(iMes);
        DtmRelatAdmPrev.qryCert.FieldByName(sCampoAno).AsString := IntToStr(iAno);
        DtmRelatAdmPrev.qryCert.Post;

        if iCont >= 4  then iCont := 0;
        Next;
     end;
  end;

  DtmRelatAdmPrev.rpCert.Print;

  DtmRelatAdmPrev.qryCertTemp.Close;
  DtmRelatAdmPrev.qryCert.CancelUpdates;
  DtmRelatAdmPrev.qryCert.Close;
end;

procedure TfrmParamRelCertificadoPre.Montasql(var sSql:string);
begin
   sSql := '';
   sSQL := ' SELECT P.IDPESSOA,  P.NOME,  PP.INSCRICAONUMERO,  PL.NOME AS PLANO, '+
           '        PP.INSCRICAODATA                                             '+
           ' FROM   PESSOA        P,                                             '+
           '        PATRO         PT,                                            '+ 
           '        PARTPREVPLAN  PP,                                            '+
           '        EVENTOSPREV   EP,                                            '+
           '        EVENTOGERADOR EG,                                            '+
           '        PLANPREV      PL                                             '+
           ' WHERE  EG.FLGINTERNO = ''IP''                                       '+
           ' AND    EP.IDEVENTOGERADOR = EG.IDEVENTOGERADOR                      '+
           ' AND    PP.IDPESSJUR       = EP.IDPESSJUR                            '+
           ' AND    PP.IDPLANOPREV     = EP.IDPLANOPREV                          '+
           ' AND    PP.IDPESSOA        = EP.IDPESSOA                             '+
           ' AND    PP.SEQPROPOSTA     = EP.SEQPROPOSTA                          '+
           ' AND    PT.IDPESSOA        = PP.IDPESSJUR                            '+ 
           ' AND    PT.IDFUNDACAO      = '+IntToStr(iIdFundacao)                  + 
           ' AND    P.IDPESSOA         = PP.IDPESSOA                             '+
           ' AND    PL.IDPLANOPREV     = PP.IDPLANOPREV                          ';


   case rgTipoSelecao.ItemIndex of
        0 : begin // Filtrar por Data de Inscricao
               sSQL := sSQL + ' AND (EP.DATAREGISTRO BETWEEN TO_DATE('''+edDtInscricaoIni.Text+''',''DD/MM/YYYY'') AND '+
                              '                             TO_DATE('''+edDtInscricaoFim.Text+''',''DD/MM/YYYY'') )    ';
            end;
        1 : begin // Filtrar por Faixa de Numero de Inscricao
               if (Trim(edFaixa1Ini.Text) <> '') and (Trim(edFaixa1Fim.Text) <> '')
               then sSQL := sSQL + ' AND ((PP.INSCRICAONUMERO BETWEEN '+edFaixa1Ini.Text+' AND '+edFaixa1Fim.Text+')';

               if (Trim(edFaixa2Ini.Text) <> '') and (Trim(edFaixa2Fim.Text) <> '')
               then sSQL := sSQL + ' OR (PP.INSCRICAONUMERO BETWEEN '+edFaixa2Ini.Text+' AND '+edFaixa2Fim.Text+')';

               if (Trim(edFaixa3Ini.Text) <> '') and (Trim(edFaixa3Fim.Text) <> '')
               then sSQL := sSQL + ' OR (PP.INSCRICAONUMERO BETWEEN '+edFaixa3Ini.Text+' AND '+edFaixa3Fim.Text+')';

               sSQL := sSQL + ')'; // fehcar parentese principal
            end;
   end;

   sSQL := sSQL + ' ORDER BY PP.INSCRICAONUMERO ';
end;

procedure TfrmParamRelCertificadoPre.FormCreate(Sender: TObject);
begin

  inherited;
  ppRegisterForm(TppCustomPreviewer,TppPrintPreview);
  sSQL := '';
  rgTipoSelecao.ItemIndex := -1;
end;

procedure TfrmParamRelCertificadoPre.rgTipoSelecaoClick(Sender: TObject);
begin
  inherited;
  tbsData.TabVisible   := (rgTipoSelecao.ItemIndex = 0);
  tbsfaixa.TabVisible  := (rgTipoSelecao.ItemIndex = 1);
end;

procedure TfrmParamRelCertificadoPre.FormShow(Sender: TObject);
begin
  inherited;
  // Limpar Campos
  edFaixa1Ini.Text := '';
  edFaixa1Fim.Text := '';
  edFaixa2Ini.Text := '';
  edFaixa2Fim.Text := '';
  edFaixa3Ini.Text := '';
  edFaixa3Fim.Text := '';

  edDtInscricaoINI.Text := '';
  edDtInscricaoFIM.Text := '';
end;

end.
