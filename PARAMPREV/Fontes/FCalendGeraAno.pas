unit FCalendGeraAno;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Spin, ComCtrls, Db, DBTables, Wwquery, wwdblook;

type
  TfrmCalendGeraAno = class(TfrmOkCancelar)
    Label1: TLabel;
    dblkpcmbCalend: TwwDBLookupCombo;
    qryCalendario: TwwQuery;
    qryCalendarioIDCALENDARIO: TFloatField;
    qryCalendarioNOME: TStringField;
    Panel1: TPanel;
    Label18: TLabel;
    spedAnoRef: TSpinEdit;
    Label12: TLabel;
    qryInsCalendDatas: TwwQuery;
    qryConsCalendDatas: TwwQuery;
    qryConsCalendDatasIDCALENDARIO: TFloatField;
    PageControl1: TPageControl;
    tbsAT: TTabSheet;
    PageControl2: TPageControl;
    tbsCobranca: TTabSheet;
    pnlNormalAT: TPanel;
    Label4: TLabel;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    spedNormalAT: TSpinEdit;
    rgrpUtilNormalAT: TRadioGroup;
    rgrpAntNormalAT: TRadioGroup;
    rgrpMesNormalAT: TRadioGroup;
    pnlAtrasoAT: TPanel;
    Label5: TLabel;
    GroupBox3: TGroupBox;
    Label6: TLabel;
    spedAtrasoAT: TSpinEdit;
    rgrpUtilAtrasoAT: TRadioGroup;
    rgrpAntAtrasoAT: TRadioGroup;
    rgrpMesAtrasoAT: TRadioGroup;
    pnlDevolucaoAT: TPanel;
    Label7: TLabel;
    GroupBox4: TGroupBox;
    Label8: TLabel;
    spedDevolucaoAT: TSpinEdit;
    rgrpUtilDevolucaoAT: TRadioGroup;
    rgrpAntDevolucaoAT: TRadioGroup;
    rgrpMesDevolucaoAT: TRadioGroup;
    tbsBenefAT: TTabSheet;
    pnlAntBenefAT: TPanel;
    Label9: TLabel;
    GroupBox2: TGroupBox;
    Label10: TLabel;
    spedAntBenefAT: TSpinEdit;
    rgrpUtilAntBenefAT: TRadioGroup;
    rgrpAntAntBenefAT: TRadioGroup;
    rgrpMesAntBenefAT: TRadioGroup;
    pnlBenefAT: TPanel;
    Label11: TLabel;
    GroupBox5: TGroupBox;
    Label13: TLabel;
    spedBenefAT: TSpinEdit;
    rgrpUtilBenefAT: TRadioGroup;
    rgrpAntBenefAT: TRadioGroup;
    rgrpMesBenefAT: TRadioGroup;
    pnlAbonoAT: TPanel;
    Label14: TLabel;
    GroupBox6: TGroupBox;
    Label15: TLabel;
    spedAbonoAT: TSpinEdit;
    rgrpUtilAbonoAT: TRadioGroup;
    rgrpAntAbonoAT: TRadioGroup;
    rgrpMesAbonoAT: TRadioGroup;
    pnlAntAbonoAT: TPanel;
    Label16: TLabel;
    GroupBox7: TGroupBox;
    Label17: TLabel;
    spedAntAbonoAT: TSpinEdit;
    rgrpUtilAntAbonoAT: TRadioGroup;
    rgrpAntAntAbonoAT: TRadioGroup;
    rgrpMesAntAbonoAT: TRadioGroup;
    tbsMA: TTabSheet;
    tbsMP: TTabSheet;
    tbsAS: TTabSheet;
    tbsPT: TTabSheet;
    PageControl3: TPageControl;
    tbsCobMA: TTabSheet;
    pnlNormalMA: TPanel;
    Label2: TLabel;
    GroupBox8: TGroupBox;
    Label19: TLabel;
    spedNormalMA: TSpinEdit;
    rgrpUtilNormalMA: TRadioGroup;
    rgrpAntNormalMA: TRadioGroup;
    rgrpMesNormalMA: TRadioGroup;
    pnlAtrasoMA: TPanel;
    Label20: TLabel;
    GroupBox9: TGroupBox;
    Label21: TLabel;
    spedAtrasoMA: TSpinEdit;
    rgrpUtilAtrasoMA: TRadioGroup;
    rgrpAntAtrasoMA: TRadioGroup;
    rgrpMesAtrasoMA: TRadioGroup;
    pnlDevolucaoMA: TPanel;
    Label22: TLabel;
    GroupBox10: TGroupBox;
    Label23: TLabel;
    spedDevolucaoMA: TSpinEdit;
    rgrpUtilDevolucaoMA: TRadioGroup;
    rgrpAntDevolucaoMA: TRadioGroup;
    rgrpMesDevolucaoMA: TRadioGroup;
    tbsBenefMA: TTabSheet;
    pnlAntBenefMA: TPanel;
    Label24: TLabel;
    GroupBox11: TGroupBox;
    Label25: TLabel;
    spedAntBenefMA: TSpinEdit;
    rgrpUtilAntBenefMA: TRadioGroup;
    rgrpAntAntBenefMA: TRadioGroup;
    rgrpMesAntBenefMA: TRadioGroup;
    pnlBenefMA: TPanel;
    Label26: TLabel;
    GroupBox12: TGroupBox;
    Label27: TLabel;
    spedBenefMA: TSpinEdit;
    rgrpUtilBenefMA: TRadioGroup;
    rgrpAntBenefMA: TRadioGroup;
    rgrpMesBenefMA: TRadioGroup;
    pnlAbonoMA: TPanel;
    Label28: TLabel;
    GroupBox13: TGroupBox;
    Label29: TLabel;
    spedAbonoMA: TSpinEdit;
    rgrpUtilAbonoMA: TRadioGroup;
    rgrpAntAbonoMA: TRadioGroup;
    rgrpMesAbonoMA: TRadioGroup;
    pnlAntAbonoMA: TPanel;
    Label30: TLabel;
    GroupBox14: TGroupBox;
    Label31: TLabel;
    spedAntAbonoMA: TSpinEdit;
    rgrpUtilAntAbonoMA: TRadioGroup;
    rgrpAntAntAbonoMA: TRadioGroup;
    rgrpMesAntAbonoMA: TRadioGroup;
    PageControl4: TPageControl;
    tbsCobMP: TTabSheet;
    pnlNormalMP: TPanel;
    Label32: TLabel;
    GroupBox15: TGroupBox;
    Label33: TLabel;
    spedNormalMP: TSpinEdit;
    rgrpUtilNormalMP: TRadioGroup;
    rgrpAntNormalMP: TRadioGroup;
    rgrpMesNormalMP: TRadioGroup;
    pnlAtrasoMP: TPanel;
    Label34: TLabel;
    GroupBox16: TGroupBox;
    Label35: TLabel;
    spedAtrasoMP: TSpinEdit;
    rgrpUtilAtrasoMP: TRadioGroup;
    rgrpAntAtrasoMP: TRadioGroup;
    rgrpMesAtrasoMP: TRadioGroup;
    pnlDevolucaoMP: TPanel;
    Label36: TLabel;
    GroupBox17: TGroupBox;
    Label37: TLabel;
    spedDevolucaoMP: TSpinEdit;
    rgrpUtilDevolucaoMP: TRadioGroup;
    rgrpAntDevolucaoMP: TRadioGroup;
    rgrpMesDevolucaoMP: TRadioGroup;
    tbsBenefMP: TTabSheet;
    pnlAntBenfMP: TPanel;
    Label38: TLabel;
    GroupBox18: TGroupBox;
    Label39: TLabel;
    spedAntBenefMP: TSpinEdit;
    rgrpUtilAntBenefMP: TRadioGroup;
    rgrpAntAntBenefMP: TRadioGroup;
    rgrpMesAntBenefMP: TRadioGroup;
    pnlBenefMP: TPanel;
    Label40: TLabel;
    GroupBox19: TGroupBox;
    Label41: TLabel;
    spedBenefMP: TSpinEdit;
    rgrpUtilBenefMP: TRadioGroup;
    rgrpAntBenefMP: TRadioGroup;
    rgrpMesBenefMP: TRadioGroup;
    pnlAbonoMP: TPanel;
    Label42: TLabel;
    GroupBox20: TGroupBox;
    Label43: TLabel;
    spedAbonoMP: TSpinEdit;
    rgrpUtilAbonoMP: TRadioGroup;
    rgrpAntAbonoMP: TRadioGroup;
    rgrpMesAbonoMP: TRadioGroup;
    pnlAntAbonoMP: TPanel;
    Label44: TLabel;
    GroupBox21: TGroupBox;
    Label45: TLabel;
    spedAntAbonoMP: TSpinEdit;
    rgrpUtilAntAbonoMP: TRadioGroup;
    rgrpAntAntAbonoMP: TRadioGroup;
    rgrpMesAntAbonoMP: TRadioGroup;
    PageControl5: TPageControl;
    tbsCobAS: TTabSheet;
    pnlNormalAS: TPanel;
    Label46: TLabel;
    GroupBox22: TGroupBox;
    Label47: TLabel;
    spedNormalAS: TSpinEdit;
    rgrpUtilNormalAS: TRadioGroup;
    rgrpAntNormalAS: TRadioGroup;
    rgrpMesNormalAS: TRadioGroup;
    pnlAtrasoAS: TPanel;
    Label48: TLabel;
    GroupBox23: TGroupBox;
    Label49: TLabel;
    spedAtrasoAS: TSpinEdit;
    rgrpUtilAtrasoAS: TRadioGroup;
    rgrpAntAtrasoAS: TRadioGroup;
    rgrpMesAtrasoAS: TRadioGroup;
    pnlDevolucaoAS: TPanel;
    Label50: TLabel;
    GroupBox24: TGroupBox;
    Label51: TLabel;
    spedDevolucaoAS: TSpinEdit;
    rgrpUtilDevolucaoAS: TRadioGroup;
    rgrpAntDevolucaoAS: TRadioGroup;
    rgrpMesDevolucaoAS: TRadioGroup;
    tbsBenefAS: TTabSheet;
    pnlAntBenefAS: TPanel;
    Label52: TLabel;
    GroupBox25: TGroupBox;
    Label53: TLabel;
    spedAntBenefAS: TSpinEdit;
    rgrpUtilAntBenefAS: TRadioGroup;
    rgrpAntAntBenefAS: TRadioGroup;
    rgrpMesAntBenefAS: TRadioGroup;
    pnlBenefAS: TPanel;
    Label54: TLabel;
    GroupBox26: TGroupBox;
    Label55: TLabel;
    spedBenefAS: TSpinEdit;
    rgrpUtilBenefAS: TRadioGroup;
    rgrpAntBenefAS: TRadioGroup;
    rgrpMesBenefAS: TRadioGroup;
    pnlAbonoAS: TPanel;
    Label56: TLabel;
    GroupBox27: TGroupBox;
    Label57: TLabel;
    spedAbonoAS: TSpinEdit;
    rgrpUtilAbonoAS: TRadioGroup;
    rgrpAntAbonoAS: TRadioGroup;
    rgrpMesAbonoAS: TRadioGroup;
    pnlAntAbonoAS: TPanel;
    Label58: TLabel;
    GroupBox28: TGroupBox;
    Label59: TLabel;
    spedAntAbonoAS: TSpinEdit;
    rgrpUtilAntAbonoAS: TRadioGroup;
    rgrpAntAntAbonoAS: TRadioGroup;
    rgrpMesAntAbonoAS: TRadioGroup;
    PageControl6: TPageControl;
    tbsCobPT: TTabSheet;
    pnlNormalPT: TPanel;
    Label60: TLabel;
    GroupBox29: TGroupBox;
    Label61: TLabel;
    spedNormalPT: TSpinEdit;
    rgrpUtilNormalPT: TRadioGroup;
    rgrpAntNormalPT: TRadioGroup;
    rgrpMesNormalPT: TRadioGroup;
    pnlAtrasoPT: TPanel;
    Label62: TLabel;
    GroupBox30: TGroupBox;
    Label63: TLabel;
    spedAtrasoPT: TSpinEdit;
    rgrpUtilAtrasoPT: TRadioGroup;
    rgrpAntAtrasoPT: TRadioGroup;
    rgrpMesAtrasoPT: TRadioGroup;
    pnlDevolucaoPT: TPanel;
    Label64: TLabel;
    GroupBox31: TGroupBox;
    Label65: TLabel;
    spedDevolucaoPT: TSpinEdit;
    rgrpUtilDevolucaoPT: TRadioGroup;
    rgrpAntDevolucaoPT: TRadioGroup;
    rgrpMesDevolucaoPT: TRadioGroup;
    tbsBenefPT: TTabSheet;
    pnlAntBenefPT: TPanel;
    Label66: TLabel;
    GroupBox32: TGroupBox;
    Label67: TLabel;
    spedAntBenefPT: TSpinEdit;
    rgrpUtilAntBenefPT: TRadioGroup;
    rgrpAntAntBenefPT: TRadioGroup;
    rgrpMesAntBenefPT: TRadioGroup;
    pnlBenefPT: TPanel;
    Label68: TLabel;
    GroupBox33: TGroupBox;
    Label69: TLabel;
    spedBenefPT: TSpinEdit;
    rgrpUtilBenefPT: TRadioGroup;
    rgrpAntBenefPT: TRadioGroup;
    rgrpMesBenefPT: TRadioGroup;
    pnlAbonoPT: TPanel;
    Label70: TLabel;
    GroupBox34: TGroupBox;
    Label71: TLabel;
    spedAbonoPT: TSpinEdit;
    rgrpUtilAbonoPT: TRadioGroup;
    rgrpAntAbonoPT: TRadioGroup;
    rgrpMesAbonoPT: TRadioGroup;
    pnlAntAbonoPT: TPanel;
    Label72: TLabel;
    GroupBox35: TGroupBox;
    Label73: TLabel;
    spedAntAbonoPT: TSpinEdit;
    rgrpUtilAntAbonoPT: TRadioGroup;
    rgrpAntAntAbonoPT: TRadioGroup;
    rgrpMesAntAbonoPT: TRadioGroup;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    function CalcDataDefault(piDia,piMes,piUtil,piAnt : integer;psMesRef,psAnoRef : string) : TDateTime;
    function RetornaValorObjeto(psNomePnl,psNome : string) : integer;
    function RetornaDataCobranca(iDia : integer; sUtil,sAnterior,sMesCorrente,sMesReferencia,sAnoReferencia : string) : String;
  public
    { Public declarations }
  end;

