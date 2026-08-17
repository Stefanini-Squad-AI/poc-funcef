// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Camille
// Data        : 07.07.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO 
//------------------------------------------------------------------------------
unit FParamSuplAntecipada;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, UConsPart, MontaSelect, wwdblook, Db, Wwdatsrc,
  DBTables, Wwquery, Grids, Wwdbigrd, Wwdbgrid;

type
  TFrmParamSuplAntecipada = class(TfrmSairAjuda)
    bbtnConfirmar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    Panel1: TPanel;
    ConsPart1: TConsPart;
    Panel5: TPanel;
    Label1: TLabel;
    Label6: TLabel;
    Label5: TLabel;
    edSitPatro: TEdit;
    edSitFundacao: TEdit;
    bbtnProcurar: TBitBtn;
    Panel7: TPanel;
    Label4: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lblpart: TLabel;
    lblpatro: TLabel;
    lblplano: TLabel;
    Label7: TLabel;
    lblfilial: TLabel;
    MontaSelectPart: TMontaSelect;
    Panel2: TPanel;
    qrybeneficio: TwwQuery;
    dsbeneficio: TwwDataSource;
    wwDBGrid1: TwwDBGrid;
    Panel3: TPanel;
    Label8: TLabel;
    cmbbeneficio: TwwDBLookupCombo;
    Label9: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnProcurarclick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure cmbbeneficioCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
  public
     sidpessoa,
     sidplanoprev,
     sidpessjur,
     sSeqProposta,
     sidbeneficio : String;
    { Public declarations }
  end;

var
  FrmParamSuplAntecipada: TFrmParamSuplAntecipada;

implementation

uses uMensErro, DRelatAdmPREV, UAdmPrev;

{$R *.DFM}

procedure TFrmParamSuplAntecipada.FormCreate(Sender: TObject);
begin
  inherited;
  dtmRelatAdmPREV.qrysuplantecipada.close;
  bbtnProcurarClick(self);
end;

procedure TFrmParamSuplAntecipada.bbtnConfirmarClick(Sender: TObject);
var snumprocesso : String;
begin


  if trim(lblpart.caption) = '' then
  begin
     bbtnConfirmar.ModalResult := mrnone;
     MsgDlg('É preciso selecionar o participante.','Erro', mtError, [mbok],0);
     exit;
  end;

  if trim(cmbbeneficio.text) = '' then
  begin
     bbtnConfirmar.ModalResult := mrnone;
     MsgDlg('É preciso selecionar o benefício.','Erro', mtError, [mbok],0);
     exit;
  end;

  if   dtmRelatAdmPREV.qrysuplantecipada.isempty then
  begin
     MsgDlg('O benefício em questão ainda não foi requerido.','Informação', mtInformation, [mbok],0);
     bbtnConfirmar.ModalResult := mrnone;
     exit;
  end
  else
  begin
     bbtnConfirmar.ModalResult := mrok;

     
     if dtmRelatAdmPREV.qrysuplantecipada.recordcount > 1 then
     begin
        snumprocesso := dtmRelatAdmPREV.qrysuplantecipada.fieldbyname('NUMEROPROCESSO').AsString;

        dtmRelatAdmPREV.qrysuplantecipada.close;
        dtmRelatAdmPREV.qrysuplantecipada.sql.clear;
        dtmRelatAdmPREV.qrysuplantecipada.sql.add(' SELECT PESSOA.NOME , ELEGPATRO.MATRICULA, '+
                                                ' PESSJUR.NOME PESSJUR, BEP.VALORBASE1 , BEP.VALORBASE2 , '+
                                                ' BEP.VALORBASE3, BE.DATAINICIOFUND , BE.NUMEROPROCESSO,BE.DATAREQUERIMENTO, '+
                                                ' PFUND.NOME AS NOMEFUNDACAO '+ 
                                                ' FROM PESSOA , ELEGPATRO, PESSOA PESSJUR, PESSOAXFUND, '+
                                                ' BENEFBFCIARIO BE, BENEFPLANOPART BEP, PESSOA PFUND, '+ 
                                                ' PATRO PT '+
                                                ' WHERE ELEGPATRO.IDPESSOA = PESSOA.IDPESSOA '+
                                                ' AND PESSOA.IDPESSOA = '+sidpessoa+' '+
                                                ' AND ELEGPATRO.IDPESSJUR = '+sidpessjur+' '+
                                                ' AND BE.IDBENEFICIO = '+sidbeneficio+' '+
                                                ' AND BE.IDPLANOPREV = '+sidplanoprev+' '+
                                                ' AND BE.SEQPROPOSTA = '+sseqproposta+' '+
                                                ' AND BE.NUMEROPROCESSO = '+snumprocesso+' '+
                                                ' AND PESSOAXFUND.IDPESSOA = ELEGPATRO.IDPESSJUR '+
                                                ' AND PESSOAXFUND.IDFUNDACAO = PESSJUR.IDPESSOA '+
                                                ' AND BE.IDPESSJUR = ELEGPATRO.IDPESSJUR '+
                                                ' AND BE.IDTITULAR = ELEGPATRO.IDPESSOA '+
                                                ' AND BE.IDPESSOA = BE.IDTITULAR '+
                                                ' AND BEP.IDBENEFICIO = BE.IDBENEFICIO '+
                                                ' AND BEP.IDPESSJUR = BE.IDPESSJUR '+
                                                ' AND BEP.IDPLANOPREV = BE.IDPLANOPREV '+
                                                ' AND BEP.SEQPROPOSTA = BE.SEQPROPOSTA '+
                                                ' AND BEP.IDPESSOA = BE.IDTITULAR '+
                                                ' AND ELEGPATRO.IDPESSJUR = PT.IDPESSOA '+
                                                ' AND PT.IDFUNDACAO = PFUND.IDPESSOA ' +  
                                                ' ORDER BY BE.NUMEROPROCESSO ');
        try
           dtmRelatAdmPREV.qrysuplantecipada.open;
        except end;

     end;


     //close;
  end;

  inherited;

