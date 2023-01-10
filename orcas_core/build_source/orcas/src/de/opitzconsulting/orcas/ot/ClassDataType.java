package de.opitzconsulting.orcas.ot;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

public class ClassDataType extends ClassData
{
  private static String _typePrefix = "syex";

  private String _javaName;
  private boolean _isListNeeded;
  private boolean _isHasSubclasses;
  private List<FieldData> _filedDataList = new ArrayList<FieldData>();
  private List<EnumData> _enumDataList = null;
  private Class _superclass;

  public static void setTypePrefix( String pTypePrefix )
  {
    _typePrefix = pTypePrefix;
  }

  public static String getTypePrefix()
  {
    return _typePrefix;
  }

  public boolean isListNeeded()
  {
    return _isListNeeded;
  }

  public void setListNeeded( boolean pIsListNeeded )
  {
    _isListNeeded = pIsListNeeded;
  }

  public boolean isHasSubclasses()
  {
    return _isHasSubclasses;
  }

  public void setHasSubclasses( boolean pIsHasSubclasses )
  {
    _isHasSubclasses = pIsHasSubclasses;
  }

  public ClassDataType( String pJavaName )
  {
    _javaName = pJavaName;
  }

  public Class getSuperclass()
  {
    return _superclass;
  }

  public List<FieldData> getFiledDataList()
  {
    Collections.sort( _filedDataList, new Comparator<FieldData>()
    {
      public int compare( FieldData pO1, FieldData pO2 )
      {
        return pO1.getJavaName().compareTo( pO2.getJavaName() );
      }
    } );

    return new ArrayList<FieldData>( _filedDataList );
  }

  public void addFiledDataList( FieldData pFiledData )
  {
    _filedDataList.add( pFiledData );
  }

  @Override
  public String toString()
  {
    String lReturn = _javaName + " FieldCount: " + _filedDataList.size();

    for( FieldData lFieldData : _filedDataList )
    {
      lReturn += "\n";
      lReturn += lFieldData.toString();
    }

    return lReturn;
  }

  public String getJavaName()
  {
    return _javaName;
  }

  public String getMaxLengthName()
  {
    int lMaxLength = 30 - ("ct_" + _typePrefix + "_").length() - "_list".length();

    if( _javaName.toLowerCase().length() > lMaxLength )
    {
      return _javaName.toLowerCase().substring( 0, lMaxLength );
    }
    else
    {
      return _javaName.toLowerCase();
    }
  }

  public String getSqlName()
  {
    return "ot_" + _typePrefix + "_" + getMaxLengthName();
  }

  @Override
  public String getPlainSqlName()
  {
    return getSqlName();
  }

  public String getSqlNameCollection()
  {
    return "ct_" + _typePrefix + "_" + getMaxLengthName() + "_list";
  }

  public String getJavaNameCollection()
  {
    return "List<" + _javaName + ">";
  }

  public String getDiffSqlName()
  {
    return "od_" + _typePrefix + "_" + getMaxLengthName();
  }

  public String getDiffJavaName()
  {
    return _javaName + "Diff";
  }

  public String getMergeSqlName()
  {
    return "om_" + _typePrefix + "_" + getMaxLengthName();
  }

  public String getMergeJavaName()
  {
    return _javaName + "Merge";
  }

  public String getDiffSqlNameCollection()
  {
    return "cd_" + _typePrefix + "_" + getMaxLengthName() + "_list";
  }

  public String getDiffJavaNameCollection()
  {
    return "List<" + getDiffJavaName() + ">";
  }

  public String getSqlDummyFieldName()
  {
    return "i_dummy_" + getMaxLengthName();
  }

  public void setSuperclass( Class pSuperclass )
  {
    _superclass = pSuperclass;
  }

  public boolean isEnum()
  {
    return _enumDataList != null;
  }

  public void setupEnum( List<EnumData> pEnumDataList )
  {
    _enumDataList = pEnumDataList;
  }

  public List<EnumData> getEnumData()
  {
    return _enumDataList;
  }

  @Override
  public boolean isAtomicValue()
  {
    return isEnum();
  }

}
