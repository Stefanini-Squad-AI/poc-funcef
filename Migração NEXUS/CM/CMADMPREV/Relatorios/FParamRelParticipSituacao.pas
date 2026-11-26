// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Claudio Faria
// Rotina      : Varias
// Data        : 16/08/2007
// Pendência   : 19962
// Alteração   : Troca do DateToStr para FormatDateTime.
// -----------------------------------------------------------------------------
// Rotina      : bbtnConfirmarClick
// Autor(a)    : Gleyber
// Data        : 28/03/2005
// Pendência   : 18888
// Alteração   : Acerto na query para pegar apenas o ultimo evento referente ao
//               mes de referência e buscar as situações da época.
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 30.09.2004
// Pendência   : 17814
// Alteração   : Erro no GROUP BY e preencher mes e ano com o atual (formshow)
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 07.07.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO 
//------------------------------------------------------------------------------
// Rotina      :
// Autor(a)    : Camille
// Data        : 18.02.2003
// Alteração   : Permitir patro e plano em branco
// -----------------------------------------------------------------------------
unit FParamRelParticipSituacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Spin, wwdblook, Db, DBTables, Wwquery, Wwdatsrc;

type
  TFrmParamRelParticipSituacao = class(TfrmOkCancelar)
    GroupBox3: TGroupBox;
    dblookupPatrocinadora: TwwDBLookupCombo;
    GroupBox2: TGroupBox;
    dblookupPlano: TwwDBLookupCombo;
    dsPatro: TwwDataSource;
    qryPatro: TwwQuery;
    dsPlano: TwwDataSource;
    qryPlano: TwwQuery;
    rgrpDataBase: TRadioGroup;
    cboxMes: TComboBox;
    seAno: TSpinEdit;
    GroupBox1: TGroupBox;
    cmbSitPart: TComboBox;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblookupPatrocinadoraChange(Sender: TObject);
  private
    { Private declarations }
  MesAno  : String;

  public
    { Public declarations }
  end;

var
  FrmParamRelParticipSituacao: TFrmParamRelParticipSituacao;

implementation

uses uDataBase, uSistema, uMensErro, uSincronismo, DRelatAdmPREV2, UAdmPrev;

{$R *.DFM}

procedure TFrmParamRelParticipSituacao.bbtnConfirmarClick(Sender: TObject);
Var
   Mes : String;
