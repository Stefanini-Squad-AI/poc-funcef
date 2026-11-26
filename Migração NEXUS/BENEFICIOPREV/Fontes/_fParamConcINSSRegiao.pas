unit fParamConcINSSRegiao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Mask, DBCtrls, Db, DBTables, wwdblook, Wwdatsrc;

type
  TfrmParamConcINSSRegiao = class(TfrmOkCancelar)
    qryEstado: TQuery;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    edMesCobIni: TMaskEdit;
    edMesCobFim: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    dsEstado: TwwDataSource;
    dblkpEstado: TwwDBLookupCombo;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamConcINSSRegiao: TfrmParamConcINSSRegiao;

implementation

{$R *.DFM}

Uses DRelatBeneficios;

procedure TfrmParamConcINSSRegiao.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  //
  With DtmRelatBeneficios Do
  Begin
    qryConcInssRegiao.Sql.Clear;
    qryConcInssRegiao.Sql.Add(
      ' SELECT UF.SINONIMO,                                                     '+
      ' E.CODESTADO||'' - ''||E.NOMEESTADO AS UFCONCESSOR,                      '+
      ' D.MESREFERENCIA,                                                        '+
      ' SUM(DECODE(PD.FLGDESCONTO,0,VALORINSS, - VALORINSS)) AS VALORINSS,      '+
      ' SUM(DECODE(PD.FLGDESCONTO,0,VALORMANT, - VALORMANT)) AS VALORMANT,      '+
      ' SUM(DECODE(PD.FLGDESCONTO,0,VALORINSS, - VALORINSS)) -                  '+
      '         SUM(DECODE(PD.FLGDESCONTO,0,VALORMANT, - VALORMANT)) AS DIF     '+
      ' FROM DETCONCINSS D, PROVDESC PD, UFINSS UF, ESTADO E                    '+
      ' WHERE D.CODMANTENEDORINSS = UF.CODORGAOLOCAL                            '+
      '   AND D.IDRUBRICA = PD.IDPROVENTO                                       '+
      '   AND UF.SIGLA = E.CODESTADO                                            ');

    If Trim(dblkpEstado.Text) <> '' Then
      qryConcInssRegiao.Sql.Add(
        ' AND UF.SIGLA = ' + QuotedStr(qryEstado.FieldByName('CODESTADO').AsString));

    If Trim(edMesCobIni.Text) <> '/' Then
      qryConcInssRegiao.Sql.Add(
        ' AND D.MESREFERENCIA >= ' + QuotedStr(edMesCobIni.Text));

    If Trim(edMesCobFim.Text) <> '/' Then
      qryConcInssRegiao.Sql.Add(
        ' AND D.MESREFERENCIA <= ' + QuotedStr(edMesCobFim.Text));

    qryConcInssRegiao.Sql.Add(
      ' GROUP BY UF.SINONIMO, E.CODESTADO||'' - ''||E.NOMEESTADO , D.MESREFERENCIA');


  End;

end;

procedure TfrmParamConcINSSRegiao.FormShow(Sender: TObject);
begin
  inherited;
  qryEstado.Open;
end;

end.

