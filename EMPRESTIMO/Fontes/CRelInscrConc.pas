unit CRelInscrConc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CRel, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr,
  TB97, ExtCtrls, mInscricaoEmptmo, wwdbdatetimepicker, CheckLst,
  CMDateTimePicker, fcCombo, fcColorCombo, wwdblook, mListaPlano,
  mListaPatro;

type
  TcfgRelInscrConc = class(TcfgRel)
    rgOrdenar: TRadioGroup;
    GroupBox1: TGroupBox;
    chkCorLinha: TCheckBox;
    cboCorLinha: TfcColorCombo;
    chkLinhas: TCheckBox;
    Label1: TLabel;
    Label2: TLabel;
    DBcboTipoEmptmo: TwwDBLookupCombo;
    DBcboTipoContrato: TwwDBLookupCombo;
    Panel1: TPanel;
    Label5: TLabel;
    Label3: TLabel;
    edtDataIni: TCMDateTimePicker;
    edtDataFim: TCMDateTimePicker;
    molListaPatro: TmolListaPatro;
    molListaPlano: TmolListaPlano;

    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure molListaPatrobtnInvertePatroClick(Sender: TObject);
    procedure molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
    procedure molListaPlanobtnInvertePlanoClick(Sender: TObject);
    procedure molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);

  private { Private declarations }

    (* Preenche Periodo de datas com a data atual *)
    procedure PreencheDatas;

    function MontaSelectInscrConc (const idInscricao : Int64;
         const sOrdenar : String; const sDataIni, sDataFim : String ): String;




  public { Public declarations }

  end;



var
  cfgRelInscrConc: TcfgRelInscrConc;



implementation
{$R *.DFM}
uses
   DLookEmptmo,
   UDiasUteis,
   USistema,
   UfuncoesEmptmo,
   dRelInscrConc, dRelContrConc;



procedure TcfgRelInscrConc.PreencheDatas;
begin
  edtDataIni.Date := Date;
  edtDataFim.Date := Date;
end;





procedure TcfgRelInscrConc.FormShow(Sender: TObject);
begin
   inherited;

   (* Preenche a listbox de patrocinadoras... *)
   molListaPatro.PreenchePatro;
   (* ...e marca todas por default *)
   molListaPatrobtnMarcaTodosPatroClick(self);

   (* Preenche a listbox de Planos... *)
   molListaPlano.PreenchePlano;
   (* ...e marca todos por default *)
   molListaPlanobtnMarcaTodosPlanoClick(self);
end;



function TcfgRelInscrConc.MontaSelectInscrConc (const idInscricao : Int64;
   const  sOrdenar : String; const sDataIni, sDataFim : String ): String;
var
  sSql  : String;
begin
   sSql :=  ' SELECT  INSC.IDINSCRICAOEMPTMO ,                        ' +
            '         PESS.NOME AS BENEFICIARIO,                      ' +
            '         PPAT.NOME AS PATROCINADORA,                     ' +
            '         PPLA.NOME AS PLANO,                             ' +
            '         IDCBANCARIA,                                    ' +
            '         FLGSITUACAO,                                    ' +
            '         FLGFORMAPAG,                                    ' +
            '         DATAINSC,                                       ' +
            '         VLRSOLIC,                                       ' +
            '         NUMPARCELAS                                     ' +
            '                                                         ' +
            '  FROM   PESSOA           PESS,                          ' +
            '         PESSOA           PPAT,                          ' +
            '         PESSOA           PPLA,                          ' +
            '         INSCRICAOEMPTMO  INSC,                          ' +
            '         (                                               ' +
            '          SELECT IDINSCRICAOEMPTMO FROM INSCRICAOEMPTMO  ' +
            '          MINUS                                          ' +
            '          SELECT IDINSCRICAOEMPTMO FROM CONTRATOEMPTMO   ' +
            '         )                INSR                           ' +
            '                                                         ' +
            '  WHERE  INSC.IDINSCRICAOEMPTMO = INSR.IDINSCRICAOEMPTMO ' ;
   if idInscricao > 0 then
      sSql := sSql + ' AND (INSC.IDINSCRICAOEMPTMO = ' + IntToStr(idInscricao) + ')' ;

      sSql := sSql + ' AND (INSC.IDPATRO     IN ('+ molListaPatro.PegaPatro +'))';
      sSql := sSql + ' AND (INSC.IDPLANOPREV IN ('+ molListaPlano.PegaPlano +'))' ;

   if sDataIni <> '' then
      sSql := sSql + ' AND (DATAINSC BETWEEN (''' + sDataIni + ''') AND (''' + sDataFim + '''))';


   sSql := sSql +
           '     AND INSC.IDPESSOA          = PESS.IDPESSOA          ' +
           '     AND INSC.IDPATRO           = PPAT.IDPESSOA          ' +
           '     AND INSC.IDPLANOPREV       = PPLA.IDPESSOA          ' +
           ' ORDER BY ' + sOrdenar                                     ;

   Result := sSql ;
end;



procedure TcfgRelInscrConc.bbtnConfirmarClick(Sender: TObject);
var
  sPatro, sPlano,  sSql, sOrdena  : String;
begin

   if rgOrdenar.ItemIndex = 0 then
      sOrdena := ' INSC.IDINSCRICAOEMPTMO '
   else
      sOrdena := ' BENEFICIARIO           ' ;

   sSql := MontaSelectInscrConc(-1, sOrdena, edtDataIni.Text, edtDataFim.Text);

   dtmRelInscrConc.DataIniInsc := edtDataIni.Text;
   dtmRelInscrConc.DataFimInsc := edtDataFim.Text;
   dtmRelInscrConc.IsCorLinha  := chkCorLinha.Checked;
   dtmRelInscrConc.CorLinha    := cboCorLinha.SelectedColor;


   dtmRelInscrConc.cdsInscrConc.Close;
   dtmRelInscrConc.qryInscrConc.Close;
   dtmRelInscrConc.qryInscrConc.SQL.Clear;
   dtmRelInscrConc.qryInscrConc.SQL.Text := sSql;

   dtmRelInscrConc.cdsInscrConc.Open;

   inherited;
end;



procedure TcfgRelInscrConc.molListaPatrobtnInvertePatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnInvertePatroClick(Sender);
end;



procedure TcfgRelInscrConc.molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnMarcaTodosPatroClick(Sender);
end;



procedure TcfgRelInscrConc.molListaPlanobtnInvertePlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnInvertePlanoClick(Sender);
end;



procedure TcfgRelInscrConc.molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
begin
   inherited;
   molListaPlano.btnMarcaTodosPlanoClick(Sender);
end;



end.