end;

procedure TFrmParamSuplAntecipada.bbtnProcurarclick(Sender: TObject);
begin
  inherited;
  MontaSelectPart.Executar;

  if (MontaSelectPart.ValoresChave.Count > 0) and (MontaSelectPart.ValoresChave[0] <> '') then
      begin
          {Carrega Campos}
           sIdPessoa          := MontaSelectPart.ValoresChave[0];
           sIdPessJur         := MontaSelectPart.ValoresChave[1];
           sIdPlanoPrev       := MontaSelectPart.ValoresChave[2];
           sSeqProposta       := MontaSelectPart.ValoresChave[7];
           lblpart.caption        := MontaSelectPart.ValoresChave[3];
           lblPatro.caption       := MontaSelectPart.ValoresChave[5];
           lblPlano.caption       := MontaSelectPart.ValoresChave[6];

           sidbeneficio := '';

           qrybeneficio.close;
           qrybeneficio.sql.clear;
           qrybeneficio.sql.add(' SELECT B.NOME, B.IDBENEFICIO            '+
                                ' FROM   BENEFICIO B , BENEFBFCIARIO BE, PATRO PT   '+ 
                                ' WHERE  B.IDBENEFICIO  = BE.IDBENEFICIO  '+
                                ' AND    BE.IDSITBENEFICIO IN (1,4) '+ // concedido ou pendente
                                ' AND    BE.IDPESSOA    = '+sidpessoa+
                                ' AND    BE.IDTITULAR   = '+sIdPessoa+
                                ' AND    BE.IDPLANOPREV = '+sidplanoprev+
                                ' AND    BE.SEQPROPOSTA = '+sseqproposta+
                                ' AND    BE.IDPESSJUR   = '+sidpessjur+
                                ' AND    PT.IDPESSOA    = BE.IDPESSJUR '+         
                                ' AND    PT.IDFUNDACAO  = '+IntToStr(iIdFundacao)+
                                ' ORDER BY NOME');
           qrybeneficio.open;

           if not qrybeneficio.isempty then
           sidbeneficio := qrybeneficio.fieldbyname('IDBENEFICIO').AsString
           else cmbbeneficio.enabled := false;

           ConsPart1.sIdPessoa := sidpessoa;
           ConsPart1.sSeqProposta := sseqproposta;
           ConsPart1.sIdPlanoprev := sidplanoprev;
           ConsPart1.DataBaseName := 'BaseDados';
           ConsPart1.sIdPessjur := sidpessjur;
           ConsPart1.Enabled := true;
    end
    else begin
       sIdPessoa          := '';
       sIdPessJur         := '';
       sIdPlanoPrev       := '';
       sSeqProposta       := '';
       lblpart.caption    := '';
       lblPatro.caption   := '';
       lblPlano.caption   := '';
       qrybeneficio.close;
       cmbbeneficio.enabled := false;       
    end;