var
  frmCalendGeraAno: TfrmCalendGeraAno;

implementation

uses UDataBase, USistema, UMensErro, UAdmPrev, UFuncoesUteis;

{$R *.DFM}

procedure TfrmCalendGeraAno.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryCalendario.Close;
  qryInsCalendDatas.Close;
  qryInsCalendDatas.UnPrepare;
  qryConsCalendDatas.Close;
  qryConsCalendDatas.UnPrepare;
end; 

procedure TfrmCalendGeraAno.FormCreate(Sender: TObject);
var
  AYear, AMonth, ADay : Word;
begin
  inherited;
  qryInsCalendDatas.Prepare;
  qryConsCalendDatas.Prepare;
  DecodeDate(date, AYear, AMonth, ADay);
  spedAnoRef.Text   := IntToStr(AYear);
  qryCalendario.Close;
  qryCalendario.Open;
end; 

procedure TfrmCalendGeraAno.bbtnConfirmarClick(Sender: TObject);
var
   i,
   j : Byte;
   sMes : String;
begin
  inherited;
  if Trim(dblkpcmbCalend.Text) = ''
  then begin
         MsgDlg('Preenche o Calendário.', 'Erro', mtError, [mbOk], 0);
         Exit;
       end;

  if Trim(spedAnoRef.Text) = ''
  then begin
         MsgDlg('Preenche o Ano.', 'Erro', mtError, [mbOk], 0);
         Exit;
       end;

  qryConsCalendDatas.Close;
  qryConsCalendDatas.ParamByName('IdCalendario').Value := qryCalendario.FieldByName('IdCalendario').AsInteger;
  qryConsCalendDatas.ParamByName('Ano').Value := spedAnoRef.Text;
  qryConsCalendDatas.Open;
  if qryConsCalendDatas.IsEmpty
  then begin
         qryConsCalendDatas.Close;
         // Ativos
         for j := 1 to 12 do
         begin
            if j < 10
            then sMes := '0'+ IntToStr(j)
            else sMes := IntToStr(j);

            with qryInsCalendDatas do
            begin
              Close;
              ParamByName('IDCALENDARIO').Value      := qryCalendario.FieldByName('IdCalendario').AsInteger;
              ParamByName('FLGINTERNO').Value        := 'AT';
              ParamByName('ANOMESREF').Value         := spedAnoRef.Text + '/' + sMes;
              ParamByName('DATACOBNORMAL').Value     := CalcDataDefault(StrToInt(spedNormalAT.Text),
                                                                        rgrpMesNormalAT.ItemIndex,
                                                                        rgrpUtilNormalAT.ItemIndex,
                                                                        rgrpAntNormalAT.ItemIndex,
                                                                        sMes,spedAnoRef.Text);
              ParamByName('DATACOBATRASO').Value     := CalcDataDefault(StrToInt(spedAtrasoAT.Text),
                                                                        rgrpMesAtrasoAT.ItemIndex,
                                                                        rgrpUtilAtrasoAT.ItemIndex,
                                                                        rgrpAntAtrasoAT.ItemIndex,
                                                                        sMes,spedAnoRef.Text);
              ParamByName('DATACOBDEVOLUCAO').Value  := CalcDataDefault(StrToInt(spedDevolucaoAT.Text),
                                                                        rgrpMesDevolucaoAT.ItemIndex,
                                                                        rgrpUtilDevolucaoAT.ItemIndex,
                                                                        rgrpAntDevolucaoAT.ItemIndex,
                                                                        sMes,spedAnoRef.Text);
              // Só tem Cobrança
              ParamByName('DATAPAGBENEF').Clear;
              ParamByName('DATAPAGABONO').Clear;
              ParamByName('DATAPAGANTBENEF').Clear;
              ParamByName('DATAPAGANTABONO').Clear;



              try
                ExecSQL;
              except
                on E: EDBEngineError do
                begin
                  MostrarErro(E);
                  Exit;
                end;
              end;
            end;
         end;

         // Mantidos
         for j := 1 to 12 do
         begin
            if j < 10
            then sMes := '0'+ IntToStr(j)
            else sMes := IntToStr(j);

            with qryInsCalendDatas do
            begin
              Close;
              ParamByName('IDCALENDARIO').Value      := qryCalendario.FieldByName('IdCalendario').AsInteger;
              ParamByName('FLGINTERNO').Value        := 'MA';
              ParamByName('ANOMESREF').Value         := spedAnoRef.Text + '/' + sMes;
              ParamByName('DATACOBNORMAL').Value     := CalcDataDefault(StrToInt(spedNormalMA.Text),
                                                                        rgrpMesNormalMA.ItemIndex,
                                                                        rgrpUtilNormalMA.ItemIndex,
                                                                        rgrpAntNormalMA.ItemIndex,
                                                                        sMes,spedAnoRef.Text);
              ParamByName('DATACOBATRASO').Value     := CalcDataDefault(StrToInt(spedAtrasoMA.Text),
                                                                        rgrpMesAtrasoMA.ItemIndex,
                                                                        rgrpUtilAtrasoMA.ItemIndex,
                                                                        rgrpAntAtrasoMA.ItemIndex,
                                                                        sMes,spedAnoRef.Text);
              ParamByName('DATACOBDEVOLUCAO').Value  := CalcDataDefault(StrToInt(spedDevolucaoMA.Text),
                                                                        rgrpMesDevolucaoMA.ItemIndex,
                                                                        rgrpUtilDevolucaoMA.ItemIndex,
                                                                        rgrpAntDevolucaoMA.ItemIndex,
                                                                        sMes,spedAnoRef.Text);

              // Só tem Cobrança
              ParamByName('DATAPAGBENEF').Clear;
              ParamByName('DATAPAGABONO').Clear;
              ParamByName('DATAPAGANTBENEF').Clear;
              ParamByName('DATAPAGANTABONO').Clear;

              try
                ExecSQL;
              except
                on E: EDBEngineError do
                begin
                  MostrarErro(E);
                  Exit;
                end;
              end;
            end;
         end;

         // Mantidos Parciais
         for j := 1 to 12 do
         begin
            if j < 10
            then sMes := '0'+ IntToStr(j)
            else sMes := IntToStr(j);

            with qryInsCalendDatas do
            begin
              Close;
              ParamByName('IDCALENDARIO').Value      := qryCalendario.FieldByName('IdCalendario').AsInteger;
              ParamByName('FLGINTERNO').Value        := 'MP';
              ParamByName('ANOMESREF').Value         := spedAnoRef.Text + '/' + sMes;
              ParamByName('DATACOBNORMAL').Value     := CalcDataDefault(StrToInt(spedNormalMP.Text),
                                                                        rgrpMesNormalMP.ItemIndex,
                                                                        rgrpUtilNormalMP.ItemIndex,
                                                                        rgrpAntNormalMP.ItemIndex,
                                                                        sMes,spedAnoRef.Text);
              ParamByName('DATACOBATRASO').Value     := CalcDataDefault(StrToInt(spedAtrasoMP.Text),
                                                                        rgrpMesAtrasoMP.ItemIndex,
                                                                        rgrpUtilAtrasoMP.ItemIndex,
                                                                        rgrpAntAtrasoMP.ItemIndex,
                                                                        sMes,spedAnoRef.Text);
              ParamByName('DATACOBDEVOLUCAO').Value  := CalcDataDefault(StrToInt(spedDevolucaoMP.Text),
                                                                        rgrpMesDevolucaoMP.ItemIndex,
                                                                        rgrpUtilDevolucaoMP.ItemIndex,
                                                                        rgrpAntDevolucaoMP.ItemIndex,
                                                                        sMes,spedAnoRef.Text);

              // Só tem Cobrança
              ParamByName('DATAPAGBENEF').Clear;
              ParamByName('DATAPAGABONO').Clear;
              ParamByName('DATAPAGANTBENEF').Clear;
              ParamByName('DATAPAGANTABONO').Clear;

              try
                ExecSQL;
              except
                on E: EDBEngineError do
                begin
                  MostrarErro(E);
                  Exit;
                end;
              end;
            end;
         end;

         // Assistidos
         for j := 1 to 12 do
         begin
            if j < 10
            then sMes := '0'+ IntToStr(j)
            else sMes := IntToStr(j);

            with qryInsCalendDatas do
            begin
              Close;
              ParamByName('IDCALENDARIO').Value      := qryCalendario.FieldByName('IdCalendario').AsInteger;
              ParamByName('FLGINTERNO').Value        := 'AS';
              ParamByName('ANOMESREF').Value         := spedAnoRef.Text + '/' + sMes;
              ParamByName('DATACOBNORMAL').Value     := CalcDataDefault(StrToInt(spedNormalAS.Text),
                                                                        rgrpMesNormalAS.ItemIndex,
                                                                        rgrpUtilNormalAS.ItemIndex,
                                                                        rgrpAntNormalAS.ItemIndex,
                                                                        sMes,spedAnoRef.Text);
              ParamByName('DATACOBATRASO').Value     := CalcDataDefault(StrToInt(spedAtrasoAS.Text),
                                                                        rgrpMesAtrasoAS.ItemIndex,
                                                                        rgrpUtilAtrasoAS.ItemIndex,
                                                                        rgrpAntAtrasoAS.ItemIndex,
                                                                        sMes,spedAnoRef.Text);
              ParamByName('DATACOBDEVOLUCAO').Value  := CalcDataDefault(StrToInt(spedDevolucaoAS.Text),
                                                                        rgrpMesDevolucaoAS.ItemIndex,
                                                                        rgrpUtilDevolucaoAS.ItemIndex,
                                                                        rgrpAntDevolucaoAS.ItemIndex,
                                                                        sMes,spedAnoRef.Text);
              ParamByName('DATAPAGBENEF').Value      := CalcDataDefault(StrToInt(spedBenefAS.Text),
                                                                        rgrpMesBenefAS.ItemIndex,
                                                                        rgrpUtilBenefAS.ItemIndex,
                                                                        rgrpAntBenefAS.ItemIndex,
                                                                        sMes,spedAnoRef.Text);
              ParamByName('DATAPAGABONO').Value      := CalcDataDefault(StrToInt(spedAbonoAS.Text),
                                                                        rgrpMesAbonoAS.ItemIndex,
                                                                        rgrpUtilAbonoAS.ItemIndex,
                                                                        rgrpAntAbonoAS.ItemIndex,
                                                                        sMes,spedAnoRef.Text);
              ParamByName('DATAPAGANTBENEF').Value   := CalcDataDefault(StrToInt(spedAntBenefAS.Text),
                                                                        rgrpMesAntBenefAS.ItemIndex,
                                                                        rgrpUtilAntBenefAS.ItemIndex,
                                                                        rgrpAntAntBenefAS.ItemIndex,
                                                                        sMes,spedAnoRef.Text);
              ParamByName('DATAPAGANTABONO').Value   := CalcDataDefault(StrToInt(spedAntAbonoAS.Text),
                                                                        rgrpMesAntAbonoAS.ItemIndex,
                                                                        rgrpUtilAntAbonoAS.ItemIndex,
                                                                        rgrpAntAntAbonoAS.ItemIndex,
                                                                        sMes,spedAnoRef.Text);
              try
                ExecSQL;
              except
                on E: EDBEngineError do
                begin
                  MostrarErro(E);
                  Exit;
                end;
              end;
            end;
         end;

         // Patrocinadora
         for j := 1 to 12 do
         begin
            if j < 10
            then sMes := '0'+ IntToStr(j)
            else sMes := IntToStr(j);

            with qryInsCalendDatas do
            begin
              Close;
              ParamByName('IDCALENDARIO').Value      := qryCalendario.FieldByName('IdCalendario').AsInteger;
              ParamByName('FLGINTERNO').Value        := 'PT';
              ParamByName('ANOMESREF').Value         := spedAnoRef.Text + '/' + sMes;
              ParamByName('DATACOBNORMAL').Value     := CalcDataDefault(StrToInt(spedNormalPT.Text),
                                                                        rgrpMesNormalPT.ItemIndex,
                                                                        rgrpUtilNormalPT.ItemIndex,
                                                                        rgrpAntNormalPT.ItemIndex,
                                                                        sMes,spedAnoRef.Text);
              ParamByName('DATACOBATRASO').Value     := CalcDataDefault(StrToInt(spedAtrasoPT.Text),
                                                                        rgrpMesAtrasoPT.ItemIndex,
                                                                        rgrpUtilAtrasoPT.ItemIndex,
                                                                        rgrpAntAtrasoPT.ItemIndex,
                                                                        sMes,spedAnoRef.Text);
              ParamByName('DATACOBDEVOLUCAO').Value  := CalcDataDefault(StrToInt(spedDevolucaoPT.Text),
                                                                        rgrpMesDevolucaoPT.ItemIndex,
                                                                        rgrpUtilDevolucaoPT.ItemIndex,
                                                                        rgrpAntDevolucaoPT.ItemIndex,
                                                                        sMes,spedAnoRef.Text);

              // Só tem Cobrança
              ParamByName('DATAPAGBENEF').Clear;
              ParamByName('DATAPAGABONO').Clear;
              ParamByName('DATAPAGANTBENEF').Clear;
              ParamByName('DATAPAGANTABONO').Clear;

              try
                ExecSQL;
              except
                on E: EDBEngineError do
                begin
                  MostrarErro(E);
                  Exit;
                end;
              end;
            end;
         end;

       end
  else begin
         qryConsCalendDatas.Close;
         MsgDlg('Este Ano já existe neste Calendário. Utilize o Cadastro de Datas do Calendário para alterá-lo.', TForm(Sender).Caption, mtInformation, [mbOk], 0);
         Exit;
       end;
    
    
    Try
      If Not Sistema.GravaLogOperacoes(Self.Caption) Then
        raise exception.Create('Erro ao gravar Log.')
    Except
    End;

