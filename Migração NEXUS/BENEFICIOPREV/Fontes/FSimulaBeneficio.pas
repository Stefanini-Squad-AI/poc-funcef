unit FSimulaBeneficio;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, TreeWzd, ComCtrls, MontaSelect, Db, DBTables,
  Wwquery, wwdblook;

type
  TfrmSimulaBeneficio = class(TfrmSairAjuda)
    TwCons: TTreeWzd;
    BtnAnterior: TBitBtn;
    BtnProximo: TBitBtn;
    pnlDireita: TPanel;
    pnlTitulo: TPanel;
    pnlSubTitulo: TPanel;
    pgctrlEtapa: TPageControl;
    tbsEtapa1: TTabSheet;
    tbsEtapa2: TTabSheet;
    tbsEtapa3: TTabSheet;
    tbsEtapa4: TTabSheet;
    MontaSelect: TMontaSelect;
    Bevel1: TBevel;
    Label4: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label3: TLabel;
    Label14: TLabel;
    Label16: TLabel;
    bbtnProcurar: TBitBtn;
    lblParticipante: TStaticText;
    lblPatro: TStaticText;
    lblPlano: TStaticText;
    lblNUmProc: TStaticText;
    lblDIB: TStaticText;
    lblBeneficio: TStaticText;
    lblBeneficiario: TStaticText;
    lblMatricula: TStaticText;
    lblSituacaoAtual: TStaticText;
    Label1: TLabel;
    qryPlano: TwwQuery;
    dblkpcmbPlano: TwwDBLookupCombo;
    memResult: TMemo;
    qryAux: TwwQuery;
    qryBeneficiosSimular: TwwQuery;
    procedure FormShow(Sender: TObject);
    procedure bbtnProcurarClick(Sender: TObject);
    procedure BtnProximoClick(Sender: TObject);
    procedure BtnAnteriorClick(Sender: TObject);
  private
    { Private declarations }
    cOperacao : char; // A - Avancando, R - Retornando
    iNumeroProcesso,
    iIdTitular,
    iIdPessoa,
    iIdPessJur,
    iIdPlanoPrev,
    iSeqProposta,
    iIdBeneficio  : longInt;
    function  AvancaPageControl : boolean;
    procedure ProcessaEtapa2;
  public
    { Public declarations }
  end;

var
  frmSimulaBeneficio: TfrmSimulaBeneficio;

implementation

uses UAdmPrev, UFuncoesUteis;

{$R *.DFM}

procedure TfrmSimulaBeneficio.FormShow(Sender: TObject);
begin
  inherited;
  TwCons.Etapa.Pos          := 1;
  pnlTitulo.Caption         := 'Simulação de Benefícios - Matrícula : <a escolher> ';
  pnlSubTitulo.Caption      := TwCons.Etapa.Caption[TwCons.Etapa.Pos-1];
  tbsEtapa1.TabVisible      := False;
  tbsEtapa2.TabVisible      := False;
  tbsEtapa3.TabVisible      := False;
  tbsEtapa4.TabVisible      := False;

  memResult.Lines.Clear;

  pgctrlEtapa.ActivePage    := tbsEtapa1;
  MontaSelect.Filtro.Add('PP.IDPESSJUR IN (SELECT IDPESSOA FROM PATRO WHERE IDFUNDACAO = '+IntToStr(iIdFundacao)+')'); // CAMILLE - 23.06.2003

  qryPlano.Close;
  qryPlano.ParamByName('IDFUNDACAO').AsInteger := iIdFundacao;
  qryPlano.Open;
end;

