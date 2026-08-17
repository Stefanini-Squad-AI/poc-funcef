unit FMostraContribuicoes;

// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// *****************************************************************************

{-------------------------------------------------------------------------------
Alteração  :
Nº SOL.....: 253577-18094
KTN / PPM  : 1269549
Data       : 02/02/2016
Responsável: Edilaine
Descrição..: Ajustes para Equacionamento do Deficit - associação de taxas
-------------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Db, DBTables, Wwquery, ExtCtrls, MAHlpBtn, Buttons, TB97,
  TB97Tlbr;

type
  TfrmMostraContribuicoes = class(TForm)
    qryAux: TwwQuery;
    Dock971: TDock97;
    tb97Fundo: TToolbar97;
    sep1: TToolbarSep97;
    bbtnSair: TBitBtn;
    bbtnAjuda: TmaHelpBitBtn;
    TB97oKCancelar: TToolbar97;
    ToolbarSep971: TToolbarSep97;
    bbtnConfirmar: TBitBtn;
    bbtnCancelar: TBitBtn;
    Panel1: TPanel;
    lblTitPart: TLabel;
    lblTitPatro: TLabel;
    lblTitPlano: TLabel;
    lblPlano: TLabel;
    lblPatrocinadora: TLabel;
    lblParticipante: TLabel;
    memoContrib: TMemo;
    procedure FormShow(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMostraContribuicoes: TfrmMostraContribuicoes;
  sIdEventosPrev, sNomeParticip, sNomePatro, sNomePlano: string;
  iIdPessoa, iIdPlanoPrev, iIdPessJur, iSeqProposta : integer;     // edilaine - SOL 253577-18094 / PPM 1269549

  procedure MostraContribuicoes(pIdEventosPrev, pNomeParticip, pNomePatro, pNomePlano: string);  overload;    // edilaine - SOL 253577-18094 / PPM 1269549

  procedure MostraContribuicoes(piIdTitular, pIdPessoa, pIdPlanoPrev, pIdPessJur, pSeqProposta, pNumeroProcesso : integer;
                                pNomeParticip, pNomePatro, pNomePlano: string);  overload;      // edilaine - SOL 253577-18094 / PPM 1269549

implementation

uses
  UAdmPrev;

{$R *.DFM}

// edilaine - SOL 253577-18094 / PPM 1269549 - inicio
procedure MostraContribuicoes(piIdTitular, pIdPessoa, pIdPlanoPrev, pIdPessJur, pSeqProposta, pNumeroProcesso : integer;
                              pNomeParticip, pNomePatro, pNomePlano: string);
begin
  Application.CreateForm(TfrmMostraContribuicoes, frmMostraContribuicoes);

  iIdPessoa     := pIdPessoa;
  iIdPlanoPrev  := pIdPlanoPrev;
  iIdPessJur    := pIdPessJur;
  iSeqProposta  := pSeqProposta;

  sNomeParticip  := pNomeParticip;
  sNomePatro     := pNomePatro;
  sNomePlano     := pNomePlano;

  with frmMostraContribuicoes do
  begin
     qryAux.Close;
     qryAux.Sql.Clear;
     if  piIdTitular = pIdPessoa then
     begin
        qryAux.Sql.Add(' SELECT C.NOME||'' - Data Inicio: ''||TO_CHAR(CTP.DATAINICIO, ''DD/MM/YYYY'')|| '+
                       '                '' - Data Final: ''||DECODE(CTP.DATAFINAL, NULL, ''-----'', TO_CHAR(CTP.DATAFINAL,''DD/MM/YYYY'')) AS NOME, '+
                       '        CTP.IDCONTRIBUICAO, ''1'' AS FLGASSOCIADA ' +
                       ' FROM CONTRIBPREVPARTP CTP, CONTRIBUICAO C ' +
                       ' WHERE CTP.IDCONTRIBUICAO = C.IDCONTRIBUICAO ' +
                       '   AND CTP.IDPESSOA = '+IntToStr(iIdPessoa) +
                       '   AND CTP.IDPLANOPREV = '+IntToStr(iIdPlanoPrev) +
                       '   AND CTP.IDPESSJUR = '+IntToStr(iIdPessJur) +
                       '   AND CTP.SEQPROPOSTA = '+IntToStr(iSeqProposta) +
                       '   AND CTP.NUMEROPROCESSO = '+IntToStr(pNumeroProcesso) +
                       ' ORDER BY 3, 1 ');
     end
     else
     begin
        lblTitPart.caption := 'Titular: ';
        lblParticipante.left := lblTitPart.Left + lblTitPart.Width + 8;

        qryAux.close;
        qryAux.sql.clear;
        qryAux.Sql.Add('SELECT DISTINCT P.NOME, 0 AS ORDEM, CTP.IDPESSOA, ''1'' AS FLGASSOCIADA '+
                       '  FROM CONTRIBPREVNUCLEO CTP '+
                       '       JOIN PESSOA P ON P.IDPESSOA = CTP.IDPESSOA '+
                       ' WHERE CTP.IDPLANOPREV = '+IntToStr(iIdPlanoPrev) +
                       '   AND CTP.IDPESSJUR   = '+IntToStr(iIdPessJur) +
                       '   AND CTP.SEQPROPOSTA = '+IntToStr(iSeqProposta) +
                       '   AND CTP.NUMEROPROCESSO = '+IntToStr(pNumeroProcesso) +
                       ' UNION '+
                       'SELECT ''  - ''||C.NOME||'' - Data Inicio: ''||TO_CHAR(CTP.DATAINICIO, ''DD/MM/YYYY'')|| '+
                       '                         '' - Data Final: ''||DECODE(CTP.DATAFINAL, NULL, ''-----'', TO_CHAR(CTP.DATAFINAL,''DD/MM/YYYY'')) AS NOME, '+
                       '       1 AS ORDEM, CTP.IDPESSOA, ''1'' AS FLGASSOCIADA '+
                       '  FROM CONTRIBPREVNUCLEO CTP '+
                       '       JOIN CONTRIBUICAO C ON C.IDCONTRIBUICAO = CTP.IDCONTRIBUICAO '+
                       '       JOIN PESSOA P ON P.IDPESSOA = CTP.IDPESSOA '+
                       ' WHERE CTP.IDPLANOPREV = '+IntToStr(iIdPlanoPrev) +
                       '   AND CTP.IDPESSJUR   = '+IntToStr(iIdPessJur) +
                       '   AND CTP.SEQPROPOSTA = '+IntToStr(iSeqProposta) +
                       '   AND CTP.NUMEROPROCESSO = '+IntToStr(pNumeroProcesso) +
                       ' ORDER BY 3, 2, 1 ');
     end;

     qryAux.Open;
     if not qryAux.IsEmpty
     then ShowModal;

  end;

  frmMostraContribuicoes.Free;
end;
// edilaine - SOL 253577-18094 / PPM 1269549 - fim

procedure MostraContribuicoes(pIdEventosPrev, pNomeParticip, pNomePatro, pNomePlano: string);
begin
  Application.CreateForm(TfrmMostraContribuicoes, frmMostraContribuicoes);

  sIdEventosPrev := pIdEventosPrev;
  sNomeParticip  := pNomeParticip;
  sNomePatro     := pNomePatro;
  sNomePlano     := pNomePlano;

  with frmMostraContribuicoes do
  begin
     qryAux.Close;
     qryAux.Sql.Clear;
     qryAux.Sql.Add(' SELECT C.NOME, HST.IDCONTRIBUICAOF, HST.FLGASSOCIADA ' +
                    ' FROM HSTCONTEVENTOSPR HST, CONTRIBUICAO C ' +
                    ' WHERE HST.IDEVENTOSPREV = ' + sIdEventosPrev + ' AND ' +
                    '       HST.IDCONTRIBUICAOF = C.IDCONTRIBUICAO ' +
                    ' ORDER BY HST.FLGASSOCIADA, C.NOME ');
     qryAux.Open;
     if not qryAux.IsEmpty
     then ShowModal;

  end;

  frmMostraContribuicoes.Free;
end;

procedure TfrmMostraContribuicoes.FormShow(Sender: TObject);
var
  bMostraCabecalho1, bMostraCabecalho2: boolean;
begin
  lblParticipante.Caption  := sNomeParticip;
  lblPatrocinadora.Caption := sNomePatro;
  lblPlano.Caption         := sNomePlano;


  qryAux.First;

  bMostraCabecalho1 := True;
  bMostraCabecalho2 := True;
  memoContrib.Clear;
  while not qryAux.EOF do
     begin
          if (qryAux.FieldByName('FLGASSOCIADA').AsString = '0') and (bMostraCabecalho1) then
              begin
                   memoContrib.Lines.Add('------------------------------------------------------------------');
                   memoContrib.Lines.Add(' Contribuições Suspensas de Cobrança ');
                   memoContrib.Lines.Add('------------------------------------------------------------------');

                   bMostraCabecalho1 := False;
              end
          else
          if (qryAux.FieldByName('FLGASSOCIADA').AsString = '1') and (bMostraCabecalho2) then
              begin
                   memoContrib.Lines.Add('');
                   memoContrib.Lines.Add('------------------------------------------------------------------');
                   memoContrib.Lines.Add(' Novas Contribuições Associadas ');
                   memoContrib.Lines.Add('------------------------------------------------------------------');

                   bMostraCabecalho2 := False;
              end;

          memoContrib.Lines.Add(qryAux.FieldByName('NOME').AsString);

          qryAux.Next;
     end;
end;

procedure TfrmMostraContribuicoes.bbtnSairClick(Sender: TObject); 
begin
  Close;
end;

end.