end; 

function TfrmCalendGeraAno.CalcDataDefault(piDia,piMes,piUtil,piAnt : integer;psMesRef,psAnoRef : string) : TDateTime;
var
  sMesCorr,
  sUtil,
  sDiaAnt  : string;
begin

  Case piMes of
    0 : sMesCorr := 'A'; // anterior
    1 : sMesCorr := 'C'; // corrente
    2 : sMesCorr := 'P'; // posterior
  end;

  Case piUtil of
    0 : sUtil := 'N';
    1 : sUtil := 'U';
  end;

  Case piAnt of
    0 : sDiaAnt := 'A';
    1 : sDiaAnt := 'P';
  end;

  Result := StrToDateTime(RetornaDataCobranca(piDia,sUtil,sDiaAnt,sMesCorr,psMesRef,psAnoRef));

end; 

function TfrmCalendGeraAno.RetornaValorObjeto(psNomePnl,psNome : string) : integer;
var
  i : byte;
begin
  i := 0;
  while (frmCalendGeraAno.Components[i].Name <> psNome) and
        (i <= frmCalendGeraAno.ComponentCount) do
    Inc(i);

  if psNomePnl = '1'
  then Result := StrToInt(TSpinEdit(frmCalendGeraAno.Components[i]).Text)
  else Result := TRadioGroup(frmCalendGeraAno.Components[i]).ItemIndex;