procedure TfrmSimulaBeneficio.bbtnProcurarClick(Sender: TObject);
begin
  inherited;
  MontaSelect.Executar;
  if MontaSelect.RetornouValor
  then begin
    memResult.Lines.Clear;
    iIdTitular      := StrToInt(MontaSelect.ValoresChave[0]);
    if Trim(MontaSelect.ValoresChave[21]) = ''
    then iIdPessoa       := StrToInt(MontaSelect.ValoresChave[0])
    else iIdPessoa       := StrToInt(MontaSelect.ValoresChave[21]);

    iSeqProposta             := StrToInt(MontaSelect.ValoresChave[2]);
    iIdPessJur               := StrToInt(MontaSelect.ValoresChave[3]);
    iIdPlanoPrev             := StrToInt(MontaSelect.ValoresChave[4]);
    iNumeroProcesso          := StrToInt(ClienteNumero(MontaSelect.ValoresChave[23]));
    iIdBeneficio             := StrToInt(ClienteNumero(MontaSelect.ValoresChave[19]));

    lblNumProc.Caption       := MontaSelect.ValoresChave[23];
    lblParticipante.Caption  := MontaSelect.ValoresChave[5];
    lblBeneficiario.Caption  := MontaSelect.ValoresChave[22];
    lblDIB.Caption           := MontaSelect.ValoresChave[11];
    lblPatro.Caption         := MontaSelect.ValoresChave[12];
    lblBeneficio.Caption     := MontaSelect.ValoresChave[6];
    lblPlano.Caption         := MontaSelect.ValoresChave[13];
    pnlTitulo.Caption        := 'Simulação de Benefícios - Matrícula : '+MontaSelect.ValoresChave[15];
    lblMatricula.Caption     := MontaSelect.ValoresChave[15];

         if MontaSelect.ValoresChave[23] = 'AT' then lblSituacaoAtual.Caption := 'Ativo'
    else if MontaSelect.ValoresChave[23] = 'MA' then lblSituacaoAtual.Caption := 'Mantido'
    else if MontaSelect.ValoresChave[23] = 'MP' then lblSituacaoAtual.Caption := 'Mantido Parcial'
    else if MontaSelect.ValoresChave[23] = 'AS' then lblSituacaoAtual.Caption := 'Assistido'
    else if MontaSelect.ValoresChave[23] = 'MS' then lblSituacaoAtual.Caption := 'Manutenção de Saldo de Conta'
    else if MontaSelect.ValoresChave[23] = 'CA' then lblSituacaoAtual.Caption := 'Cancelado'
    else if MontaSelect.ValoresChave[23] = 'AE' then lblSituacaoAtual.Caption := 'Ativo Especial'
    else if MontaSelect.ValoresChave[23] = 'PN' then lblSituacaoAtual.Caption := 'Pendente';

    qryPlano.Locate('IDPLANOPREV', iIdPlanoPrev, [loCaseInsensitive]);
    dblkpcmbPlano.Text := qryPlano.FieldByName('NOME').AsString;
  end;

end;

procedure TfrmSimulaBeneficio.BtnProximoClick(Sender: TObject);
begin
  inherited;
  cOperacao := 'A';

  if not AvancaPageControl   then Exit;
  TwCons.Etapa.Avancar;
  pnlSubTitulo.Caption       := TwCons.Etapa.Caption[TwCons.Etapa.Pos-1];
end;

procedure TfrmSimulaBeneficio.BtnAnteriorClick(Sender: TObject);
begin
  inherited;
  cOperacao := 'R';
  if not AvancaPageControl then Exit;
  TwCons.Etapa.Retornar;
  pnlSubTitulo.Caption       := TwCons.Etapa.Caption[TwCons.Etapa.Pos-1];
end;

function TfrmSimulaBeneficio.AvancaPageControl : boolean;
begin
  Result := False;
  pnlSubTitulo.Caption       := TwCons.Etapa.Caption[TwCons.Etapa.Pos-1];
  case TwCons.Etapa.Pos of
       1 : begin
              if cOperacao = 'R'
              then pgctrlEtapa.ActivePage       := tbsEtapa1
              else begin
                 pgctrlEtapa.ActivePage       := tbsEtapa2;
                 ProcessaEtapa2;
              end;
           end;
       2 : begin
              if cOperacao = 'R'
              then pgctrlEtapa.ActivePage       := tbsEtapa1
              else pgctrlEtapa.ActivePage       := tbsEtapa3;
           end;
       3 : begin
              if cOperacao = 'R'
              then pgctrlEtapa.ActivePage       := tbsEtapa2
              else pgctrlEtapa.ActivePage       := tbsEtapa4;
           end;
       4 : begin
              if cOperacao = 'R'
              then pgctrlEtapa.ActivePage       := tbsEtapa3
              else pgctrlEtapa.ActivePage       := tbsEtapa4;
           end;
       end; // case
