{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
N.WO............: WO30552
Data............: 13/01/2026
Responsável.....: Paulo Nobre
Descrição.......: Nas funções: ListaContratoANS e GetVlrANSTotal, comentado
                  codigo SQL inútil e colocando CAST na coluna OBS.
--------------------------------------------------------------------------------
SIG.............: SIG53174
Data............: 28/08/2017
Responsável.....: Fernando Xavier
Descrição.......: Ao realizar o aditamento reiniciando as parcelas do contrato,
                  as informações de ANS não são exibidas em tela..
--------------------------------------------------------------------------------
N. Sol..........: 242313/17289
N. PPM..........: 828977
Data............: 19/06/2015
Responsável.....: Felipe A. Santos
Descrição.......: criação da Control.
--------------------------------------------------------------------------------}

unit uCtrlContratoANS;

interface

uses SysUtils, uCmControlObject, uCmDbObject, uSistema, DB, uDataBase, DbClient,
     uCMTypes, uCMClientDataSet;

type

  TCtrlContratoANS = class(TCmControlObject)
  private

  protected

  public
    function ListaContratoANS(IdContrato : Double; bMedicao : boolean = False) : OleVariant;
    function GetVlrANSTotal(IdContrato: Double; bMedicao : boolean = False) : Double;
  end;

implementation

{ TCtrlContratoANS }


function TCtrlContratoANS.GetVlrANSTotal(
  IdContrato: Double; bMedicao : boolean = False): Double;
var
  sSQL : string;
begin
  sSQL := 'SELECT SUM(VLRANS) AS TOTAL ' +
          '  FROM ( ' +
          '        SELECT CONTRANS.IDANS, ' +
          '               CONTRANS.IDCONTRATO, ' +
          '               CONTRANS.IDMEDICAO, ' +
          '               CONTRANS.VLRMENSAL, ' +
                  '       CONTRANS.VLRANS, ' +
          '               CONTRANS.NUMCI, ' +
          '               CONTRANS.NUMDOCUMENTO, ' +
          '               CONTRANS.REFERENCIA, ' +
          '               CAST(SUBSTR(CONTRANS.OBS, 1, 255) AS VARCHAR2(255)) AS OBS, ' +
          '               CONTRANS.DTLANCTO, ' +
          '               0 AS IDOBJETO, ' +
          '               0 AS IDITEM,' +
          '               0 AS PARCELANUM ' +
          '          FROM CONTRATOANS CONTRANS, MEDICAO M ' +
          // Paulo Nobre - WO30552 - Inicio
  //        '                (SELECT MAX(TRGDTINCLUSAO) DTINCLU ' +
  //        '                   FROM CTRLPARCELAMEDICAO ' +
  //        '                  WHERE IDCONTRATO = ' + FloatToStr(IdContrato) +' ) MAXDTINCLUSAO ' +
          // Paulo Nobre - WO30552 - Fim
          '         WHERE CONTRANS.IDCONTRATO = ' + FloatToStr(IdContrato) ;
          //'           AND CONTRANS.TRGDTINCLUSAO > NVL(MAXDTINCLUSAO.DTINCLU, TO_DATE(CONTRANS.TRGDTINCLUSAO -1))'; //SIG53174


          if bMedicao then
             sSQL := sSQL + ' AND CONTRANS.IDMEDICAO = M.IDMEDICAO '
          else
             sSQL := sSQL + ' AND CONTRANS.IDMEDICAO = M.IDMEDICAO(+) ';

          sSQL := sSQL +
          '           AND NVL(M.FLGESTORNADO, 0) = 0) ';

  _Cds.Data := GetDataPacket(sSQL);

  Result := _Cds.FieldByName('TOTAL').AsFloat;

  _Cds.EmptyDataSet;
end;

function TCtrlContratoANS.ListaContratoANS(
  IdContrato: Double; bMedicao : boolean = False): OleVariant;
var
  sSQL : string;
begin
  //William Moreira da Silva - SIG 37493
  sSQL := 'SELECT CONTRANS.IDANS, ' +
          '       CONTRANS.IDCONTRATO, ' +
          '       CONTRANS.IDMEDICAO, ' +
          '       CONTRANS.VLRMENSAL, ' +
          '       CONTRANS.VLRANS, ' +
          '       CONTRANS.NUMCI, ' +
          '       CONTRANS.NUMDOCUMENTO, ' +
          '       CONTRANS.REFERENCIA, ' +
          '       CAST(SUBSTR(CONTRANS.OBS, 1, 255) AS VARCHAR2(255)) AS OBS, ' +
          '       CONTRANS.DTLANCTO, ' +
          '       0 AS IDOBJETO, ' +
          '       0 AS IDITEM,' +
          '       0 AS PARCELANUM, ' +
          '       M.IDMEDICAO ' +
          ' FROM CONTRATOANS CONTRANS, MEDICAO M ' +
          // Paulo Nobre - WO30552 - Inicio
  //        '       (SELECT MAX(TRGDTINCLUSAO) DTINCLU ' +
   //       '          FROM CTRLPARCELAMEDICAO ' +
  //        '         WHERE IDCONTRATO = ' + FloatToStr(IdContrato) +' ) MAXDTINCLUSAO ' +
          // Paulo Nobre - WO30552 - Fim  
          'WHERE CONTRANS.IDCONTRATO = ' + FloatToStr(IdContrato) ;
          //'  AND CONTRANS.TRGDTINCLUSAO > NVL(MAXDTINCLUSAO.DTINCLU, TO_DATE(CONTRANS.TRGDTINCLUSAO -1))'; //SIG53174

          if bMedicao then
             sSQL := sSQL + ' AND CONTRANS.IDMEDICAO = M.IDMEDICAO '
          else
             sSQL := sSQL + ' AND CONTRANS.IDMEDICAO = M.IDMEDICAO(+) ';

          sSQL := sSQL + 
          '   AND NVL(M.FLGESTORNADO, 0) = 0 ';

  Result := GetDataPacket(sSQL);
end;


end.