end;

procedure TFrmParamSuplAntecipada.bbtnSairClick(Sender: TObject);
begin
  dtmRelatAdmPREV.qrysuplantecipada.close;
  inherited;

end;



procedure TFrmParamSuplAntecipada.cmbbeneficioCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if not qrybeneficio.isempty then
  sidbeneficio := qrybeneficio.fieldbyname('IDBENEFICIO').AsString;

  dtmRelatAdmPREV.qrysuplantecipada.close;
  dtmRelatAdmPREV.qrysuplantecipada.sql.clear;
  dtmRelatAdmPREV.qrysuplantecipada.sql.add('SELECT P.NOME , EL.MATRICULA, '+
                                          ' 	      PJ.NOME PESSJUR, BEP.VALORBASE1 , BEP.VALORBASE2 ,  '+
                                          ' 	      BEP.VALORBASE3, BF.DATAINICIOFUND , BF.NUMEROPROCESSO,BF.DATAREQUERIMENTO,  '+
                                          '        PFUND.NOME AS NOMEFUNDACAO '+
                                          ' FROM  PESSOA P, ELEGPATRO EL, PESSOA PJ, BENEFBFCIARIO BF, BENEFPLANOPART BEP,    '+
                                          '       PESSOA PFUND, PATRO PT '+
                                          ' WHERE (P.IDPESSOA      = '+sIdPessoa  +')'+
                                          ' AND   (PJ.IDPESSOA     = '+sIdPessjur +')'+
                                          ' AND   (EL.IDPESSJUR    = PJ.IDPESSOA  '+')'+
                                          ' AND   (EL.IDPESSOA     = P.IDPESSOA   '+')'+
                                          ' AND   (BF.IDBENEFICIO  = '+sIdBeneficio+')'+
                                          ' AND   (BF.IDPLANOPREV  = '+sIdPlanoPrev+')'+
                                          ' AND   (BF.SEQPROPOSTA  = '+sSeqProposta+')'+
                                          ' AND   (BF.IDPESSJUR    = EL.IDPESSJUR)  '+
                                          ' AND   (BF.IDTITULAR    = EL.IDPESSOA)   '+
                                          ' AND   (BF.IDPESSOA     = BF.IDTITULAR)  '+
                                          ' AND   (BEP.IDBENEFICIO = BF.IDBENEFICIO)'+
                                          ' AND   (BEP.IDPESSJUR   = BF.IDPESSJUR)  '+
                                          ' AND   (BEP.IDPLANOPREV = BF.IDPLANOPREV)'+
                                          ' AND   (BEP.SEQPROPOSTA = BF.SEQPROPOSTA)'+
                                          ' AND   (BEP.IDPESSOA    = BF.IDTITULAR)  '+
                                          ' AND   (EL.IDPESSJUR    = PT.IDPESSOA)   '+
                                          ' AND   (PT.IDFUNDACAO   = PFUND.IDPESSOA)'+
                                          ' ORDER BY BF.NUMEROPROCESSO  ');

  try
     dtmRelatAdmPREV.qrysuplantecipada.open;
  except end;
end;

procedure TFrmParamSuplAntecipada.FormShow(Sender: TObject);
begin
  inherited;
  MontaSelectPart.Filtro.Add('PARTPREVPLAN.IDPESSJUR IN (SELECT IDPESSOA FROM PATRO WHERE IDFUNDACAO = '+IntToStr(iIdFundacao)+')');
end;

end.