end;

procedure TfrmSimulaBeneficio.ProcessaEtapa2;
var sSQLRegra  : string;
    i          : word;
    sDataEleg  : string;
    sValorPrev : string;
    sSituacao  : string;
    bErro      : boolean;
begin
   memResult.Lines.Add('Demonstrativo de Simulação de Benefícios');
   memResult.Lines.Add('-------------------------------------------------------------------------------------');
   memResult.Lines.Add('-------------------------------------------------------------------------------------');
   memResult.Lines.Add(PreparaStr('Matrícula : '+lblMatricula.Caption,25)+PreparaStr('Participante : '+lblParticipante.Caption,60) );
   memResult.Lines.Add(PreparaStr(' ',25)                                +PreparaStr('Beneficiário : '+lblBeneficiario.Caption,60) );
   memResult.Lines.Add(PreparaStr('No.',5)+' '+PreparaStr('Benefício',40)+' '+PreparaStr('Data Eleg',10)+' '+PreparaStr('Valor Estim.',15)+' '+PreparaStr('[Situação]',15));
   memResult.Lines.Add('-------------------------------------------------------------------------------------');


   qryBeneficiosSimular.Close;
   qryBeneficiosSimular.SQL.Clear;
   qryBeneficiosSimular.SQL.Add(' SELECT BP.IDBENEFICIO, B.NOME,           '+
                                '        BP.IDRGVALORPREV, BP.IDRGDATAELEG '+
                                ' FROM   BENEFICIO B, BENEFPLANPREV BP     '+
                                ' WHERE  BP.IDPLANOPREV = '+qryPlano.FieldbyName('IDPLANOPREV').AsString+
                                ' AND    BP.IDBENEFICIO = B.IDBENEFICIO    '+
                                ' ORDER BY B.NOME ');
   qryBeneficiosSimular.Open;
   i := 0;
   while not qryBeneficiosSimular.Eof do
   begin
      inc(i);

      sSQLRegra := ' SELECT PP.IDPESSJUR, PP.IDPLANOPREV, PP.IDPESSOA, PP.SEQPROPOSTA '+
                   ' FROM   ELEGPATRO EL, PARTPREVPLAN PP                             '+
                   ' WHERE  PP.IDPESSJUR   = '+IntToStr(iIdPessJur)                    +
                   ' AND    PP.IDPLANOPREV = '+IntToStr(iIdPlanoPrev)                  +
                   ' AND    PP.IDPESSOA    = '+IntToStr(iIdTitular)                    +
                   ' AND    PP.SEQPROPOSTA = '+IntToStr(iSeqProposta);


      if qryBeneficiosSimular.FieldByName('IDRGDATAELEG').AsString <> ''
      then begin
         sDataEleg  := RegraString(qryBeneficiosSimular.FieldByName('IDRGDATAELEG').AsString,
                                   sSQLRegra, bErro, iIdCalculoGeral);
         if (Trim(sDataEleg) <> '') and (StrToDate(sDataEleg) <= date)
         then sSituacao := 'Elegível'
         else sSituacao := 'Bloqueado';
      end
      else begin
         sDataEleg  := 'Indefinida';
         sSituacao  := 'Elegível'
      end;

      if qryBeneficiosSimular.FieldByName('IDRGVALORPREV').AsString <> ''
      then sValorPrev := RegraNumerica(qryBeneficiosSimular.FieldByName('IDRGVALORPREV').AsString,
                                       sSQLRegra, bErro, iIdCalculoGeral)
      else sValorPrev := 'Indefinido';



      memResult.Lines.Add(PreparaStr(IntToStr(i),5)+' '+
                          PreparaStr(qryBeneficiosSimular.FieldByName('NOME').AsString,40)+' '+
                          PreparaStr(sDataEleg,10)+' '+
                          PreparaStr(OraNumero(sValorPrev),15)+' '+
                          PreparaStr(sSituacao,15));


      qryBeneficiosSimular.Next;
   end;
end;



end.