end; 

procedure TfrmCalendGeraAno.FormActivate(Sender: TObject);
begin
  inherited;
  tbsBenefAT.TabVisible := False;
  tbsBenefMA.TabVisible := False;
  tbsBenefMP.TabVisible := False;
  tbsBenefPT.TabVisible := False;
end;

function TfrmCalendGeraAno.RetornaDataCobranca(iDia : integer; sUtil,sAnterior,sMesCorrente,sMesReferencia,sAnoReferencia : string) : String;
var
  sDia, sMesAno, sData, sDiaUtil: string;
  dDataUtil,
  dData: double;
begin
  Result := '';

  if iDia = 0  then iDia := 1;
  if iDia > 31 then iDia := 30;
  try
     if iDia <= 9
     then sDia := '0'+IntToStr(iDia)
     else sDia := IntToStr(iDia);

     if sMesCorrente = 'P'
     then sMesAno := ProximoMesAno(StrToInt(sMesReferencia), StrToInt(sAnoReferencia))
     else sMesAno := sMesReferencia + '/' + sAnoReferencia;
  except
     exit;
  end;
  if (StrToInt(Copy(sMesAno,1,2)) = 2) and (StrToInt(sDia) >= 29)
  then sDia := '28';

  
  if TrazUltDiaMes(StrToInt(sMesReferencia) ,StrToInt(sAnoReferencia)) < StrToInt(sDia)
  then sDia := IntToStr(TrazUltDiaMes(StrToInt(sMesReferencia) ,StrToInt(sAnoReferencia)) );

  dData := StrToDate(sDia + '/' + sMesAno);

  if sUtil = 'N' // Dia NORMAL(FIXO) - Ex: se DIA = 5, pega Dia 5 do mes
  then begin
      if DayOfWeek(dData) = 1
      then begin// Se Dia da Semana for Domingo
         if sAnterior = 'A'
         then sData := DateToStr(dData - 2) // Pegar Dia Anterior. 6a. feira
         else sData := DateToStr(dData + 1);// Pegar Dia Posterior. 2a feira
      end
      else
         if DayOfWeek(dData) = 7
         then begin// Se Dia da Semana for Sábado
            if sAnterior = 'A'
            then sData := DateToStr(dData - 1) // Pegar Dia Anterior. 6a. feira
            else sData := DateToStr(dData + 2);// Pegar Dia Posterior 2a. feira
         end
         else sData := DateToStr(dData);//Dia da Semana é Dia Útil
  end  
  else begin // DIA UTIL Ex.: se DIA = 5, pega 5° Dia Útil do mes

     sDiaUtil := DiaUtil(sDia, sMesAno); //Chama funcao que retorna o dia util
     // Função que retorna o ene-ésimo dia útil de um determinado mês
   
     if Length(sDiaUtil) = 1
     then sDiaUtil := '0' + sDiaUtil;
     sData := sDiaUtil + '/' + sMesAno;
  end; 

  if (StrToInt(Copy(sMesAno,1,2)) = 2) and (StrToInt(Copy(sData,1,2)) >= 29)
  then sData := '28/'+sMesAno;

  Result := sData;
end;

end.