begin
   inherited;

   if rgrpDataBase.ItemIndex = 1 then
   begin
      if MsgDlg('O relatório com Data Base Retroativa baseia-se no Registro de Eventos. '+#13+
                'Deseja continuar ? ','Confirmação',mtConfirmation,[mbYes, mbNo],0) = mrNo then
        Exit;

      //Critica dados
      If (cboxMes.Text = '')  Then
      Begin
        ShowMessage('Faltam Preencher Campos ...');
        cboxMes.SetFocus;
        ModalResult := mrNone;
        Exit;
      End;

      // Transforma data em AnoMes
      if (cboxMes.ItemIndex + 1) < 9 then
        Mes := '0'+IntToStr((cboxMes.ItemIndex + 1))
      else
        Mes := IntToStr((cboxMes.ItemIndex + 1));

      MesAno :=  IntToStr(seAno.Value) + '/' + Mes ;
   end
   else
     MesAno   := Copy(FormatDateTime('dd/mm/yyyy', Date),7,4) + '/' +    
                 Copy(FormatDateTime('dd/mm/yyyy', Date),4,2);           


   dtmRelatAdmPREV2.ppLabelparticipSituacao.Caption := MesAno;

   with  dtmRelatAdmPREV2.qryParticipSituacao do
   begin
      if rgrpDataBase.ItemIndex = 1
      then begin
        close;
        SQL.clear;
        SQL.add('SELECT PLANO.NOME AS PLANO , PART.NOME AS PARTICIPANTE,           ');
        SQL.add('       PATRO.NOME AS PATROCINADORA,                               ');
        SQL.add('       E.MATRICULA, SPART.DESCRICAO AS DESCPART,                  ');
        SQL.add('       SFUNC.DESCRICAO AS DESCFUNC, SPLANO.DESCRICAO AS DESCPLANO,');
        SQL.add('       P.INSCRICAODATA, P.DATACANCELAMENTO                        ');
        SQL.add('FROM   PESSOA PATRO, PESSOA PART, ELEGPATRO E, PARTPREVPLAN P,    ');
        SQL.add('       SITPART SPART, SITFUNC SFUNC, SITPLANOPREV SPLANO,         ');
        SQL.add('       EVENTOSPREV EPREV, PLANPREV PLANO, PATRO PT,               ');
        SQL.add('       (SELECT EP1.IDPESSOA, MAX(EP1.IDEVENTOSPREV) AS IDEVENTOSPREV ');
        SQL.add('        FROM EVENTOSPREV EP1 ');
        SQL.add('        WHERE (TO_CHAR(EP1.DATAEVENTO,''YYYY/MM'') <= '+ QuotedStr(MesAno)+')');
        SQL.add('          AND (EP1.DATAVOLTA IS NULL OR TO_CHAR(EP1.DATAVOLTA,''YYYY/MM'') >= '+ QuotedStr(MesAno)+') ');
        SQL.add('          AND EP1.DATAEVENTO = (SELECT MAX(EP2.DATAEVENTO) ');
        SQL.add('                                FROM EVENTOSPREV EP2       ');
        SQL.add('                                WHERE (TO_CHAR(EP2.DATAEVENTO,''YYYY/MM'') <= '+ QuotedStr(MesAno)+') ');
        SQL.add('                                  AND (EP2.DATAVOLTA IS NULL OR ');
        SQL.add('                                       TO_CHAR(EP2.DATAVOLTA,''YYYY/MM'') >= '+ QuotedStr(MesAno)+') ');
        SQL.add('                                  AND EP2.IDPESSOA = EP1.IDPESSOA) ');
        SQL.add('        GROUP BY EP1.IDPESSOA) ULTEVN      ');
        SQL.add('WHERE ULTEVN.IDPESSOA = EPREV.IDPESSOA ');
        SQL.add('  AND ULTEVN.IDEVENTOSPREV  = EPREV.IDEVENTOSPREV ');
        SQL.add('  AND (TO_CHAR(P.INSCRICAODATA,''YYYY/MM'') <= '+QuotedStr(MesAno)+') ');
        SQL.add('  AND ( (TO_CHAR(P.DATACANCELAMENTO,''YYYY/MM'') > '+QuotedStr(MesAno)+') OR ');
        SQL.add('        (P.DATACANCELAMENTO IS NULL)) ');
        If cmbSitPart.Text <> ''
         Then Begin
           Case cmbSitPart.ItemIndex of
                1 : SQL.Add('  AND SPART.FLGINTERNO = ''AT'' ');
                2 : SQL.Add('  AND SPART.FLGINTERNO = ''MA'' ');
                3 : SQL.Add('  AND SPART.FLGINTERNO = ''MP'' ');
                4 : SQL.Add('  AND SPART.FLGINTERNO = ''AS'' ');
                5 : SQL.Add('  AND SPART.FLGINTERNO = ''MS'' ');
                6 : SQL.Add('  AND SPART.FLGINTERNO = ''CA'' ');
                7 : SQL.Add('  AND SPART.FLGINTERNO = ''AE'' ');
                8 : SQL.Add('  AND SPART.FLGINTERNO = ''PN'' ');
           End;
        End;
        if dblookupPatrocinadora.Text <> ''
        then SQL.Add(' AND (PATRO.IDPESSOA = ' +qryPatro.FieldByName('IDPESSOA').AsString+ ')');

        //* Plano *
        if dblookupPlano.Text <> ''
        then SQL.Add(' AND (PLANO.IDPLANOPREV = ' +qryPlano.FieldByName('IDPLANOPREV').AsString+ ')');

        SQL.Add('  AND PLANO.IDPLANOPREV     = P.IDPLANOPREV         ');
        SQL.add('  AND PATRO.IDPESSOA        = P.IDPESSJUR           ');
        SQL.add('  AND PART.IDPESSOA         = P.IDPESSOA            ');
        SQL.add('  AND PT.IDPESSOA           = P.IDPESSJUR           '); 
        SQL.add('  AND PT.IDFUNDACAO         = '+IntToStr(iIdFundacao)); 
        SQL.add('  AND E.IDPESSJUR           = P.IDPESSJUR           ');
        SQL.add('  AND E.IDPESSOA            = P.IDPESSOA            ');
        SQL.add('  AND EPREV.IDSITFUNCNOVO   = SFUNC.IDSITFUNC       ');
        SQL.add('  AND EPREV.IDSITPARTNOVO   = SPART.IDSITPART       ');
        SQL.add('  AND EPREV.IDSITPLANONOVO  = SPLANO.IDSITPLANOPREV ');
        SQL.add('  AND P.IDPESSOA            = EPREV.IDPESSOA        ');
        SQL.add('  AND P.IDPESSJUR           = EPREV.IDPESSJUR       ');
        SQL.add('  AND P.IDPLANOPREV         = EPREV.IDPLANOPREV     ');
        SQL.add('  AND P.SEQPROPOSTA         = EPREV.SEQPROPOSTA     ');
        SQL.add('ORDER BY PLANO.NOME, PATRO.NOME, SPART.DESCRICAO  ');

        Open;
      end
      else begin // posicao atual
        close;
        SQL.clear;
        SQL.add(' SELECT PLANO.NOME AS PLANO , PART.NOME AS PARTICIPANTE,           '+
                '        PATRO.NOME AS PATROCINADORA,                               '+
                '        E.MATRICULA, SPART.DESCRICAO AS DESCPART,                  '+
                '        SFUNC.DESCRICAO AS DESCFUNC, SPLANO.DESCRICAO AS DESCPLANO,'+
                '        P.INSCRICAODATA, P.DATACANCELAMENTO                        '+
                ' FROM   PESSOA PATRO, PESSOA PART, ELEGPATRO E, PARTPREVPLAN P,    '+
                '        SITPART SPART, SITFUNC SFUNC, SITPLANOPREV SPLANO,         '+
                '        PLANPREV PLANO                                             '+
                ' WHERE  P.FLGDESATIVADO = 0                                        '+
                ' AND    PLANO.IDPLANOPREV     = P.IDPLANOPREV                       ');
        //* Patrocinadora *
        if dblookupPatrocinadora.Text <> ''
        then SQL.Add(' AND (P.IDPESSJUR     = ' +qryPatro.FieldByName('IDPESSOA').AsString+ ')');

        //* Plano *
        if dblookupPlano.Text <> ''
        then SQL.Add(' AND (P.IDPLANOPREV   = ' +qryPlano.FieldByName('IDPLANOPREV').AsString+ ')');

        if cmbSitPart.Text <> ''
        then begin
           case cmbSitPart.ItemIndex of
                1 : SQL.Add('AND SPART.FLGINTERNO = ''AT'' ');
                2 : SQL.Add('AND SPART.FLGINTERNO = ''MA'' ');
                3 : SQL.Add('AND SPART.FLGINTERNO = ''MP'' ');
                4 : SQL.Add('AND SPART.FLGINTERNO = ''AS'' ');
                5 : SQL.Add('AND SPART.FLGINTERNO = ''MS'' ');
                6 : SQL.Add('AND SPART.FLGINTERNO = ''CA'' ');
                7 : SQL.Add('AND SPART.FLGINTERNO = ''AE'' ');
                8 : SQL.Add('AND SPART.FLGINTERNO = ''PN'' ');
           end;
        end;

        SQL.Add(' AND PATRO.IDPESSOA        = P.IDPESSJUR                           '+
                ' AND PART.IDPESSOA         = P.IDPESSOA                            '+
                ' AND E.IDPESSJUR           = P.IDPESSJUR                           '+
                ' AND E.IDPESSOA            = P.IDPESSOA                            '+
                ' AND SFUNC.IDSITFUNC       = E.IDSITFUNC                           '+
                ' AND SPART.IDSITPART       = P.IDSITPART                           '+
                ' AND SPLANO.IDSITPLANOPREV = P.IDSITPLANOPREV                      '+
                ' ORDER BY PLANO.NOME, PATRO.NOME, SPART.DESCRICAO  ');
        Open;
      end;
   end;
end;

procedure TFrmParamRelParticipSituacao.FormShow(Sender: TObject);
var
  AYear, AMonth, ADay: Word;
  sAno : string;
begin
  inherited;
  DecodeDate(date, AYear, AMonth, ADay);
  if (AMonth >= 1) and (AMonth <= 12)
  then begin
     cboxMes.ItemIndex := AMonth - 1;
     cboxMes.Text := cboxMes.Items[cboxMes.ItemIndex];
  end;
  seAno.Text   := IntToStr(AYear);

  with qryPatro do //Selecionando automaticamente a Primeira Patrocinadora da Lista;
  begin
    Close;
    ParamByName('IDFUNDACAO').AsInteger := iIdFundacao; 
    Open;
    if RecordCount > 0 then
     dblookupPatrocinadora.Text := FieldByName('NOME').AsString;
  end;

  //Filtra Plano por Patrocinadora Indicada
  with  qryPlano do
  begin
    close;
    ParamByName('IDPESSJUR').AsInteger := qryPatro.FieldByName('IDPESSOA').AsInteger;
    open;
    if RecordCount > 0 then
     dblookupPlano.Text := FieldByName('NOME').AsString;
  end;
end;

procedure TFrmParamRelParticipSituacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

  //Fechando as Queries; 
  qryPlano.Close;
  qryPatro.Close; 
end;

procedure TFrmParamRelParticipSituacao.dblookupPatrocinadoraChange(
  Sender: TObject);
begin
  inherited;
  with  qryPlano do
  begin
    close;
    ParamByName('IDPESSJUR').AsInteger := qryPatro.FieldByName('IDPESSOA').AsInteger;
    open;
    if RecordCount > 0 then
     dblookupPlano.Text := FieldByName('NOME').AsString;
  end;
end;

end.
